return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        require("refactoring").setup({})
    end
}

