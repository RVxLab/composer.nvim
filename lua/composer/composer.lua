local Job = require("plenary.job")

local M = {}

function M.run(command, args)
    local command_args = { command }
    vim.list_extend(command_args, args)

    local result = Job:new({
        command = "composer",
        args = command_args,
        cwd = "", -- TODO: Set cwd to the directory of composer.json
    }):sync()

    vim.print(result)
end

return M
