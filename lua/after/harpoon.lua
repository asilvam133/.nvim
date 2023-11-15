-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-a>", mark.add_file, { desc = 'Harpoon: [A]dd file' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Harpoon: [E]xplore files' })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = 'Harpoon: [1] file' })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = 'Harpoon: [2] file' })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = 'Harpoon: [3] file' })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = 'Harpoon: [4] file' })
