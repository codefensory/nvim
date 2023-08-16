return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        -- Here is the formatting config
        local null_ls = require("null-ls")

        require("null-ls").setup()
    end
}
