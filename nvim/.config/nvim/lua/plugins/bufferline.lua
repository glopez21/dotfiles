return {
    {
        'akinsho/bufferline.nvim', version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            vim.opt.termguicolors = true
            local builtin = require("bufferline").setup{}
        end
    }
}

-- References: https://github.com/akinsho/bufferline.nvim