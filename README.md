Neovim Tree Sitter support for Mindustry's MLog 

This is for personal use.
Do not expect updates or support of any kind.

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
