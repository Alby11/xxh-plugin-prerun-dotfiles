return {
  {
    'echasnovski/mini.indentscope',
    version = false,
    enabled = false,
    lazy = false,
    opts = {
      symbol = '|'
    },
    config = function ()
      require("mini.indentscope").setup()
    end,
  },
}
