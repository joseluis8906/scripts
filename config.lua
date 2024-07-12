-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
vim.opt.relativenumber = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "120"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

lvim.colorscheme = "catppuccin-mocha"
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.format_on_save = true
lvim.keys.normal_mode["<S-E>"] = ":Explore<CR>"

lvim.plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}

require("catppuccin").setup({
    transparent_background = true
})

local dap = require('dap')
-- dap.adapters.delve = {
--     type = 'server',
--     port = "${port}",
--     executable = {
--         command = 'dlv',
--         args = { 'dap', '-l', '127.0.0.1:${port}' },
--         build_flags = "",
--         detached = false,
--     }
-- }
dap.adapters.delve = {
    type = 'server',
    host = '127.0.0.1',
    port = 2345,
}

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    },
    {
        type = "delve",
        name = "Attach",
        mode = "remote",
        request = "attach"
    }
}
