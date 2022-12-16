# MyNeovim

My Neovim configuration in MacOS and Win

## External Dependencies

### LSP

- npm(>=7.10.0)
- node(>=16.0.0)
- yarn(>=1.22.15)

### nvim-treesitter

- git
- A C compiler([Windows User](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support))

### telescope.nvim

- [sharkdp/fd](https://github.com/sharkdp/fd)
- [repgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)

### rust-tools.nvim

- rust-analyzer(by mason.nvim)

### nvim-dap

- [lldb-vscode](https://lldb.llvm.org)

### neorg

- A C++ compiler(C++14 support)

> *important*: export the CC(support for c++14) variable in general: export CC=/path/to/newer/compile

### rest.nvim

- curl
- [jq](https://github.com/stedolan/jq)

## ChatGPT.nvim

- curl
- [OPENAI_API_KEY](https://beta.openai.com/account/api-keys) as environment variable `$OPENAI_API_KEY`

## References

- [Using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide)
