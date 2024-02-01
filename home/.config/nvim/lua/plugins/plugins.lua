-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" },


  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      -- -- Function to execute a shell command and capture its output
      -- -- to get the current user@hostname
      -- local function execute_command(command)
      --     local handle = io.popen(command)
      --     local result = handle:read("*a")
      --     handle:close()
      --     return result
      -- end
      -- -- Get the username
      -- local username = execute_command("whoami"):gsub("\n", "")
      -- -- Get the hostname
      -- local hostname = execute_command("hostname"):gsub("\n", "")
      -- -- Get current working directory
      -- local current_directory = vim.fn.getcwd()
      --
      -- local logo = [[
      --     ╔══════════════════════════════════════════════════════════════════════════════════════════╗
      --     ║    __  __            _____  __ __         __  _                                          ║
      --     ║  / / / /__ ___ ____/ ___ \/ // /__  ___ / /_(_)                                          ║
      --     ║  / /_/ (_-</ -_) __/ / _ `/ _  / _ \(_-</ __/  ]] .. username .. '@' .. hostname .. [[   ║
      --     ║  \____/___/\__/_/  \ \_,_/_//_/\___/___/\__(_)                                           ║
      --     ║                    \___/                                                                 ║
      --     ║                _____          ___                                                        ║
      --     ║              / ___/    _____/ (_)                                                        ║
      --     ║              / /__| |/|/ / _  /  ]] .. current_directory .. [[                           ║
      --     ║              \___/|__,__/\_,_(_)                                                         ║
      --     ║                                                                                          ║
      --     ║                                                                                          ║
      --     ╚══════════════════════════════════════════════════════════════════════════════════════════╝
      -- ]]
      --
      -- logo = string.rep("\n", 8) .. logo .. "\n\n"

      -- Function to execute a shell command and capture its output
      local function execute_command(command)
          local handle = io.popen(command)
          local result = handle:read("*a")
          handle:close()
          return result
      end

      -- Get the username
      local username = execute_command("whoami"):gsub("\n", "")
      -- Get the hostname
      local hostname = execute_command("hostname"):gsub("\n", "")
      -- Get current working directory
      local current_directory = vim.fn.getcwd()
      local opts = {
        -- theme = "doom",
        -- hide = {
        --   -- this is taken care of by lualine
        --   -- enabling this messes up the actual laststatus setting after loading a file
        --   statusline = false,
        -- },
        -- config = {
        --   header = vim.split(logo, "\n"),
        --   -- stylua: ignore
        --   center = {
        --     { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
        --     { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
        --     { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
        --     { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
        --     { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
        --     { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
        --     { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
        --     { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
        --     { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        --   },
        --   footer = function()
        --     local stats = require("lazy").stats()
        --     local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        --     return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        --   end,
        -- },
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
            append = {
                string.format("%s@%s > %s", username, hostname, current_directory),
            },
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' New file',
              group = 'DiagnosticHint',
              action = 'ene | startinsert',
              key = 'n',
            },
            {
              desc = ' Restore session',
              group = 'Constant',
              action = 'lua require("persistence").load()',
              key = 's',
            },
            {
              desc = ' Projects',
              group = 'Property',
              action = 'Telescope projects',
              key = 'p',
            },
            {
              desc = ' Find',
              group = 'Field',
              action = 'Telescope fd',
              key = 'd',
            },
            {
              desc = ' Live grep',
              group = 'Number',
              action = 'Telescope live_grep',
              key = 'g',
            },
            {
              desc = ' Config',
              group = 'Parameter',
              action = '[[lua require("lazyvim.util").telescope.config_files()()]]',
              key = 'c',
            },
            {
              desc = '  Quit',
              group = 'Exception',
              action = 'qa',
              key = 'q',
            },
          },
        },
      }

      -- for _, button in ipairs(opts.config.center) do
      --   button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      --   button.key_format = "  %s"
      -- end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },


  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
    dependencies = {
      "rcarriga/nvim-notify",   -- optional
      "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
      -- override nvim-cmp and add cmp-yanky
      {
        "hrsh7th/nvim-cmp",
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
          local cmp = require("cmp")
          local compare = cmp.config.compare
          table.insert(opts.sources, {
            name = "jupynium",
            priority = 1000,
          })
          table.insert(opts.sorting, {
            priority_weight = 1.0,
            comparators = {
              compare.score,            -- Jupyter kernel completion shows prior to LSP
              compare.recently_used,
              compare.locality,
            }
          })
        end,
      },
    }

  },

  -- yanky and sqlite are managed as LazyVim extras
  -- but you need to initialize yanky on your own
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})
    end,
    dependencies = {
        "hrsh7th/nvim-cmp",
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
          table.insert(opts.sources, {
            name = "cmp_yanky",
            option = {
              -- only suggest items which match the current filetype
              onlyCurrentFiletype = false,
              -- only suggest items with a minimum length
              minLength = 3,
            },
          })
        end,
      },
  },

  -- text edit operators
  {
    "echasnovski/mini.operators",
    version = false,
    config = function()
      require("mini.operators").setup()
    end,
  },
  -- avoid "gr" key conflict between mimi.operators and nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gr", false }
    end,
    keys = {
      { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    },
  },

  -- Suda to sudo
  {
    "lambdalisue/suda.vim",
    keys = {
      -- Save buffer
      { "<leader>Sw", "<cmd>SudaWrite<cr>", { desc = "Suda write", MapOpts } },
      -- Read buffer
      { "<leader>Sr", "<cmd>SudaRead<cr>", { desc = "Suda read", MapOpts } },
    },
    dependencies = {
      "folke/which-key.nvim",
      opts = {
        defaults = {
          mode = { "n", "v" },
          ["<leader>S"] = { name = "+Suda" },
        },
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "awk",
        "bash",
        "diff",
        "dockerfile",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
