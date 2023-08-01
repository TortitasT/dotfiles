local dap = require 'dap'

function loadPhpDebug()
  if not file_exists(get_home_path() .. '/build/vscode-php-debug/out/phpDebug.js') then
    return
  end

  dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/build/vscode-php-debug/out/phpDebug.js' },
  }

  require('dap.ext.vscode').load_launchjs(os.getenv('HOME') .. '/.vscode/launch.json')
end

function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function get_home_path()
  local path = os.getenv('HOME')
  if path == nil then
    path = os.getenv('USERPROFILE') -- Windoooowss
  end
  return path
end

loadPhpDebug()
