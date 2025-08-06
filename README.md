# CG Dotfiles

A complete, unified desktop environment configuration for Linux featuring i3 window manager, Polybar status bar, Neovim text editor, i3lock screen locker, and Fish shell. All components are configured with a consistent Catppuccin Mocha theme for a cohesive visual experience.

## Components

- **i3 Window Manager** - Tiling window manager with logical keybindings
- **Polybar** - Modern status bar with interactive modules
- **Neovim** - Full-featured IDE setup with LSP support
- **i3lock** - Customizable screen locker with advanced themes
- **Fish Shell** - Enhanced shell with custom prompt and utilities

## Features

### Visual Design
- Consistent Catppuccin Mocha theme across all components
- Iosevka Nerd Font for clean typography and icons
- Advanced i3lock themes with blur effects and custom backgrounds
- Two-line fish prompt with git status and system information

### Productivity Features
- **i3**: Intuitive keybindings, multi-monitor support, auto-launching of essential services
- **Polybar**: Interactive modules for notifications, audio control, system monitoring
- **Neovim**: Optimized startup time, LSP integration, fuzzy finding, file explorer
- **Fish**: 100+ useful aliases, helper functions, smart command completion

### System Integration
- Real-time system monitoring (CPU, memory, GPU, battery, network)
- Interactive notification control via Dunst
- Clickable audio controls with volume adjustment
- Git integration in both shell prompt and editor
- Extract utility supporting multiple archive formats

## Requirements

### Core Components
- i3-wm
- polybar 
- i3lock-color (or i3lock for basic functionality)
- neovim (>= 0.9.0)
- fish
- git

### System Utilities
- kitty (terminal emulator)
- dmenu (application launcher)
- fastfetch (system info display)
- feh (wallpaper management)
- dunst (notification daemon)
- flameshot (screenshots)
- xrandr (display configuration)
- pulseaudio + pactl (audio system)
- imagemagick (i3lock effects)

### Development & Shell Tools
- ripgrep (fast text search)
- nodejs + npm (LSP servers)
- curl + wget (downloads)
- xdg-utils (URL handling)
- p7zip + unrar (archive support)
- yt-dlp (video downloads)
- intel-gpu-tools (GPU monitoring, Intel only)

### Fonts
- Iosevka Nerd Font (primary)
- Any Nerd Font compatible font

## Installation

### Arch Linux / CachyOS
```bash
# Essential packages
sudo pacman -S i3-wm polybar i3lock-color neovim fish git kitty fish dmenu feh dunst flameshot xorg-xrandr pulseaudio fastfetch imagemagick intel-gpu-tools ripgrep nodejs npm curl wget xdg-utils p7zip unrar yt-dlp

# Fonts (AUR)
yay -S ttf-iosevka-nerd
```

### Ubuntu/Debian
```bash
# Essential packages
sudo apt update
sudo apt install i3 polybar i3lock neovim fish git kitty dmenu feh dunst flameshot x11-xserver-utils pulseaudio fastfetch imagemagick intel-gpu-tools ripgrep nodejs npm curl wget xdg-utils p7zip-full unrar-free yt-dlp

# Note: Install Nerd Fonts manually or via package manager if available
```

### Fedora
```bash
# Essential packages
sudo dnf install i3 polybar i3lock neovim fish git kitty dmenu feh dunst flameshot xrandr pulseaudio fastfetch ImageMagick intel-gpu-tools ripgrep nodejs npm curl wget xdg-utils p7zip unrar yt-dlp
```

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/cyber-green/cg-i3dotfiles.git
   cd cg-i3dotfiles
   ```

2. Run the installation script:
   ```bash
   chmod +x install
   ./install
   ```

3. Reload your environment:
   - Log out and back into i3 session
   - Reload i3: `Super + Shift + r`
   - Open new terminal for Fish shell changes

## Configuration

Each component can be customized by editing its respective configuration files:

| Component | Configuration Files | Purpose |
|-----------|-------------------|----------|
| **i3** | `config/i3/config` | Keybindings, workspace setup, autostart programs |
| **Polybar** | `config/polybar/config.ini` | Modules, colors, fonts, bar appearance |
| **i3lock** | `config/i3lock/theme.conf` | Colors, fonts, blur effects, background options |
| **Neovim** | `config/nvim/init.lua` | Plugin management and core configuration |
| **Fish** | `config/fish/config.fish` | Aliases, functions, prompt customization |

## Key Mappings

### i3 Window Manager
| Key Combination | Action |
|-----------------|--------|
| `Super + Return` | Open terminal (kitty) |
| `Super + d` | Open dmenu application launcher |
| `Super + q` | Close focused window |
| `Super + h/j/k/l` | Navigate windows |
| `Super + Shift + h/j/k/l` | Move windows |
| `Super + 1-9` | Switch to workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + f` | Toggle fullscreen |
| `Super + Shift + r` | Reload i3 configuration |
| `Super + Shift + l` | Lock screen (i3lock) |
| `Super + w` | Toggle polybar visibility |
| `Super + z` | Open zen-browser |
| `Super + Shift + d` | Open vesktop (Discord) |
| `Print` | Take screenshot (flameshot) |

### Neovim
| Key Combination | Action |
|-----------------|--------|
| `Space` | Leader key |
| `Shift + h/l` | Previous/Next buffer |
| `Leader + q/Q` | Close buffer (normal/force) |
| `Leader + f` | Find files in current directory |
| `Leader + g` | Grep search |
| `Leader + t` | Toggle file explorer |
| `Leader + z` | Open floating terminal |
| `Leader + p` | Cycle color themes |
| `Leader + w` | Save file |
| `Leader + s` | Search and replace |
| `Ctrl + h/j/k/l` | Navigate windows |
| `Alt + 1-9` | Go to buffer by number |

### Fish Shell Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `ll` | `ls -la` | Detailed file listing |
| `la` | `ls -a` | Show all files including hidden |
| `cls/c` | `clear` | Clear terminal |
| `nv` | `nvim` | Open Neovim |
| `g` | `git` | Git shorthand |
| `ga` | `git add` | Stage changes |
| `gc` | `git commit` | Commit changes |
| `gp` | `git push` | Push to remote |
| `gs` | `git status` | Show git status |
| `sys-upgrade` | Full system update | Update packages (Arch-based) |
| `dv` | `yt-dlp --no-playlist` | Download video |
| `done` | `git add . && git commit && git push` | Quick commit and push |

### Fish Shell Functions
| Function | Description |
|----------|-------------|
| `extract <file>` | Extract any archive format |
| `ff <pattern>` | Find files by name |
| `psg <process>` | Search running processes |
| `weather [city]` | Get weather information |

## Project Structure

```
cg-i3dotfiles/
├── install                    # Installation script
├── README.md                  # This file
└── config/
    ├── fish/                  # Fish shell configuration
    │   ├── config.fish       # Main fish config with aliases and functions
    │   ├── conf.d/           # Additional fish configurations
    │   └── README.md         # Fish-specific documentation
    ├── i3/
    │   └── config            # i3 window manager configuration
    ├── i3lock/               # Screen lock configurations
    │   ├── theme.conf        # Theme settings for advanced lock
    │   ├── lock-simple.sh    # Simple lock script
    │   ├── lock-advanced.sh  # Advanced lock with blur effects
    │   └── lock.sh           # Default lock script
    ├── nvim/                 # Neovim configuration
    │   ├── init.lua          # Main Neovim configuration
    │   ├── lua/config/       # Core configuration modules
    │   ├── lua/plugins/      # Plugin configurations
    │   └── README.md         # Detailed Neovim documentation
    └── polybar/              # Polybar status bar
        ├── config.ini        # Main polybar configuration
        ├── scripts/          # Custom polybar scripts
        ├── launch_polybar.sh # Polybar startup script
        ├── mic-input.sh      # Microphone status script
        ├── mic-volume.sh     # Microphone volume script
        └── README.md         # Polybar-specific documentation
```

## Polybar Modules

- **Workspaces**: Interactive workspace indicator
- **Window Title**: Shows active window title
- **Microphone**: Clickable microphone control with mute toggle
- **Audio**: Volume control with click-to-mute and scroll adjustment
- **System Monitoring**: CPU and memory usage
- **Intel GPU**: Real-time GPU usage and frequency (Intel only)
- **Battery**: Battery status with charging indicators
- **Network**: Wireless network information
- **Notifications**: Dunst notification control (pause/resume)
- **Date/Time**: Current date and time display

## Customization Tips

### Changing Themes
- **i3lock**: Edit `config/i3lock/theme.conf` to modify colors, fonts, and effects
- **Polybar**: Modify color definitions in `config/polybar/config.ini`
- **Neovim**: Use `Leader + p` to cycle through available themes
- **Fish**: Customize prompt colors in the `fish_prompt` function

### Adding Applications
- **i3**: Add keybindings in `config/i3/config`
- **Fish**: Add aliases in `config/fish/config.fish`
- **Polybar**: Add custom modules in `config/polybar/config.ini`

### System-Specific Adjustments
- **Fish aliases**: Update package manager commands for your distribution
- **Polybar network**: Change interface name in wlan module if needed
- **Battery**: Adjust battery identifier in polybar config if not BAT0

## Notes

- This configuration is optimized for Arch-based systems but works on majority Linux distributions
- Fish shell aliases include Arch-specific package management commands
- Intel GPU monitoring requires Intel graphics hardware and intel-gpu-tools
- Some applications (zen-browser, vesktop) are optional and referred in keybindings
- The configuration assumes a wallpaper at `~/Pictures/Wallpapers/dark-city.jpg`

## License

This configuration is provided as-is for personal use and modification.
