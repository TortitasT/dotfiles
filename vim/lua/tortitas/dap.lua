local dap = require 'dap'

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/build/vscode-php-debug/out/phpDebug.js" }
}

require('dap.ext.vscode').load_launchjs(os.getenv('HOME') .. '/.vscode/launch.json')
