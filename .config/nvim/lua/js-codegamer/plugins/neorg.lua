return {
  'nvim-neorg/neorg',
  dependencies = {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  opts = {
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {
        config = {
          icon_preset = 'diamond',
        },
      },
      ['core.completion'] = {
        config = {
          engine = 'nvim-cmp',
        },
      },
      ['core.integrations.nvim-cmp'] = {},
      ['core.dirman'] = {
        config = {
          workspaces = {
            notes = '~/notes',
          },
          index = 'index.norg',
          default_workspace = 'notes',
        },
      },
    },
  },
  config = true,
}
