return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  },
  config = function()
    pcall(require('telescope').load_extension, 'fzf')

    -- Telescope live_grep in git root
    -- Function to find the git root directory based on the current buffer's path
    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == '' then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
      end

      -- Find the Git root directory from the current file's path
      local git_root =
          vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
      if vim.v.shell_error ~= 0 then
        print('Not a git repository. Searching on current working directory')
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        require('telescope.builtin').live_grep({
          search_dirs = { git_root },
        })
      end
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
  end,
  keys = {
    {
      '<leader>?',
      require('telescope.builtin').oldfiles,
      mode = 'n',
      desc = '[?] Find recently opened files',
    },
    {
      '<leader><space>',
      require('telescope.builtin').buffers,
      mode = 'n',
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(
          require('telescope.themes').get_dropdown({ winblend = 10, previewer = false })
        )
      end,
      mode = 'n',
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>sf',
      require('telescope.builtin').find_files,
      mode = 'n',
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sh',
      require('telescope.builtin').help_tags,
      mode = 'n',
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sw',
      require('telescope.builtin').grep_string,
      mode = 'n',
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      require('telescope.builtin').live_grep,
      mode = 'n',
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sG',
      ':LiveGrepGitRoot<cr>',
      mode = 'n',
      desc = '[S]earch by [G]rep on Git Root',
    },
    {
      '<leader>sd',
      require('telescope.builtin').diagnostics,
      mode = 'n',
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      require('telescope.builtin').resume,
      mode = 'n',
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>sa',
      require('telescope.builtin').git_status,
      mode = 'n',
      desc = '[S]earch Git changes',
    },
  },
}
