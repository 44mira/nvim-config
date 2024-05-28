return {
  'zbirenbaum/copilot.lua',
  lazy = true,
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    local copilot = require 'copilot'

    copilot.setup {
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
        layout = {
          position = 'right', -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = '<M-l>',
          accept_word = '<M-Right>',
          accept_line = '<M-Down>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
    }

    vim.keymap.set('n', '<leader>cp', '<cmd>Copilot panel<CR>', { desc = 'Open [C]opilot [P]anel' })
    vim.keymap.set('n', '<leader>ct', function()
      require('copilot.suggestion').toggle_auto_trigger()
    end, { desc = 'Toggle [C]opilot Auto-[t]rigger' })
  end,
}
