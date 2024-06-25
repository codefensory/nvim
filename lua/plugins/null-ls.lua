-- Solucionar problemas de formateo
return {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
    config = function()
        -- Here is the formatting config
        local null_ls = require("null-ls")

        require("null-ls").setup()
    end
}
