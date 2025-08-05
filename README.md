# Dotfiles 

Personal configuration files for:
- [i3 Window Manager](https://i3wm.org/)
- [Polybar](https://github.com/Hadi493/cg-polybar/)
- [Neovim](https://github.com/cyber-green/cg-nvim/)
- [i3lock](https://github.com/Hadi493/cg-i3lock/)

## Installation

```bash
git clone https://github.com/cyber-green/cg-i3dotfiles.git
cd cg-i3dotfiles
chmod +x install
./install
```

**Reload i3: `Super/Mod + Shift + r`**

## Structure

```
config/
├── i3/           # i3 window manager configuration
├── polybar/      # Status bar configuration and scripts
├── nvim/         # Neovim configuration with plugins
└── i3lock/       # Screen lock scripts and themes
```

## ⚠️ Note

This configuration is tailored for advanced users. Please review the configs before installation.

## Features

- **i3**: Customized window manager setup
- **Polybar**: Beautiful status bar with custom modules
- **Neovim**: Full IDE-like setup with LSP, plugins, and themes
- **i3lock**: Enhanced lock screen with custom simple themes
