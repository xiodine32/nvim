# personal nvim config

I'm using [Lazy](https://github.com/folke/lazy.nvim) to configure packages, so
these are the config files (with what they each do):

- [bufferline](https://github.com/akinsho/bufferline.nvim) - shows top bar buffers
- [illuminate](https://github.com/RRethy/vim-illuminate) - shows word matches at cursor highlighted (using lsp)
- [lsp](https://github.com/VonHeikemen/lsp-zero.nvim) - lzp-zero, language service providers
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - 🔭
- [theme](https://github.com/folke/tokyonight.nvim) - beautiful
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) + [angular](https://github.com/nvim-treesitter/nvim-treesitter-angular) - syntax highlighting
- [undotree](https://github.com/mbbill/undotree) - undo tree history
- [vimfugitive](https://github.com/tpope/vim-fugitive) - git wrapper
- [whichkey](https://github.com/folke/which-key.nvim) - show possible keys (with info where available)

I've also configured Alacritty with the following config (macOS):

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
