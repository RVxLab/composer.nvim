local api = require("composer.api")

local M = {}

local function execute(input)
    local command = input.fargs[1]

    if command == "require" then
        local packages = { unpack(input.fargs, 2) }
        vim.print(packages)
    elseif command == "info" or command == "show" then
        api.show(input.fargs[2] or nil, input.fargs[3] or nil)
    end
end

local function complete(prefix, line, col)
    return { "require", "show", "info" }
end

function M.register()
    vim.api.nvim_create_user_command("Composer", execute, {
        nargs = "*",
        complete = complete,
    })
end

return M
