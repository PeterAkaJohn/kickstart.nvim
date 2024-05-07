return {
  'nvim-neotest/neotest-python',
  'nvim-neotest/neotest-go',
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
      'nvim-neotest/neotest-go',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python',
          require 'neotest-go',
          require 'rustaceanvim.neotest',
        },
      }
      vim.keymap.set('n', '<leader>crst', function()
        require('neotest').run.run()
      end, { desc = '[C]ode [R]un [S]ingle [T]est' })
      vim.keymap.set('n', '<leader>crtf', function()
        require('neotest').run.run(vim.fn.expand '%')
      end, { desc = '[C]ode [R]un [T]est [F]ile' })
      vim.keymap.set('n', '<leader>cdt', function()
        require('neotest').run.run { strategy = 'dap' }
      end, { desc = '[C]ode [D]ebug [T]est [F]ile' })
    end,
  },
}
