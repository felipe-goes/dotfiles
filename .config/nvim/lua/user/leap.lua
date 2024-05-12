local status_ok, leap = pcall(require, "leap")
if not status_ok then
  vim.notify("Missing leap: leap.lua")
  return
end

local user = require("leap.user")

leap.create_default_mappings()

-- Define equivalence classes for brackets and quotes, in addition to
-- the default whitespace group.
leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

-- Override some old defaults - use backspace instead of tab (see issue #165).
leap.opts.special_keys.prev_target = '<backspace>'
leap.opts.special_keys.prev_group = '<backspace>'

-- Use the traversal keys to repeat the previous motion without explicitly
-- invoking Leap.
user.set_repeat_keys('<enter>', '<backspace>')
