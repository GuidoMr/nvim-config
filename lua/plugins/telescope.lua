require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "%.git/",
            "node_modules/",
        },
    },
})

require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>ff",
    "<cmd>Telescope find_files<CR>")

vim.keymap.set("n", "<leader>fg",
    "<cmd>Telescope live_grep<CR>")

vim.keymap.set("n", "<leader>fb",
    "<cmd>Telescope buffers<CR>")
