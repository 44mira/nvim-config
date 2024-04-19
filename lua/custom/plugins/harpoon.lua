-- Blazingly fast project marks

return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('harpoon').setup {}

    require('telescope').load_extension 'harpoon'

    local bind = vim.keymap.set

    -- Mark creation and finding
    bind('n', '<leader>m', require('harpoon.mark').add_file, { desc = '[M]ake mark' })
    bind('n', '<leader>o', require('harpoon.ui').toggle_quick_menu, { desc = '[O]pen marks' })
    bind('n', '<leader>sm', '<cmd>Telescope harpoon marks<CR>', { desc = '[S]earch [M]arks' })

    -- Scroll through marks
    bind('n', '<leader><M-j>', require('harpoon.ui').nav_prev, { desc = 'Jump to previous mark' })
    bind('n', '<leader><M-k>', require('harpoon.ui').nav_next, { desc = 'Jump to next mark' })

    -- Jump through marks like tabs
    for i = 1, 9 do
      bind('n', ('<leader><M-%d>'):format(i), function()
        require('harpoon.ui').nav_file(i)
      end, { desc = ('Jump to mark [%d]'):format(i) })
    end
  end,
}
