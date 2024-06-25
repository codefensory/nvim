return {
  {
    "catppuccin/nvim",
    enabled = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        term_colors = true,
        background = {
          light = "latte",
          dark = "mocha",
        },
        color_overrides = {
          mocha = {
            rosewater = "#EA6962",
            flamingo = "#EA6962",
            pink = "#D3869B",
            mauve = "#D3869B",
            red = "#EA6962",
            maroon = "#EA6962",
            peach = "#BD6F3E",
            yellow = "#D8A657",
            green = "#A9B665",
            teal = "#89B482",
            sky = "#89B482",
            sapphire = "#89B482",
            blue = "#7DAEA3",
            lavender = "#7DAEA3",
            text = "#D4BE98",
            subtext1 = "#BDAE8B",
            subtext0 = "#A69372",
            overlay2 = "#8C7A58",
            overlay1 = "#735F3F",
            overlay0 = "#958272",
            surface2 = "#4B4F51",
            surface1 = "#2A2D2E",
            surface0 = "#232728",
            base = "#1D2021",
            mantle = "#191C1D",
            crust = "#151819",
          },
        },
        styles = {
          comments = { "italic" },
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        transparent_background = false,
        show_end_of_buffer = false,
        custom_highlights = function(colors)
          return {
            NormalFloat = { bg = colors.crust },
            FloatBorder = { bg = colors.crust, fg = colors.crust },
            VertSplit = { bg = colors.base, fg = colors.surface0 },
            CursorLineNr = { fg = colors.surface2 },
            Pmenu = { bg = colors.crust, fg = "" },
            PmenuSel = { bg = colors.surface0, fg = "" },
            TelescopeSelection = { bg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.mauve },
            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
            IndentBlanklineChar = { fg = colors.surface0 },
            IndentBlanklineContextChar = { fg = colors.surface2 },
            GitSignsChange = { fg = colors.peach },
            NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
            NvimTreeExecFile = { fg = colors.text },
            IlluminatedWordText = { bg = colors.surface1, fg = "" },
            IlluminatedWordRead = { bg = colors.surface1, fg = "" },
            IlluminatedWordWrite = { bg = colors.surface1, fg = "" },
          }
        end,
      })

      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_transparent_background = 1
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    priority = 1000,
    config = function()
      vim.o.background = ""

      vim.cmd.colorscheme 'kanagawa-dragon'
    end
  },
  {
    "xero/miasma.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    enabled = false,
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      vim.cmd [[colorscheme tokyodark]]
    end,
  },
  {
    'navarasu/onedark.nvim',
    enabled = false,
    priority = 1000,
    lazy = false,

    config = function()
      require('onedark').setup {
        style = 'warm',
      }
      require('onedark').load()
    end,
  },
  {
    "neanias/everforest-nvim",
    enabled = true,
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        on_highlights = function(hl, palette)
          local c1 = palette.bg1
          local c2 = palette.bg2
          local c3 = palette.bg1
          local c4 = palette.bg3

          hl.TelescopeSelection = { bg = c4 }
          hl.TelescopePromptCounter = { fg = palette.fg }
          hl.TelescopePromptPrefix = { bg = c1 }
          hl.TelescopePromptNormal = { bg = c1 }
          hl.TelescopeResultsNormal = { bg = c2 }
          hl.TelescopePreviewNormal = { bg = c3 }
          hl.TelescopePromptBorder = { bg = c1, fg = c1 }
          hl.TelescopeResultsBorder = { bg = c2, fg = c2 }
          hl.TelescopePreviewBorder = { bg = c3, fg = c3 }
          hl.TelescopePromptTitle = { fg = c1, bg = c1 }
          hl.TelescopeResultsTitle = { fg = c2, bg = c2 }
          hl.TelescopePreviewTitle = { fg = c3, bg = c3 }

          hl.Directory = { fg = palette.fg, bg = palette.none }
          hl.Fg = { fg = palette.fg }
        end,

        colours_override = function(palette)
          if vim.o.background == "light" then
            palette.fg = "#7e8186"
            palette.bg_dim = "#f7f7f7"
            palette.bg0 = "#ffffff"
            palette.bg1 = "#f0f0f0"
            palette.bg2 = "#e8e8e8"
            palette.bg3 = "#dadada"
            palette.bg4 = "#cccccc"
            palette.bg5 = "#bbbbbb"
            palette.bg_visual = "#e0e0e0"
            palette.bg_red = "#ffe7de"
            palette.bg_green = "#f3f5d9"
            palette.bg_blue = "#ecf5ed"
            palette.bg_yellow = "#fef2d5"
          else
            local bg_dim = palette.bg_dim

            palette.bg_dim = palette.bg0
            palette.bg0 = bg_dim

            palette.fg = "#a7abb4"
          end
        end
      })

      require("everforest").load()
    end
  }
}
