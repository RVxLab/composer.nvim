local M = {}

---@class composer.Config
local defaults = {}

---@type composer.Config
local options

---@param opts? composer.Config
function M.setup(opts)
    opts = opts or {}
end

---@param config composer.Config
function M.defaults(config)
    options = vim.tbl_deep_extend("force", config, options)
end

return M
