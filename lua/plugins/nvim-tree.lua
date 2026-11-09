require("nvim-tree").setup({
    view = {
        width = 32,
        side = "left",
    },

    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
    },

    filters = {
        dotfiles = false,
    },

    git = {
        enable = true,
    },

    diagnostics = {
        enable = true,
    },

    update_focused_file = {
        enable = true,
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>",
    { desc = "Toggle file explorer" })

vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
