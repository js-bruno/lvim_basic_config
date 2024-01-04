lvim.plugins = {
  { "lunarvim/darkplus.nvim" },
  { "sainnhe/everforest" },
  { "sainnhe/sonokai" },
  { 'rose-pine/neovim' },
  { "catppuccin/nvim" },
  { "tpope/vim-surround" },
  { "AckslD/swenv.nvim" },
  { "stevearc/dressing.nvim" },
  { "mfussenegger/nvim-dap" },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
  },
  { "nvim-neotest/neotest" },
  { "ThePrimeagen/vim-be-good" },
  { "ThePrimeagen/harpoon" },
  { "nvim-neotest/neotest-go" },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },
  { 'eandrju/cellular-automaton.nvim' },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}

lvim.builtin.dap.active = true
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data"  .. "/mason/")
require("neotest").setup {

  adapters = {
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" }
    })
  },
}

-- Harpoon
require('harpoon').setup({
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    -- Each branch will have it's own set of marked files
    mark_branch = true,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
  }
})

-- Harpoon telescope extension
require('telescope').load_extension('harpoon')

require("dap-go").setup {
  dap_configuration = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}

lvim.builtin.which_key.mappings["nn"] = { ":Neorg keybind norg core.dirman.new.note<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }
lvim.builtin.which_key.mappings["q"] = { ":bd<cr>", "close tab" }
lvim.builtin.which_key.mappings["Fr"] = { ":CellularAutomaton make_it_rain<cr>", "make it rain" }
lvim.builtin.which_key.mappings["hx"] = { require('harpoon.mark').add_file, "Mark" }
lvim.builtin.which_key.mappings["hn"] = { require('harpoon.ui').nav_next, "next ui" }
lvim.builtin.which_key.mappings["hp"] = { require('harpoon.ui').nav_prev, "prev ui" }
lvim.builtin.which_key.mappings["hp"] = { require('harpoon.ui').nav_prev, "prev ui" }
lvim.builtin.which_key.mappings["hm"] = { ":Telescope harpoon marks<CR>", "prev ui" }
