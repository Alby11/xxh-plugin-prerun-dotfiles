local mapkey = require("util.keymapper").mapvimkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Directory Navigatio}n
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<C-Up>", "resize +2", "n")
mapkey("<C-Down>", "resize -2", "n")
mapkey("<C-Left>", "vertical resize +2", "n")
mapkey("<C-Right>", "vertical resize -2", "n")

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Notes
mapkey("<leader>ng", "Neorg workspace general", "n")
mapkey("<leader>nw", "Neorg workspace work", "n")
mapkey("<leader>ny", "Neorg workspace youtube", "n")

-- Indenting
Mapv("v", "<", "<gv", { silent = true, noremap = true })
Mapv("v", ">", ">gv", { silent = true, noremap = true })

-- Zen Mode
Map("n", "<leader>zn", ":TZNarrow<CR>", {})
Map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
Map("n", "<leader>sm", ":TZFocus<CR>", {})
Map("n", "<leader>zm", ":TZMinimalist<CR>", {})
Map("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- ESC to normal mode
Map("v", "kj", [[<Esc>]], MapOpts)
Map("i", "kj", [[<Esc>]], MapOpts)
Map("t", "kj", [[<C-\><C-n>]], MapOpts)

mapkey("<leader>qw", "w")
mapkey("<leader>qW", "w!")
mapkey("<leader>qq", "q")
mapkey("<leader>qQ", "q!")
mapkey("<leader>qa", "qa")
mapkey("<leader>qA", "qa!")

mapkey("<leader>so", "so %", "n", { desc = "Source current buffer" })
