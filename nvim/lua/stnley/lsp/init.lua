local lspconfig = require("lspconfig")

local function on_attach()
    -- smarter people than me said to do this
    -- i will follow blindly
end

lspconfig.pyright.setup { on_attach = on_attach }

lspconfig.tsserver.setup { on_attach = on_attach }

