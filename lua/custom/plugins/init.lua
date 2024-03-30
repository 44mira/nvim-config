-- change this to your absolute path to textblocks.lua
local textblocks = dofile [[C:\Users\Legolas\.config\nvim\textblocks.lua]]

return {
  { 'm4xshen/autoclose.nvim', opts = {} },
  { 'windwp/nvim-ts-autotag', opts = {} },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      view = {
        side = 'right',
      },
    },
  },
  {
    'MeanderingProgrammer/dashboard.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      header = textblocks.header(),
      directories = {
        [[~\.config\nvim]],
        [[~\Desktop\pandora\ACADEMICS\prac]],
        [[C:\Users\Legolas\AppData\Roaming\alacritty]],
      },
      footer = { textblocks.footers() },
      highlight_groups = {
        header = 'bufferLineCurrent',
        icon = 'bufferLineCurrent',
        directory = 'jsParen',
        hotkey = 'AerialOperatorIcon',
        footer = 'jsParen',
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        separator_style = 'slope',
      },
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
