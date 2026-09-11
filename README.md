# BSPWM Dotfiles

<p align="center">
  <a href="https://github.com/anthonyportugal/dotfiles-bspwm/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/anthonyportugal/dotfiles-bspwm/ci.yml?branch=main&style=flat-square&logo=githubactions&logoColor=white&label=CI" alt="CI"></a>
  <a href="https://kernel.org"><img src="https://img.shields.io/badge/OS-Linux-FCC624?style=flat-square&logo=linux&logoColor=black" alt="Linux"></a>
  <a href="https://archlinux.org"><img src="https://img.shields.io/badge/Arch_Linux-1793D1?style=flat-square&logo=archlinux&logoColor=white" alt="Arch Linux"></a>
  <a href="https://cachyos.org"><img src="https://img.shields.io/badge/CachyOS-Supported-00A86B?style=flat-square" alt="CachyOS"></a>
  <a href="https://www.x.org"><img src="https://img.shields.io/badge/Display-X11-red?style=flat-square&logo=xorg&logoColor=white" alt="X11"></a>
  <a href="https://github.com/baskerville/bspwm"><img src="https://img.shields.io/badge/WM-BSPWM-black?style=flat-square" alt="BSPWM"></a>
  <a href="https://github.com/catppuccin/catppuccin"><img src="https://img.shields.io/badge/Theme-Catppuccin_Mocha-f5c2e7?style=flat-square&logo=catppuccin&logoColor=1e1e2e" alt="Theme"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License"></a>
</p>

*Read this in other languages:* [Español](README.es.md)

Autonomous, modular, and minimal X11 desktop session optimized for **Arch Linux** based on [BSPWM](https://github.com/baskerville/bspwm) and styled with the Catppuccin Mocha palette with Pink accents. It functions completely standalone or composed with the primary modular dotfiles ecosystem.

<p align="center">
  <img src="assets/screenshot.webp" alt="BSPWM Desktop Preview" width="100%">
</p>

> [!TIP]
> 🧩 **Modular Dotfiles Ecosystem:**  
> [Base & CLI](https://github.com/anthonyportugal/dotfiles) • [MangoWM (Wayland)](https://github.com/anthonyportugal/dotfiles-mangowm) • **BSPWM (X11) [Current]** • [Wallpapers](https://github.com/anthonyportugal/walls) • [System (Ly & Limine)](https://github.com/anthonyportugal/dotfiles-system)
> 
> This repository provides a standalone, production-ready X11 desktop environment and seamlessly integrates with the base dotfiles ecosystem.

---

## ✨ Key Highlights

- ⚡ **Lightweight & Blazing Fast:** Minimal memory footprint on X11 with instant binary-tree window partitioning.
- 🎨 **Catppuccin Mocha Aesthetics:** Consistent styling across Alacritty, Polybar, Rofi, Dunst, and Picom with Pink (`#f5c2e7`) semantic accents.
- 📊 **Dynamic Polybar:** Real-time auto-detection of active network interfaces (Wi-Fi/Ethernet), battery status, and MPRIS playback.
- 🎛️ **Ergonomic Hotkeys:** Intuitive keybinding architecture driven by `sxhkd` with integrated interactive help menu (`Super + ?`).
- 🔋 **Power & Night Light:** Built-in Redshift warm display control and interactive power profile selector (`power-profiles-daemon`).
- 🔒 **GNU Stow & Zero Bloat:** Cumulative profiles (`core`, `desktop`) with built-in dry-run safety and health diagnostics (`doctor`).

---

## 🧱 Modular Architecture

The BSPWM configuration is organized into cumulative profiles managed with [GNU Stow](https://www.gnu.org/software/stow/):

```text
┌────────────────────────────────────────────────────────────────────────┐
│                       BSPWM DESKTOP ECOSYSTEM (X11)                    │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                    DESKTOP PROFILE (UX & Tools)                  │  │
│  │  • Status Bar: Polybar (Catppuccin Pink, Dynamic Interfaces)     │  │
│  │  • App Launcher & Power Menu: Rofi                               │  │
│  │  • Notifications: Dunst                                          │  │
│  │  • Compositor & Shadows: Picom (GLX / XRender)                   │  │
│  │  • Wallpaper & Media: Feh, Playerctl, MPV-MPRIS                  │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                      CORE PROFILE (Minimal X11)                  │  │
│  │  • Window Manager: BSPWM (Binary Space Partitioning)             │  │
│  │  • Hotkey Daemon: SXHKD                                          │  │
│  │  • X11 Auth & Keyboard Layouts: Xauth, Setxkbmap (US / Latam)    │  │
│  │  • Terminal: Alacritty (Catppuccin Theme)                        │  │
│  └──────────────────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────────────────┘
```

### Profile Breakdown

| Profile | Stow Package | Contents | Intended Target |
| :--- | :--- | :--- | :--- |
| **`core`** | `bspwm` | BSPWM configuration, SXHKD key daemon, Xauth, Setxkbmap, and Alacritty styling. | Minimal systems, servers with X11, headless setups. |
| **`desktop`** | Reuses `bspwm` | Core + Polybar, Rofi app launcher, Dunst notifications, Picom compositor, Feh, Satty, FFmpeg recording, and brightness/audio hooks. | Full desktop workstations, laptops, and VMs. |

---

## 🛠️ Approved Tech Stack

| Capability | Component | Purpose |
| :--- | :--- | :--- |
| **Window Manager** | [`bspwm`](https://github.com/baskerville/bspwm) | Binary space partitioning tiling manager |
| **Hotkey Daemon** | `sxhkd` | Simple X hotkey daemon |
| **Status Bar** | `polybar` | Edge-to-edge status bar with dynamic battery and network detection |
| **App Launcher** | `rofi` | Application launcher and power menu |
| **Compositor** | `picom` | Smooth shadows, window transparency, and GLX rendering |
| **Terminal** | `alacritty` | GPU-accelerated terminal emulator themed with Catppuccin |
| **Notifications** | `dunst` | Customizable, lightweight notification daemon |
| **Wallpaper** | `feh` | Wallpaper setter with interactive selector |
| **Night Light** | `redshift` | Screen color temperature adjustment |
| **Audio / Media** | PipeWire & Playerctl | Modern audio stack with MPRIS media control |
| **Screenshots** | `satty` & `maim` | Fullscreen and region capture with interactive annotation editor |

---

## 🚀 Installation & Quickstart

The included `./bin/bspwm` CLI handles package installation and GNU Stow symlinking with built-in dry-run safety.

### 1. Standalone Setup (Recommended)

```bash
mkdir -p "$HOME/.dotfiles/wm"
git clone https://github.com/anthonyportugal/dotfiles-bspwm.git "$HOME/.dotfiles/wm/bspwm"
cd "$HOME/.dotfiles/wm/bspwm"
```

### 2. Bootstrap the Environment

#### Option A: Interactive Setup Wizard (Recommended)

Run the interactive setup wizard to configure your profile and installation scope:

```bash
# Launch interactive wizard (default: English)
./bin/bspwm setup

# Or launch directly in Spanish
./bin/bspwm setup --lang es
```

#### Option B: Manual Command-Line Bootstrap

- **Full Desktop Experience (Recommended):**
  ```bash
  ./bin/bspwm bootstrap --profile desktop --apply
  ```
- **Minimal Core Session (Window Manager Only):**
  ```bash
  ./bin/bspwm bootstrap --profile core --apply
  ```

### Helpful Bootstrap Flags

- **Dry-run simulation (Safe check):** Omit `--apply` to preview actions without touching the filesystem:
  ```bash
  ./bin/bspwm bootstrap --profile desktop
  ```
- **Diagnostics:** Check health, dependencies, and symlink integrity:
  ```bash
  ./bin/bspwm doctor --profile desktop
  ```
- **Unlink / Clean:** Remove managed symlinks safely:
  ```bash
  ./bin/bspwm unlink --profile desktop --apply
  ```
- **AUR Backend:** Automatically detected (`shelly`, `paru`, `yay`), or manually specified via `--backend <name>`.

---

## 🔗 Integration with Base Dotfiles

While this repository operates **100% standalone**, it seamlessly integrates with the base dotfiles ecosystem:

- 🌐 **Primary Base Repository:** [anthonyportugal/dotfiles](https://github.com/anthonyportugal/dotfiles)
- **Shared Ecosystem:** When installed alongside the base repository, Alacritty terminal styling, Zsh configurations, Neovim setups, and GTK theme preferences are shared effortlessly between X11 and Wayland sessions.

---

## ⌨️ Primary Keybindings

### Applications & Launchers

| Shortcut | Action |
| :--- | :--- |
| `Super + Return` | Open Alacritty terminal (Tiling) |
| `Super + Shift + Return` | Open floating Alacritty terminal |
| `Super + D` | Open Rofi application launcher |
| `Super + B` | Open default web browser (Brave) |
| `Super + E` | Open graphical file manager (Thunar) |
| `Super + ?` / `Super + Shift + ?` | Open interactive keybindings cheat sheet |

### Window Management

| Shortcut | Action |
| :--- | :--- |
| `Super + C` / `Super + Shift + C` | Close / Kill focused window |
| `Super + T` | Toggle layout (*Tiled / Monocle*) |
| `Super + Escape` | Restart BSPWM session and reload SXHKD |
| `Super + Shift + Escape` | Quit BSPWM session |

### System & Utilities

| Shortcut | Action |
| :--- | :--- |
| `Super + L` | Lock screen immediately (slock / i3lock) |
| `Super + X` | Open session power menu (Rofi) |
| `Super + Shift + P` | Open interactive Power Profiles selector (Rofi) |
| `Super + N` | Toggle warm night light (Redshift) |
| `Super + W` | Select wallpaper from gallery via Rofi (Feh) |
| `Alt + Space` | Toggle keyboard layout between US and Latin America |
| `Print` / `Super + S` | Fullscreen screenshot |
| `Super + Shift + S` | Interactive region screenshot with Satty annotation editor |
| `Super + R` / `Super + Shift + R` | Fullscreen / Interactive region screen recording (FFmpeg) |
| `Super + Alt + R` | Open screen recording audio options menu (Rofi) |

---

## 🧪 Testing & Verification

Run the automated test suite locally to verify links, configuration syntax, and session scripts:

```bash
./tests/bootstrap-smoke.sh
./tests/session-smoke.sh
```

---

## 📄 License

Original code and configuration are licensed under the [MIT License](LICENSE).
Catppuccin color schemes and third-party notices are attributed in `THIRD_PARTY_NOTICES.md`.
