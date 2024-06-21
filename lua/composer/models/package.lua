local assert = require("composer.assert")
local Semver = require("composer.models.semver")

---@class Package
---@field vendor string
---@field name string
---@field version Semver
local Package = {}
Package.__index = Package

---Create a new package instance
---@param vendor string
---@param name string
---@param version Semver
---@return Package
function Package.new(vendor, name, version)
    local instance = setmetatable({}, Package)
    instance.vendor = vendor
    instance.name = name
    instance.version = version
    return instance
end

---Create a new package instance from strings
---@param name string
---@param version string
---@return Package|nil, string|nil
function Package.from(name, version)
    local vendor, package_name = name:match("^(%w+)/(%w+)$")

    if vendor == nil or package_name == nil then
        return nil, string.format("Invalid package name: %s", name)
    end

    local semver, err = Semver.from_string(version)

    if err ~= nil then
        return nil, string.format("Invalid version for %s: %s", name, version)
    end

    return Package.new(assert.not_nil(vendor), assert.not_nil(package_name), assert.not_nil(semver))
end

---Return the qualified name of the package in format vendor/package
---@return string
function Package:qualified_name()
    return string.format("%s/%s", self.vendor, self.name)
end

---Check if the given package is the same as the current one
---@param other Package
---@return boolean
function Package:equals(other)
    return self:qualified_name() == other:qualified_name() and self.version:equals(other.version)
end

return Package
