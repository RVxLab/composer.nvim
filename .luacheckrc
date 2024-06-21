cache = true
std = luajit

files = {
    ["tests/**/*.lua"] = {
        globals = {
            "describe",
            "it",
            "assert",
        },
    },
}
