# Xio nvim config

## Setup

```bash
brew install ripgrep fd fzf neovim tmux
mkdir -p ~/.config/nvim
git clone https://github.com/xiodine32/nvim ~/.config/nvim
```

Configure Alacritty with the following config (macOS):

```yml
dynamic_padding: true
font:
  normal:
    family: MesloLGS Nerd Font Mono
  size: 16.0
key_bindings:
  - { chars: "\x1BF" , key: Right, mods: Alt}
  - { chars: "\x1BB" ,  key: Left, mods: Alt}
window:
  opacity: 0.99
  option_as_alt: Both
```

## About

I'm using [Lazy](https://github.com/folke/lazy.nvim) to configure packages, so
these are the plugin files (with what they each do):

- [bufferline.lua](https://github.com/akinsho/bufferline.nvim) - shows top bar buffers
- [illuminate.lua](https://github.com/RRethy/vim-illuminate) - shows word matches at cursor highlighted (using lsp)
- [lsp.lua](https://github.com/VonHeikemen/lsp-zero.nvim) - lzp-zero, language service providers
- [telescope.lua](https://github.com/nvim-telescope/telescope.nvim) - 🔭
- [theme.lua](https://github.com/folke/tokyonight.nvim) - beautiful
- [treesitter.lua](https://github.com/nvim-treesitter/nvim-treesitter) + [angular](https://github.com/nvim-treesitter/nvim-treesitter-angular) - syntax highlighting
- [undotree.lua](https://github.com/mbbill/undotree) - undo tree history
- [vimfugitive.lua](https://github.com/tpope/vim-fugitive) - git wrapper
- [whichkey.lua](https://github.com/folke/which-key.nvim) - show possible keys (with info where available)
- [nullls.lua](https://github.com/jose-elias-alvarez/null-ls.nvim) - null language server (formatters)
