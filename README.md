# Dotfiles 

Personal configuration files for:
- [i3 Window Manager](https://i3wm.org/)
- [Polybar](https://github.com/Hadi493/cg-polybar/)
- [Neovim](https://github.com/cyber-green/cg-nvim/)
- [i3lock](https://github.com/Hadi493/cg-i3lock/)

## Requirements

### System Dependencies

#### Essential Components
- **i3** - Window manager
- **polybar** - Status bar
- **i3lock** or **i3lock-color** - Screen locker (i3lock-color recommended for advanced themes)
- **neovim** (>= 0.9.0) - Text editor
- **git** - Version control
- **bash** - Shell scripting support

#### Terminal and Applications
- **kitty** - Terminal emulator (configured as default)
- **dmenu** - Application launcher
- **feh** - Wallpaper setter
- **dunst** - Notification daemon
- **flameshot** - Screenshot tool
- **xrandr** - Display configuration

#### Optional Applications (referenced in config)
- **zen-browser** - Web browser
- **vesktop** - Discord client
- **boomer** - Screen magnifier
- **krunner** - KDE application launcher

#### Fonts
- **Iosevka Nerd Font** - Main font for UI elements
- Any **Nerd Font** - For proper icon display in all components

#### Audio
- **pulseaudio** - Audio system
- **pamixer** or **pactl** - Audio control utilities

#### Neovim Dependencies
- **ripgrep** - Fast text searching for fzf-lua
- **nodejs** and **npm** - For LSP servers
- **curl** - For plugin installation
- **xdg-utils** - For URL opening functionality

#### Development Tools (Optional)
- **htop** - Process viewer (terminal integration)
- Language servers via **Mason** (automatically managed)

### Installation Commands

#### Arch Linux
```bash
# Essential packages
sudo pacman -S i3-wm polybar i3lock neovim git kitty dmenu feh dunst flameshot xorg-xrandr pulseaudio

# Fonts (AUR)
yay -S ttf-iosevka-nerd nerd-fonts-complete

# Neovim dependencies
sudo pacman -S ripgrep nodejs npm curl xdg-utils

# Optional tools
sudo pacman -S htop
```

#### Ubuntu/Debian
```bash
# Essential packages
sudo apt update
sudo apt install i3 polybar i3lock neovim git kitty dmenu feh dunst flameshot x11-xserver-utils pulseaudio

# Install Nerd Fonts manually from: https://github.com/ryanoasis/nerd-fonts/releases

# Neovim dependencies
sudo apt install ripgrep nodejs npm curl xdg-utils

# Optional tools
sudo apt install htop
```

#### Fedora
```bash
# Essential packages
sudo dnf install i3 polybar i3lock neovim git kitty dmenu feh dunst flameshot xrandr pulseaudio

# Neovim dependencies
sudo dnf install ripgrep nodejs npm curl xdg-utils

# Optional tools
sudo dnf install htop
```

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
