# CG Neovim Configuration

A fast, feature-rich Neovim configuration optimized for speed and productivity. This setup uses vim-plug for plugin management and includes carefully selected plugins for an efficient development experience.

## Features

- **Plugin Management**: vim-plug with automatic installation
- **Multiple Color Schemes**: Catppuccin, Gruvbox, Dracula, and Pywal16 support
- **LSP Support**: Complete Language Server Protocol setup with Mason
- **Autocompletion**: nvim-cmp with multiple sources (LSP, buffer, path, snippets)
- **File Explorer**: nvim-tree for project navigation
- **Fuzzy Finding**: fzf-lua for fast file and text search
- **Syntax Highlighting**: Treesitter for advanced syntax parsing
- **Git Integration**: Gitsigns for git status in editor
- **Status Line**: Lualine with custom configuration
- **Buffer Management**: Barbar for tabbed buffer navigation
- **Terminal**: FTerm floating terminal
- **Startup Screen**: Alpha-nvim with custom dashboard
- **Code Enhancement**: Auto-pairs, comments, colorizer, and more

## Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons and proper display)
- ripgrep (for fzf-lua searching)
- Node.js (for LSP servers)
- curl (for automatic plugin installation)

## Installation

### 1. Backup existing configuration

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

### 2. Clone this configuration

```bash
git clone https://github.com/yourusername/cg-nvim ~/.config/nvim
```

### 3. Install dependencies

#### Arch Linux:
```bash
sudo pacman -S ripgrep nodejs npm curl git
```

#### Ubuntu/Debian:
```bash
sudo apt update
sudo apt install ripgrep nodejs npm curl git
```

#### Fedora:
```bash
sudo dnf install ripgrep nodejs npm curl git
```

#### macOS:
```bash
brew install ripgrep node curl git
```

### 4. Install a Nerd Font

Download and install a Nerd Font for proper icon display:
- [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip)
- [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip)

Set the installed font in your terminal emulator.

### 5. Start Neovim

```bash
nvim
```

On first startup, vim-plug and all plugins will be automatically installed.

## Key Mappings

### Leader Key
- `Space` - Leader key

### Buffer Management
- `Shift + H` - Previous buffer
- `Shift + L` - Next buffer
- `<leader>q` - Close current buffer
- `<leader>Q` - Force close current buffer
- `<leader>U` - Close all buffers
- `<leader>vs` - Vertical split with next buffer
- `Alt + 1-9` - Go to buffer by number
- `Alt + 0` - Go to last buffer
- `Alt + p` - Pin/unpin buffer

### Window Navigation
- `Ctrl + h/j/k/l` - Navigate between windows
- `F5/F6` - Resize window vertically
- `F7/F8` - Resize window horizontally

### File Operations
- `<leader>f` - Find files in current directory
- `<leader>Fh` - Find files in home directory
- `<leader>Fc` - Find files in ~/.config
- `<leader>Fl` - Find files in ~/.local/src
- `<leader>Ff` - Find files in parent directory
- `<leader>Fr` - Resume last search
- `<leader>t` - Toggle file explorer
- `<leader>w` - Save file
- `<leader>d` - Duplicate file with new name
- `<leader>mv` - Move file to new directory
- `<leader>x` - Make file executable

### Search and Replace
- `<leader>g` - Grep search
- `<leader>G` - Grep word under cursor
- `<leader>s` - Search and replace (:%s//g)

### Git Operations
- Git signs are displayed in the sign column
- Git status integrated with file explorer

### Terminal
- `<leader>z` - Open floating terminal
- `Escape` - Close terminal (in terminal mode)
- `<leader>H` - Toggle htop in terminal

### Theme and UI
- `<leader>p` - Cycle through color schemes
- `<leader>W` - Toggle line wrapping
- `<leader>l` - Toggle Twilight (dim surrounding code)
- `<leader>nn` - Toggle relative/absolute line numbers

### TODO Comments
- `<leader>td` - Find all TODOs
- `<leader>tl` - TODOs in location list
- `<leader>tq` - TODOs in quickfix
- `]t` - Next TODO
- `[t` - Previous TODO

### CSV Files (Decisive plugin)
- `<leader>csa` - Align CSV
- `<leader>csA` - Clear CSV alignment
- `[c` - Previous CSV column
- `]c` - Next CSV column

### Development
- `<leader>P` - Install/update plugins
- `<leader>R` - Reload Neovim configuration
- `<leader>ma` - Quick make in current directory
- `<leader>u` - Open URL under cursor

### LSP (Language Server)
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `[d` / `]d` - Previous/Next diagnostic

## Plugins Included

### Core Functionality
- **catppuccin/nvim** - Catppuccin color scheme
- **ellisonleao/gruvbox.nvim** - Gruvbox color scheme
- **Mofiqul/dracula.nvim** - Dracula color scheme
- **uZer/pywal16.nvim** - Pywal color scheme

### LSP and Completion
- **neovim/nvim-lspconfig** - LSP configuration
- **williamboman/mason.nvim** - LSP server manager
- **williamboman/mason-lspconfig.nvim** - Mason integration
- **hrsh7th/nvim-cmp** - Completion engine
- **hrsh7th/cmp-nvim-lsp** - LSP completion source
- **hrsh7th/cmp-buffer** - Buffer completion
- **hrsh7th/cmp-path** - Path completion
- **hrsh7th/cmp-cmdline** - Command line completion
- **L3MON4D3/LuaSnip** - Snippet engine
- **saadparwaiz1/cmp_luasnip** - Snippet completion

### UI and Navigation
- **nvim-lualine/lualine.nvim** - Status line
- **nvim-tree/nvim-web-devicons** - File icons
- **romgrk/barbar.nvim** - Buffer line
- **goolord/alpha-nvim** - Start screen
- **nvim-tree/nvim-tree.lua** - File explorer
- **ibhagwan/fzf-lua** - Fuzzy finder
- **folke/which-key.nvim** - Key mapping hints
- **numToStr/FTerm.nvim** - Floating terminal

### Code Enhancement
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting
- **windwp/nvim-autopairs** - Auto pairs
- **numToStr/Comment.nvim** - Easy commenting
- **norcalli/nvim-colorizer.lua** - Color highlighting
- **mfussenegger/nvim-lint** - Async linting

### Git Integration
- **lewis6991/gitsigns.nvim** - Git signs in editor

### Specialized
- **MeanderingProgrammer/render-markdown.nvim** - Markdown rendering
- **emmanueltouzery/decisive.nvim** - CSV file viewer
- **folke/twilight.nvim** - Code dimming
- **folke/todo-comments.nvim** - TODO highlighting
- **ron-rs/ron.vim** - RON syntax highlighting

## File Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── lua/
│   ├── config/
│   │   ├── autocmd.lua        # Auto commands
│   │   ├── mappings.lua       # Key mappings
│   │   ├── options.lua        # Neovim options
│   │   ├── theme.lua         # Theme configuration
│   │   └── saved_theme       # Saved theme preference
│   └── plugins/
│       ├── alpha.lua         # Start screen config
│       ├── autopairs.lua     # Auto pairs config
│       ├── barbar.lua        # Buffer line config
│       ├── colorizer.lua     # Color highlighting config
│       ├── colorscheme.lua   # Color scheme config
│       ├── comment.lua       # Comment plugin config
│       ├── fterm.lua         # Terminal config
│       ├── fzf-lua.lua      # Fuzzy finder config
│       ├── gitsigns.lua      # Git integration config
│       ├── lsp.lua           # LSP configuration
│       ├── lualine.lua       # Status line config
│       ├── nvim-cmp.lua      # Completion config
│       ├── nvim-lint.lua     # Linting config
│       ├── nvim-tree.lua     # File explorer config
│       ├── render-markdown.lua # Markdown rendering config
│       ├── todo-comments.lua  # TODO comments config
│       ├── treesitter.lua    # Syntax highlighting config
│       ├── twilight.lua      # Code dimming config
│       └── which-key.lua     # Key mapping hints config
└── README.md                 # This file
```

## Performance Optimizations

This configuration includes several performance optimizations:

1. **Deferred Loading**: Non-essential plugins are loaded after 100ms to improve startup time
2. **Vim Loader**: Uses `vim.loader.enable()` for faster module loading
3. **Minimal Dependencies**: Only essential plugins are included
4. **Optimized Options**: Carefully tuned Neovim options for performance

## Customization

### Adding New Plugins

Edit `init.lua` and add your plugin between `vim.call('plug#begin')` and `vim.call('plug#end')`:

```lua
Plug('author/plugin-name')
```

Then create a configuration file in `lua/plugins/` and require it in `init.lua`.

### Changing Color Schemes

Use `<leader>p` to cycle through available themes, or edit `lua/config/theme.lua` to modify theme selection.

### Modifying Key Mappings

Edit `lua/config/mappings.lua` to customize key bindings.

### Adding LSP Servers

LSP servers are managed through Mason. Use `:Mason` to install new language servers.

## Troubleshooting

### Plugins Not Loading
```bash
# Open Neovim and run:
:PlugInstall
```

### LSP Not Working
```bash
# Check LSP status:
:LspInfo

# Install language servers:
:Mason
```

### Icons Not Displaying
- Install a Nerd Font and configure your terminal to use it
- Ensure your terminal supports Unicode

### Performance Issues
- Check startup time with: `nvim --startuptime startup.log`
- Disable unused plugins in `init.lua`

### Theme Issues
- Reset theme with: `<leader>p`
- Check theme files in `lua/plugins/colorscheme.lua`

## Contributing

1. Fork this repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This configuration is provided under the MIT License. Feel free to use, modify, and distribute as needed.

## Credits

This configuration is based on various community resources and personal preferences. Special thanks to the Neovim community and plugin authors.
