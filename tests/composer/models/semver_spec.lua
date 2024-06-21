local Semver = require("composer.models.semver")

describe("Semver", function()
    it("Can create from string", function()
        local semver, err = Semver.from_string("1.2.3")

        assert.is_nil(err)
        assert.is_true(Semver.new(1, 2, 3):equals(semver))
    end)

    it("Can create from string starting with a v", function()
        local semver, err = Semver.from_string("v1.2.3")

        assert.is_nil(err)
        assert.is_true(Semver.new(1, 2, 3):equals(semver))
    end)

    it("Throws an error if the semantic version is incorrect", function()
        local semver, err = Semver.from_string("v1.2.apple")

        assert.equals("Could not convert v1.2.apple to a Semver object", err)
        assert.is_nil(semver)
    end)
end)
