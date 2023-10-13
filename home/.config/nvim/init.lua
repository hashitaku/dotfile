local options = {
    cursorline = true,
    encoding = "utf-8",
    expandtab = true,
    fileencoding = "utf-8",
    fileencodings = "utf-8,sjis",
    fileformat = "unix",
    fileformats = "unix,dos",
    fillchars = "vert:\u{2502},fold:-,eob:\u{20}",
    helplang = "ja,en",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    laststatus = 3,
    list = true,
    number = true,
    pumblend = 5,
    pumheight = 10,
    relativenumber = true,
    shiftwidth = 4,
    signcolumn = "number",
    smartcase = true,
    smartindent = true,
    smarttab = true,
    splitbelow = true,
    splitright = true,
    tabstop = 4,
    termguicolors = true,
    updatetime = 500,
    virtualedit = "block,onemore",
    wildmenu = true,
    wildmode = "longest,full",
    wildoptions = "pum",
}

-- https://github.com/vscode-neovim/vscode-neovim/issues/1369
if not vim.g.vscode then
    options.winblend = 10
end

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.mapleader = " "
vim.keymap.set("n", "<Esc><Esc>", function()
    vim.api.nvim_command("nohlsearch")
end, {})
vim.keymap.set("n", "<Leader>n", function()
    vim.api.nvim_command("setlocal relativenumber!")
end, {})
vim.keymap.set("n", "<C-k>", function()
    vim.api.nvim_command("echo &updatetime")
end, {})

vim.g["loaded_gzip"] = 1
vim.g["loaded_netrw"] = 1
vim.g["loaded_netrwPlugin"] = 1
vim.g["loaded_tar"] = 1
vim.g["loaded_tarPlugin"] = 1
vim.g["loaded_zip"] = 1
vim.g["loaded_zipPlugin"] = 1
vim.api.nvim_command("packadd! termdebug")
vim.api.nvim_command("packadd! matchit")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugin", {
    ui = {
        size = {
            width = 0.7,
            height = 0.7,
        },
        border = "rounded",
    },
})

--vim.api.nvim_command('colorscheme chester')
vim.api.nvim_command("colorscheme tokyonight")
