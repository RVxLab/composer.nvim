local composer = require("composer.composer")

local M = {}

---@class composer.RequireOpts
---@field dev? boolean
local requireOpts = {
    dev = false,
}

---@param packages string
---@param opts? composer.RequireOpts
function M.require(packages, opts)
    local package_list = vim.split(packages, " ", {
        plain = true,
        trimempty = true,
    })

    composer.run("require", package_list)
end

function M.show(package, version)
    local args = {}

    if package ~= nil then
        table.insert(args, package)

        if version ~= nil then
            table.insert(table, version)
        end
    end

    composer.run("show", args)
end

return M
