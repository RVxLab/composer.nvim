default: test

# Start a Neovim instance with the current folder in the runtime path
dev:
    nvim "+set rtp+=."

# Run the health check
health:
    nvim "+set rtp+=." "+checkhealth"

# Run tests in a headless Nvim instance
test:
    nvim --headless -c "PlenaryBustedDirectory tests"
