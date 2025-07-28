local fidget = require("fidget")
local util = vim.system or vim.loop.spawn -- compatibility between versions

local compile_commands =
  { "cp", "-f", "./build/release/compile_commands.json", "." }

-- Callback for next_step
function next_step(cmd, next_fn)
  return function()
    run_step(cmd, next_fn)
  end
end

-- Run async command and wait for another
function run_step(cmd, on_done, notify)
  util(cmd, {
    text = true,
    stdout = function(_, data)
      if data and notify then
        notify:report({ message = data })
      end
    end,
    stderr = function(_, data)
      if data and notify then
        notify:report({ message = "Error: " .. data })
      end
    end,
  }, function(obj)
    if obj.code ~= 0 then
      if notify then
        notify:finish({ message = "Failed" })
      end
      return
    end
    if on_done then
      on_done()
    end
  end)
end

-- Generate Build Configuration
function CMakeConfig(fidget_config, config_command, extras)
  local notify = fidget.progress.handle.create(fidget_config)
  local copy = { "cp", "-rf", "./assets", extras }

  if string.find(extras, "release") then
    run_step(
      config_command,
      next_step(
        compile_commands,
        next_step(copy, function()
          notify:finish({ message = "Config Complete!" })
        end)
      ),
      notify
    )
  else
    run_step(
      config_command,
      next_step(copy, function()
        notify:finish({ message = "Config Complete!" })
      end),
      notify
    )
  end
end

-- Build CMake Project
function CMakeBuild(fidget_config, build_path)
  local notify = fidget.progress.handle.create(fidget_config)
  local build_command = { "cmake", "--build", build_path }
  run_step(build_command, function()
    notify:finish({ message = "Build Complete!" })
  end, notify)
end

-- Build CMake Project and send logs to quick fix list
function CMakeBuildMake(build_path)
  vim.cmd("make" .. build_path)
  vim.cmd("Trouble qflist")
end

-- Clean CMake Project
function CMakeClean(fidget_config, build_path)
  local notify = fidget.progress.handle.create(fidget_config)
  local clean_command = { "cmake", "--build", build_path, "--target", "clean" }
  run_step(clean_command, function()
    notify:finish({ message = "Clean Complete!" })
  end, notify)
end
