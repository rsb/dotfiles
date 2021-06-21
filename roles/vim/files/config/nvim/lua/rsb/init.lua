require("rsb.telescope")
require("rsb.lsp")
require("rsb.statusline")
require("rsb.git-worktree")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
