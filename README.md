# CG Dotfiles

A complete Linux desktop configuration featuring i3 window manager, Neovim, Polybar, Fish shell, and more. This setup provides a modern, efficient, and visually appealing development environment.

## Preview

My daily driver setup includes:
- **Window Manager**: i3wm with custom keybindings
- **Status Bar**: Polybar with custom modules
- **Terminal**: Kitty with custom configuration
- **Shell**: Fish with custom functions and aliases
- **Editor**: Neovim with LSP, completion, and modern plugins
- **Screen Lock**: i3lock with custom styling

## Features

### i3 Window Manager
- Custom keybindings for productivity
- Automatic workspace management
- Screen lock integration
- Screenshot functionality with Flameshot
- Volume and brightness controls

### Polybar
- Custom modules for system monitoring
- CPU, memory, disk usage
- Audio controls and microphone status
- Network information
- Date and time display
- Workspace indicators

### Neovim Configuration
- Complete LSP setup with Mason
- Advanced autocompletion with nvim-cmp
- File explorer with nvim-tree
- Fuzzy finding with fzf-lua
- Git integration with gitsigns
- Multiple color schemes
- Optimized for speed and productivity

### Fish Shell
- Custom functions and aliases
- Enhanced command completion
- Colorful prompt and syntax highlighting
- Productivity shortcuts

### Additional Tools
- Kitty terminal configuration
- i3lock custom lock screen
- Flameshot for screenshots
- Various utility scripts

## Quick Start

### Prerequisites

Make sure you have the following installed:

```bash
# Arch Linux
sudo pacman -S i3-wm polybar neovim fish kitty flameshot i3lock-color git curl ripgrep nodejs npm

# Ubuntu/Debian
sudo apt install i3 polybar neovim fish kitty flameshot i3lock git curl ripgrep nodejs npm

# Fedora
sudo dnf install i3 polybar neovim fish kitty flameshot i3lock git curl ripgrep nodejs npm
```

### Installation

#### Method 1: Using GNU Stow (Recommended)

1. **Install GNU Stow**:
```bash
# Arch Linux
sudo pacman -S stow

# Ubuntu/Debian
sudo apt install stow

# Fedora
sudo dnf install stow
```

2. **Backup existing configurations**:
```bash
mkdir -p ~/.config/backup
mv ~/.config/i3 ~/.config/backup/ 2>/dev/null || true
mv ~/.config/polyvar ~/.config/backup/ 2>/dev/null || true
mv ~/.config/nvim ~/.config/backup/ 2>/dev/null || true
mv ~/.config/fish ~/.config/backup/ 2>/dev/null || true
mv ~/.config/kitty ~/.config/backup/ 2>/dev/null || true
```

3. **Clone this repository**:
```bash
git clone https://github.com/cyber-green/cg-dotfiles.git ~/dotfiles
cd ~/dotfiles
```

4. **Apply configurations using stow**:
```bash
# Install individual packages
stow i3        # Install i3 configuration
stow polybar   # Install polybar configuration
stow nvim      # Install neovim configuration
stow fish      # Install fish shell configuration
stow kitty     # Install kitty terminal configuration

# Or install everything at once
stow */

# Make scripts executable
chmod +x ~/.config/polybar/*.sh
chmod +x ~/.config/i3lock/*.sh 2>/dev/null || true
```

#### Method 2: Manual Installation

1. **Backup existing configurations** (same as above)

2. **Clone this repository** (same as above)

3. **Install configurations manually**:
```bash
# Copy all configurations
cp -r i3/.config/* ~/.config/
cp -r polybar/.config/* ~/.config/
cp -r nvim/.config/* ~/.config/
cp -r fish/.config/* ~/.config/
cp -r kitty/.config/* ~/.config/

# Make scripts executable
chmod +x ~/.config/polybar/*.sh
chmod +x ~/.config/i3lock/*.sh 2>/dev/null || true
```

4. **Install a Nerd Font**:
Download and install a Nerd Font for proper icon display:
- [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip)
- [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip)

5. **Restart your session or reload configurations**:
```bash
# Reload i3
i3-msg reload

# Restart polybar
~/.config/polybar/launch_polybar.sh

# Start fish shell
fish
```

## Configuration Details

### i3wm Keybindings

#### Basic Navigation
- `Super + Enter` - Open terminal (Kitty)
- `Super + d` - Application launcher (dmenu)
- `Super + q` - Close window
- `Super + h/j/k/l` - Navigate windows
- `Super + Arrow keys` - Navigate windows

#### Workspaces
- `Super + 1-0` - Switch to workspace
- `Super + Shift + 1-0` - Move window to workspace
- `Super + Tab` - Switch between workspaces

#### Window Management
- `Super + f` - Fullscreen
- `Super + v` - Split vertically
- `Super + h` - Split horizontally
- `Super + Shift + Space` - Toggle floating
- `Super + r` - Resize mode

#### System Controls
- `Super + Shift + s` - Screenshot (Flameshot GUI)
- `Super + Shift + a` - Full screen screenshot
- `Super + Ctrl + l` - Lock screen
- `Super + Shift + e` - Exit i3

#### Audio Controls
- `XF86AudioRaiseVolume` - Volume up
- `XF86AudioLowerVolume` - Volume down
- `XF86AudioMute` - Mute toggle

### Polybar Modules

- **CPU Usage**: Real-time CPU monitoring
- **Memory Usage**: RAM usage display
- **Disk Usage**: Storage information
- **Network**: Connection status and speed
- **Audio**: Volume control and microphone status
- **Date/Time**: Current date and time
- **Workspaces**: i3 workspace indicators

### Neovim Features

- **LSP Support**: Complete language server setup
- **Autocompletion**: Smart code completion
- **File Management**: Built-in file explorer
- **Git Integration**: Git status and operations
- **Multiple Themes**: Catppuccin, Gruvbox, Dracula
- **Fuzzy Finding**: Fast file and text search
- **Terminal Integration**: Built-in terminal

#### Key Mappings (Neovim)
- `Space` - Leader key
- `Leader + f` - Find files
- `Leader + g` - Grep search
- `Leader + t` - Toggle file explorer
- `Leader + z` - Open terminal
- `Leader + p` - Cycle themes
- See [CG-Neovim](https://github.com/cyber-green/cg-nvim) for complete mappings

### Fish Shell Features

- Enhanced tab completion
- Syntax highlighting
- Custom aliases and functions
- Git integration in prompt
- Fast and user-friendly

## File Structure

```
~/dotfiles/
├── config/
│   ├── i3/
│   │   └── config              # i3 window manager configuration
│   ├── polybar/
│   │   ├── config.ini          # Polybar configuration
│   │   ├── launch_polybar.sh   # Polybar startup script
│   │   ├── toggle_polybar.sh   # Toggle polybar
│   │   └── *.sh               # Various polybar scripts
│   ├── nvim/                   # Complete Neovim configuration
│   │   ├── init.lua           # Main config file
│   │   └── lua/               # Lua configuration modules
│   ├── fish/
│   │   ├── config.fish        # Fish shell configuration
│   │   └── functions/         # Custom fish functions
│   ├── kitty/
│   │   └── kitty.conf         # Kitty terminal configuration
│   └── i3lock/
│       └── lock-simple.sh     # Screen lock script
├── scripts/                    # Utility scripts
├── README.md                   # This file
└── install.sh                  # Installation script
```

## Related Repositories

- **[CG-Neovim](https://github.com/cyber-green/cg-nvim)** - Standalone Neovim configuration
- **[CG-Polybar](https://github.com/cyber-green/cg-polybar)** - Standalone Polybar configuration

## Customization

### Changing Colors
- **i3**: Edit `~/.config/i3/config`
- **Polybar**: Modify colors in `~/.config/polybar/config.ini`
- **Neovim**: Use `Leader + p` to cycle themes
- **Kitty**: Edit `~/.config/kitty/kitty.conf`

### Adding New Keybindings
Edit `~/.config/i3/config` and add your custom keybindings:
```
bindsym $mod+shift+t exec your-command
```

### Customizing Polybar
Add new modules or modify existing ones in `~/.config/polybar/config.ini`

### Fish Shell Customization
Add custom functions in `~/.config/fish/functions/` or modify `~/.config/fish/config.fish`

## Dependencies

### Required Packages
- i3-wm or i3-gaps
- polybar
- neovim (>= 0.9.0)
- fish
- kitty
- flameshot
- i3lock-color
- git
- curl
- ripgrep
- nodejs & npm

### Optional Packages
- rofi (alternative to dmenu)
- feh (wallpaper setting)
- compton/picom (compositor)
- dunst (notifications)

## Troubleshooting

### Polybar Not Starting
```bash
# Check polybar configuration
polybar --config=~/.config/polybar/config.ini --list

# Restart polybar
~/.config/polybar/launch_polybar.sh
```

### i3 Configuration Issues
```bash
# Check i3 configuration
i3 -C -c ~/.config/i3/config

# Reload i3
i3-msg reload
```

### Neovim Plugin Issues
```bash
# Open neovim and run:
:PlugInstall
:Mason
```

### Fish Shell Issues
```bash
# Reset fish configuration
fish_config
```

## Screenshots

Add your screenshots here to showcase your setup!

## Contributing

1. Fork this repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly on a fresh system
5. Submit a pull request

## License

This configuration is provided under the MIT License. Feel free to use, modify, and distribute as needed.

## Acknowledgments

- Thanks to the i3wm, Neovim, Polybar, and Fish communities
- Inspired by various dotfile repositories and rice setups
- Special thanks to all the plugin authors and maintainers

## Contact

- GitHub: [@cyber-green](https://github.com/cyber-green)
- Feel free to open issues for questions or suggestions

---

**Note**: This configuration is optimized for Arch Linux but should work on most Linux distributions with minor modifications.
