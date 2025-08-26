-- ~/.config/nvim/lua/plugins/init.lua or similar depending on LazyVim structure

return {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"templ", "c_sharp", "go", "lua", "rust", "typescript", "javascript", "html", "css"},
      highlight = { enable = true, disable = {"curl"}, additional_vim_regex_highlighting = false },
    })
  end },

  { "rose-pine/neovim", name = "rose-pine" },
  { "sainnhe/gruvbox-material" },

  {
    "sphamba/smear-cursor.nvim",
      opts = {                                -- Default  Range
      stiffness = 0.8,                      -- 0.6      [0, 1]
      trailing_stiffness = 0.6,             -- 0.45     [0, 1]
      stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
      trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      damping = 0.95,                       -- 0.85     [0, 1]
      damping_insert_mode = 0.95,           -- 0.9      [0, 1]
      distance_stop_animating = 0.5,        -- 0.1      > 0
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("gitsigns").setup() end,
  },

  { "sindrets/diffview.nvim" },
  { "tpope/vim-fugitive" },
  { "nvim-pack/nvim-spectre" },

  {
    "nmac427/guess-indent.nvim",
    config = function() require("guess-indent").setup({}) end,
  },

  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        sections = { lualine_c = { { "filename", path = 1 } } },
      })
    end,
  },

  { "neovim/nvim-lspconfig" },
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  { "nvimtools/none-ls.nvim" },
  { "MunifTanjim/prettier.nvim" },

  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    build = ":UpdateRemotePlugins",
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("harpoon").setup() end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    config = function()
      require("go").setup()
    end,
  },

  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets',  'L3MON4D3/LuaSnip' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'default',
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        -- optional: expand on <CR> too
        ["<CR>"] = { "accept", "snippet_forward", "fallback" },
      },

      snippets = { preset = "luasnip" }, -- hook Blink into LuaSnip

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'FiraCode Nerd Fmonoont'
   
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },


  {
  "seblyng/roslyn.nvim",
  ft = "cs",
  opts = function(_, opts)
    -- override the default roslyn config
    local lspconfig = require("lspconfig")
    -- Configuration will be moved to lsp.lua
    return opts
  end,
},


  {
    "oysandvik94/curl.nvim",
    cmd = { "CurlOpen" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("curl").setup()
    end,
  },

  -- Rose Pine theme config (load at the end)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",
          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",
          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        highlight_groups = {},
        before_highlight = function(group, highlight, palette) end,
      })
    end,
  },
}

