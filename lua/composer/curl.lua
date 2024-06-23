local Job = require("plenary.job")

local M = {}

function M.get(url)
    Job:new({
        command = "curl",
        args = { "-sfL", url },
        cwd = vim.uv.cwd(),
        on_exit = function(job, exit_code)
            print(job:result(), exit_code)
        end,
    }):start()
end

return M
