local M = {}

local start = vim.health.start or vim.health.report_start
local ok = vim.health.ok or vim.health.report_ok
local warn = vim.health.warn or vim.health.report_warn
local error = vim.health.error or vim.health.report_error

local function check_installed(executable, name)
    if vim.fn.executable(executable) then
        ok(string.format("Found %s at %s", name, vim.fn.exepath(executable)))
    else
        error(string.format("Missing %s", name))
    end
end

function M.check()
    start("composer.nvim")

    check_installed("php", "PHP")
    check_installed("composer", "Composer")
end

return M
