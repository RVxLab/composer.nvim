local Package = require("composer.models.package")
local Semver = require("composer.models.semver")

describe("Package", function()
    it("Can be constructed", function()
        local pkg, err = Package.from("spatie/color", "v2.34.8")

        assert.is_nil(err)
        assert.is_true(Package.new("spatie", "color", Semver.new(2, 34, 8)):equals(pkg))
    end)

    it("Returns an error if the name is incorrect", function()
        local pkg, err = Package.from("spatie_color", "v2.34.8")

        assert.equals("Invalid package name: spatie_color", err)
        assert.is_nil(pkg)
    end)

    it("Returns an error if the version is incorrect", function()
        local pkg, err = Package.from("spatie/color", "banana")

        assert.equals("Invalid version for spatie/color: banana", err)
        assert.is_nil(pkg)
    end)
end)
