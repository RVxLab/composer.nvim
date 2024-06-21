local utils = require("composer.utils")

---@class Semver
---@field major integer
---@field minor integer
---@field patch integer
local Semver = {}
Semver.__index = Semver

---Create a Semver object
---@param major number
---@param minor number
---@param patch number
function Semver.new(major, minor, patch)
    local instance = setmetatable({}, Semver)
    instance.major = major
    instance.minor = minor
    instance.patch = patch

    return instance
end

---Create a Semver object from a string
---@param version string
---@return Semver|nil, string|nil
function Semver.from_string(version)
    ---@type string, string, string
    local major, minor, patch = version:match("^v?([0-9]+)%.([0-9]+)%.([0-9]+)$")

    if major then
        return Semver.new(utils.to_number(major), utils.to_number(minor), utils.to_number(patch)), nil
    end

    return nil, string.format("Could not convert %s to a Semver object", version)
end

---Check if the given semver is the same as the current one
---@param other Semver
---@return boolean
function Semver:equals(other)
    return self.major == other.major and self.minor == other.minor and self.patch == other.patch
end

return Semver
