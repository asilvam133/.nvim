return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<C-a>', function() require('harpoon.mark').add_file() end,        mode = 'n', desc = 'Harpoon: [A]dd file' },
    { '<C-e>', function() require('harpoon.ui').toggle_quick_menu() end, mode = 'n', desc = 'Harpoon: [E]xplore files' },
    { '<C-h>', function() require('harpoon.ui').nav_file(1) end,         mode = 'n', desc = 'Harpoon: [1] file' },
    { '<C-t>', function() require('harpoon.ui').nav_file(2) end,         mode = 'n', desc = 'Harpoon: [2] file' },
    { '<C-n>', function() require('harpoon.ui').nav_file(3) end,         mode = 'n', desc = 'Harpoon: [3] file' },
    { '<C-s>', function() require('harpoon.ui').nav_file(4) end,         mode = 'n', desc = 'Harpoon: [4] file' },
  }
}
