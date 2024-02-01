local mapkey = require("util.keymapper").mapvimkey
return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  config = function()
    require("gitsigns").setup()
  end
}
