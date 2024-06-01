local u = require "modules.util"
local noremap = u.noremap
local nnoremap = u.nnoremap
local inoremap = u.inoremap
local tnoremap = u.tnoremap
local vnoremap = u.vnoremap

-- Better movement between windows
nnoremap("<C-h>", "<C-w><C-h>", { desc = "Go to the left window" })
nnoremap("<C-l>", "<C-w><C-l>", { desc = "Go to the right window" })
nnoremap("<C-j>", "<C-w><C-j>", { desc = "Go to the bottom window" })
nnoremap("<C-k>", "<C-w><C-k>", { desc = "Go to the top window" })

-- Resize buffer easier
nnoremap("<Left>", ":vertical resize +2<CR>", {
  desc = "Resize buffer to the left",
})
nnoremap("<Right>", ":vertical resize -2<CR>", {
  desc = "Resize buffer to the right",
})
nnoremap("<Up>", ":resize +2<CR>", {
  desc = "Resize buffer to the top",
})
nnoremap("<Down>", ":resize -2<CR>", {
  desc = "Resize buffer to the bottom",
})

-- barbar.nvim
nnoremap("<A-,>", "<CMD>BufferPrevious<CR>")
nnoremap("<A-.>", "<CMD>BufferNext<CR>")

vnoremap("<", "<gv", { desc = "Dedent current selection" })
vnoremap(">", ">gv", { desc = "Indent current selection" })

nnoremap("<A-r>", "<CMD>source $MYVIMRC<CR>", { desc = "Reload vim" })

nnoremap("j", "gj", {
  desc = "Move down by visual line on wrapped lines",
})
nnoremap("k", "gk", {
  desc = "Move up by visual line on wrapped lines",
})

-- Telescope
nnoremap("<M-f>f", "<Cmd>Telescope find_files<CR>", { desc = "Telescope [F]ind [F]iles"})
nnoremap("<M-f>h", "<Cmd>Telescope find_files hidden=true<CR>", { desc = "Telescope [F]ind Files [H]idden"})
nnoremap("<M-f>b", "<Cmd>Telescope buffers<CR>", { desc = "Telescope [F]ind [B]uffer"})

--
-- Show line diagnostics
nnoremap("<Leader>r", '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>')

-- Open local diagnostics in local list
nnoremap("<Leader>I", "<Cmd>lua vim.diagnostic.setloclist()<CR>")

-- Delete buffer
nnoremap("<A-w>", ":bd<CR>")
