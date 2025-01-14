local dependencies = {
  "rcarriga/nvim-notify",   -- optional
  "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect }
  {
    "hrsh7th/nvim-cmp",
    config = function ()
      local cmp = require "cmp"
      local compare = cmp.config.compare

      cmp.setup {
        sources = {
          { name = "jupynium", priority = 1000 },  -- consider higher priority than LSP
          { name = "nvim_lsp", priority = 100 },
        },
        sorting = {
          priority_weight = 1.0,
          comparators = {
            compare.score,            -- Jupyter kernel completion shows prior to LSP
            compare.recently_used,
            compare.locality,
          },
        },
      }
    end
  }

}

return {
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    dependencies = dependencies,
  }
}
