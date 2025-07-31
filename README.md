# CG's i3 Dotfiles

**A complete, modern Linux desktop environment** built for developers and power users. This configuration combines the efficiency of i3 window manager with modern tools and beautiful aesthetics using the Catppuccin color scheme.

![GitHub stars](https://img.shields.io/github/stars/cyber-green/cg-i3dotfiles?style=flat-square)
![GitHub license](https://img.shields.io/github/license/cyber-green/cg-i3dotfiles?style=flat-square)
![Arch Linux](https://img.shields.io/badge/Arch-Linux-1793D1?style=flat-square&logo=arch-linux)

## What's Included

| Component | Tool | Description |
|-----------|------|-------------|
| **Window Manager** | i3wm | Tiling window manager with custom keybindings |
| **Status Bar** | Polybar | Modern status bar with system monitoring |
| **Terminal** | Kitty | GPU-accelerated terminal with Catppuccin theme |
| **Shell** | Fish | Smart shell with syntax highlighting and completions |
| **Editor** | Neovim | Modern Vim with LSP, autocompletion, and plugins |
| **App Launcher** | dmenu | Fast application launcher |
| **Screenshots** | Flameshot | Feature-rich screenshot tool |
| **Screen Lock** | i3lock | Secure screen locking |

## Features

### i3 Window Manager
- **Tiling Management**: Efficient window management with no wasted space
- **Custom Keybindings**: Optimized shortcuts for maximum productivity
- **10 Workspaces**: Numbered workspaces with smart switching
- **Screenshot Integration**: Flameshot GUI and fullscreen capture shortcuts
- **Audio Controls**: Hardware key support for volume and mute
- **Screen Lock**: i3lock integration with custom styling
- **Polybar Integration**: Automatic status bar launching

### Polybar Status Bar
- **Catppuccin Theme**: Beautiful mocha color scheme matching other components
- **System Monitoring**: Real-time CPU and memory usage display
- **Audio Management**: Volume control and microphone input monitoring
- **Battery Status**: Charging/discharging indicators with percentage
- **Workspace Indicators**: Visual feedback for i3 workspaces
- **Date/Time Display**: Formatted time with seconds and full date
- **System Tray**: Native system tray support
- **Click Actions**: Interactive modules for microphone control

### Kitty Terminal
- **GPU Acceleration**: Fast rendering with modern OpenGL features
- **Catppuccin Mocha**: Consistent color scheme across all tools
- **JetBrains Mono Nerd Font**: Beautiful programming font with icon support
- **Advanced Features**: Ligatures, cursor customization, and performance tuning
- **Custom Keybindings**: Efficient tab and window management
- **Shell Integration**: Perfect Fish shell compatibility

### Fish Shell Configuration
- **Smart Autocompletion**: Intelligent command and path suggestions
- **Syntax Highlighting**: Real-time command validation and coloring
- **Custom Prompt**: Git integration with branch and status indicators
- **Comprehensive Aliases**: Git, system, development, and package manager shortcuts
- **Utility Functions**: Extract archives, backup files, clipboard operations
- **Development Tools**: Python, Docker, and Node.js optimizations

### Neovim Setup
- **Modern Configuration**: Lua-based configuration with lazy loading
- **LSP Integration**: Complete language server support
- **Advanced Plugins**: File tree, fuzzy finder, Git integration, and more
- **Multiple Themes**: Catppuccin and other modern color schemes
- **Productivity Features**: Auto-completion, syntax highlighting, and terminal integration

## Quick Installation

Get your environment set up in minutes with the automated setup script:

```bash
# Clone the repository
git clone https://github.com/cyber-green/cg-i3dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the automated setup script
./set-up.sh
```

## Manual Installation

### Prerequisites

Ensure these packages are installed on your system:

**Arch Linux:**
```bash
sudo pacman -S i3-wm polybar neovim fish kitty flameshot i3lock-color git curl ripgrep nodejs npm stow
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install i3 polybar neovim fish kitty flameshot i3lock git curl ripgrep nodejs npm stow
```

**Fedora:**
```bash
sudo dnf install i3 polybar neovim fish kitty flameshot i3lock git curl ripgrep nodejs npm stow
```

### Installation Steps

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
- `Super + Shift + x` - Lock screen (alternative)
- `Super + Shift + e` - Exit i3
- `Super + Shift + c` - Reload i3 configuration
- `Super + Shift + r` - Restart i3

#### Polybar Controls
- `Super + Shift + p` - Toggle polybar visibility
- `Super + Ctrl + p` - Start polybar
- `Super + Alt + p` - Kill polybar

#### Audio Controls
- `XF86AudioRaiseVolume` - Volume up (+10%)
- `XF86AudioLowerVolume` - Volume down (-10%)
- `XF86AudioMute` - Toggle volume mute
- `XF86AudioMicMute` - Toggle microphone mute

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
cg-i3dotfiles/
├── i3/
│   └── .config/
│       └── i3/
│           └── config          # i3 window manager configuration
├── polybar/
│   └── .config/
│       └── polybar/
│           ├── config.ini      # Polybar configuration
│           ├── launch_polybar.sh
│           ├── toggle_polybar.sh
│           ├── mic-input.sh    # Microphone input script
│           └── *.sh           # Various utility scripts
├── nvim/
│   └── .config/
│       └── nvim/              # Complete Neovim configuration
│           ├── init.lua       # Main config file
│           └── lua/           # Lua configuration modules
├── fish/
│   └── .config/
│       └── fish/
│           └── config.fish    # Fish shell configuration
├── kitty/
│   └── .config/
│       └── kitty/
│           └── kitty.conf     # Kitty terminal configuration
├── README.md                   # This documentation
├── install.sh                  # Original installation script
├── set-up.sh                   # New automated setup script
└── LICENSE                     # MIT License
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
