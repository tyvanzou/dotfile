vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("n", "1", "$")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "<C-u>", "10k")
keymap.set("n", "<C-d>", "10j")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>v", ":vsp<CR>", opt)
keymap.set("n", "<leader>h", ":sp<CR>", opt)

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-n>", ":bn<CR>", opt)
keymap.set("n", "<C-p>", ":bp<CR>", opt)
keymap.set("n", "<C-w>", ":bd<CR>", opt)
keymap.set("n", "<C-o>", "<C-w>o", opt) -- close others

-- 文件
keymap.set("n", "<C-s>", ":w\n")
keymap.set("n", "<C-a>", "gg^vG$")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- lsp
keymap.set("n", "<leader>q", ":lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>lr", ":LspRestart<CR>")

-- code runner
keymap.set("n", "<C-M-n>", ":RunCode<CR>")
keymap.set("v", "<C-M-n>", ":RunCode<CR>")
-- sniprun
keymap.set("n", "<C-r>", ":SnipRun<CR>")
keymap.set("v", "<C-r>", ":SnipRun<CR>")

-- debug
keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>d", ":lua require'dap'.continue()<CR>")
keymap.set("n", "<leader>si", ":lua require'dap'.step_into()<CR>")
keymap.set("n", "<leader>so", ":lua require'dap'.step_over()<CR>")

-- term
-- keymap.set("t", "<A-q>", "<C-\\><C-n>:ToggleTerm<CR>")
-- keymap.set("n", "<A-q>", ":ToggleTerm<CR>")

-- formatter
keymap.set("n", "<S-A-f>", ":Format<CR>")

-- TODO
keymap.set("n", "<leader>do", ":TodoLocList<CR>")
