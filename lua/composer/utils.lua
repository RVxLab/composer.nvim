local M = {}

---Cast the given value to a number or 0 if not possible
---@param value unknown
---@return number
function M.to_number(value)
    return tonumber(value) or 0
end

return M
