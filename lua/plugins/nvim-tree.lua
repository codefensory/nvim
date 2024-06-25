return {
  'nvim-tree/nvim-tree.lua',
  enabled = true,
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- custom mappings
      -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', 'sh', '<C-w>h', opts('Go left'))
      vim.keymap.set('n', 'sl', '<C-w>l', opts('Go right'))
      vim.keymap.set('n', '<C-t>',
        function() api.tree.change_root_to_node({ node = api.tree.get_node_under_cursor() }) end,
        opts('Change Root'))
    end

    require('nvim-tree').setup({
      on_attach = my_on_attach,
      disable_netrw = true,
      respect_buf_cwd = true,
      view = {
        width = 45,
        side = 'right'
      }
    })
  end,
  keys = {
    {
      'sa',
      function() require('nvim-tree.api').tree.open({ find_file = true, update_root = true }) end,
      desc = "Open explorer"
    }
  }
}
