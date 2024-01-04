lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup = {{name = "black"},}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup = {{command = "flake8", args = {"--ignore=E203"}, filetypes = {"python"} } }


require("swenv").setup({
  post_set_env = function()
    vim.cmd("LSpRestart")
  end,
})

lvim.builtin.which_key.mappings["C"] = {
  name = "PYTHON",
  c = {"<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env"},
}

