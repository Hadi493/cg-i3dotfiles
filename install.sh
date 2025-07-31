#!/bin/bash

# CG Dotfiles Installation Script
# Author: CG (@cyber-green)
# Description: Automated installation script for dotfiles using GNU Stow

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Helper functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "${PURPLE}[STEP]${NC} $1"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    print_error "This script should not be run as root"
    exit 1
fi

print_info "Starting CG Dotfiles installation..."

# Check if stow is installed
print_step "Checking for GNU Stow..."
if ! command -v stow &> /dev/null; then
    print_warning "GNU Stow is not installed. Installing..."
    
    # Detect package manager and install stow
    if command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm stow
    elif command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y stow
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y stow
    elif command -v yum &> /dev/null; then
        sudo yum install -y stow
    else
        print_error "Could not install GNU Stow. Please install it manually."
        exit 1
    fi
    print_success "GNU Stow installed successfully"
else
    print_success "GNU Stow is already installed"
fi

# Backup existing configurations
print_step "Creating backup of existing configurations..."
BACKUP_DIR="$HOME/.config/backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

configs_to_backup=("i3" "polybar" "nvim" "fish" "kitty")
for config in "${configs_to_backup[@]}"; do
    if [[ -d "$HOME/.config/$config" ]]; then
        print_info "Backing up $config configuration..."
        mv "$HOME/.config/$config" "$BACKUP_DIR/"
    fi
done

if [[ -n "$(ls -A $BACKUP_DIR 2>/dev/null)" ]]; then
    print_success "Backup completed in $BACKUP_DIR"
else
    rmdir "$BACKUP_DIR"
    print_info "No existing configurations found to backup"
fi

# Install configurations using stow
print_step "Installing dotfiles using GNU Stow..."

# Get script directory (dotfiles directory)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Available packages
packages=("i3" "polybar" "nvim" "fish" "kitty")

# Install each package
for package in "${packages[@]}"; do
    if [[ -d "$package" ]]; then
        print_info "Installing $package configuration..."
        stow "$package"
        print_success "$package configuration installed"
    else
        print_warning "$package directory not found, skipping..."
    fi
done

# Make scripts executable
print_step "Making scripts executable..."
if [[ -d "$HOME/.config/polybar" ]]; then
    chmod +x "$HOME/.config/polybar"/*.sh 2>/dev/null || true
    print_success "Polybar scripts made executable"
fi

if [[ -d "$HOME/.config/i3lock" ]]; then
    chmod +x "$HOME/.config/i3lock"/*.sh 2>/dev/null || true
    print_success "i3lock scripts made executable"
fi

# Check for required dependencies
print_step "Checking for required dependencies..."

dependencies=(
    "i3:i3-wm"
    "polybar:polybar"
    "nvim:neovim"
    "fish:fish"
    "kitty:kitty"
    "git:git"
    "curl:curl"
    "rg:ripgrep"
)

missing_deps=()

for dep in "${dependencies[@]}"; do
    cmd="${dep%%:*}"
    pkg="${dep##*:}"
    
    if ! command -v "$cmd" &> /dev/null; then
        missing_deps+=("$pkg")
    fi
done

if [[ ${#missing_deps[@]} -gt 0 ]]; then
    print_warning "Missing dependencies detected:"
    for dep in "${missing_deps[@]}"; do
        echo "  - $dep"
    done
    
    echo ""
    print_info "Install missing dependencies with your package manager:"
    
    # Provide installation commands for different distros
    if command -v pacman &> /dev/null; then
        echo -e "${CYAN}Arch Linux:${NC} sudo pacman -S ${missing_deps[*]}"
    elif command -v apt &> /dev/null; then
        echo -e "${CYAN}Ubuntu/Debian:${NC} sudo apt install ${missing_deps[*]}"
    elif command -v dnf &> /dev/null; then
        echo -e "${CYAN}Fedora:${NC} sudo dnf install ${missing_deps[*]}"
    fi
else
    print_success "All required dependencies are installed"
fi

# Font check
print_step "Checking for Nerd Fonts..."
if fc-list | grep -i "nerd" &> /dev/null; then
    print_success "Nerd Fonts detected"
else
    print_warning "No Nerd Fonts found. Please install a Nerd Font for proper icon display."
    print_info "Recommended: JetBrains Mono Nerd Font or Fira Code Nerd Font"
    print_info "Download from: https://github.com/ryanoasis/nerd-fonts"
fi

# Completion message
echo ""
print_success "🎉 Dotfiles installation completed!"
echo ""
print_info "Next steps:"
echo "  1. Install any missing dependencies listed above"
echo "  2. Install a Nerd Font if not already installed"
echo "  3. Reload your i3 configuration: i3-msg reload"
echo "  4. Restart polybar: ~/.config/polybar/launch_polybar.sh"
echo "  5. Start fish shell: fish"
echo ""
print_info "Configuration files are now symlinked to your ~/.config directory"
print_info "You can safely edit files in this dotfiles directory"
print_info "Changes will be reflected immediately in your configurations"
echo ""
print_info "For uninstallation, run: stow -D i3 polybar nvim fish kitty"
echo ""
print_success "Enjoy your new setup! 🚀"
