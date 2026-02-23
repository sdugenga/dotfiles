vim.g.mapleader = " " -- set space as leader to start with

-- Bootstrap lazy.nvim
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

require("lazy").setup({
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({})
    end,
    },
    {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
    },
    {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "filename" },
          lualine_c = {},
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
    })
    end,
    },
})

-- Enable treesitter highlighting
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- transparency settings
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- line length marker colour
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#313244" })

-- basic settings

vim.opt.showmode = true           -- shows -- INSERT -- etc at the bottom
vim.opt.number = true             -- line numbers
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.tabstop = 4               -- tab width
vim.opt.shiftwidth = 4            -- indent width
vim.opt.expandtab = true          -- spaces instead of tabs
vim.opt.wrap = false              -- don't wrap long lines
vim.opt.scrolloff = 8             -- keep 8 lines visible above and below cursor
vim.opt.signcolumn = "yes"        -- always show sign column
vim.opt.termguicolors = true      -- full colour support
vim.opt.colorcolumn = "88"        -- vertical line at 88 characters
vim.opt.clipboard = "unnamedplus" -- allow copying and pasting to global clipboard

-- keymaps
local map = vim.keymap.set

-- move between splits with Ctrl + hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- move selected lines up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor centred when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- clear search highlighting
map("n", "<leader>h", ":nohlsearch<CR>")

-- telescope key bindings
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
