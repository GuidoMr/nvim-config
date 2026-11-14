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

require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
        selection_modes = {
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
        },
    },
})

local select = require("nvim-treesitter-textobjects.select")

-- Functions
vim.keymap.set({"x", "o"}, "af", function()
    select.select_textobject("@function.outer", "textobjects")
end, { desc = "Select entire function" })

vim.keymap.set({"x", "o"}, "if", function()
    select.select_textobject("@function.inner", "textobjects")
end, { desc = "Select inside function" })

-- Parameters
vim.keymap.set({"x", "o"}, "aa", function()
    select.select_textobject("@parameter.outer", "textobjects")
end, { desc = "Select entire parameter" })

vim.keymap.set({"x", "o"}, "ia", function()
    select.select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inside parameter" })
