-- UI for nvim-dap
return {
  'rcarriga/nvim-dap-ui',
  config = function()
    require("dapui").setup()
  end
}
