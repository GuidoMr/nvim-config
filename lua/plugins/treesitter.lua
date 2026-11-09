require("nvim-treesitter").setup()

require("nvim-treesitter").install({
    "c",
    "cpp",
    "lua",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "glsl",
    "python",
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        local ft = vim.bo[ev.buf].filetype

        -- Ignore Telescope buffers
        if ft:match("^Telescope") then
            return
        end

        -- Start Treesitter if possible
        pcall(vim.treesitter.start, ev.buf)
    end,
})
