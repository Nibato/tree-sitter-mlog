Neovim Tree Sitter support for Mindustry's MLog 

I have no idea what I'm doing with this.

Do not expect updates or support.

-- lazy.nvim example
```
{
  "Nibato/tree-sitter-mlog",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("tree-sitter-mlog").setup()
    -- Automatically install or build the parser on launch if missing
    vim.treesitter.language.register("mlog", "mlog")
  end,
}
```
