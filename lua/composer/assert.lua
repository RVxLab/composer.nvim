local M = {}

---Assert that the given value is not nil
---@generic T
---@param value T|nil
---@return T
function M.not_nil(value)
    assert(value, "Value may not be nil")
    return value
end

return M
