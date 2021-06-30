local sumneko_root_path = '/home/rsb/workspace/nvim/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local function on_attach()
    -- TODO: TJ told me to do this and I should do it because he is Telescopic
    -- "Big Tech" "Cash Money" Johnson
end

local lspconfig = require'lspconfig'

lspconfig.tsserver.setup{ on_attach=on_attach }
lspconfig.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

lspconfig.pyls.setup{ on_attach=on_attach }

lspconfig.gopls.setup{
    on_attach=on_attach,
    cmd = {"gopls", "serve"},
    root_dir = lspconfig.util.root_pattern('.gomod'),
    settings = {
        gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            code_lens = {
              tidy = true,
              vendor = true,
            },
        },
    },
}

function goimports(timeout_ms)
  local context = {source = {organizeImports = true } }
  vim.validate { context = {context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- see the implementation of the textDocument/codeAction callback
  -- (lua/vim/handler.lua) for how to do this properly
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. if it
  -- is a CodeAction, it can have either an edit, or command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.commad) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end



require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
