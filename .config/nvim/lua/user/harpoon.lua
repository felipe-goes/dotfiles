local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  vim.notify("Missing harpoon: harpoon.lua")
  return
end

harpoon:setup()

-- basic telescope configuration
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<c-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<m-y>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<m-u>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<m-i>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<m-o>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<c-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<c-N>", function() harpoon:list():next() end)

-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })
