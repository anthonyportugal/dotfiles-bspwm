# BSPWM Manifests

*Read this in other languages:* [Español](README.es.md)

These files serve as declarative inputs for `bin/bspwm`; they are not executable
scripts. They use one package name per line, omit blank lines and comments, and
avoid pinning rolling-release package versions.

## Profiles

Profiles are cumulative:

| Profile | Content | Stow Package |
| --- | --- | --- |
| `core` | Xorg server, Xauth authorization, bspwm, sxhkd, GNU Stow, display/keyboard utilities (`xorg-xrandr`, `xorg-setxkbmap`, `xorg-xsetroot`), and session locking helpers (`util-linux` / `flock`). | `bspwm` |
| `desktop` | `core` plus Polybar, Picom compositor, Rofi launcher, Dunst notifications, `xcape` key remapping, Catppuccin lockscreen (`i3lock-color` from AUR), Feh wallpaper daemon, screen capture/recording (Maim, Slop, Satty, FFmpeg), full PipeWire audio (`pipewire`, `pipewire-alsa`, `pipewire-pulse`, `wireplumber`), Playerctl media control, power management (`power-profiles-daemon`), Bluetooth (`bluez-utils`), Redshift night light, `xclip` clipboard, Brave browser, Micro editor, Alacritty terminal, and fonts. | `bspwm` |

Both profiles select the single Stow package `bspwm`. The default profile is `desktop`.

## Provenance

Resolution respects the ecosystem's standard priority:

1. CachyOS repositories (e.g., `brave-bin` via `packages/cachyos/desktop.txt`);
2. Official Arch Linux repositories (`repo/`);
3. AUR (`aur/`) only when an appropriate official binary package does not exist.

### Key Technical Decisions

- **`xorg-xauth` in `core`:** Essential for lightweight display managers like Ly
  to authorize the X11 session properly.
- **`xorg-setxkbmap` and `xorg-xsetroot`:** Apply portable session keyboard layouts
  (group toggle via Alt+Space) and set the initial cursor without altering global
  system-level policies.
- **`util-linux`:** Provides `flock`, used in startup scripts to prevent concurrent
  or duplicate instances of Polybar and background daemons.
- **`xcape` in `desktop`:** Allows opening Rofi upon tapping Super alone, without
  interfering with chorded shortcuts that hold Super down.
- **`i3lock-color` (AUR):** Delivers a Catppuccin Mocha lockscreen with clock, date,
  and ring indicators, maintaining full visual parity with MangoWM / Wayland.
- **Brave Browser:** Declared dual-source: `cachyos/desktop.txt` on CachyOS and
  `aur/desktop-fallback.txt` on generic Arch Linux.
- **`external/`:** No direct external downloads are used in this component.

## Backends

Detection attempts Shelly only on CachyOS and continues through `paru`, `yay`,
and `pacman`. Shelly, paru, and yay can resolve AUR packages (`i3lock-color` and
the Brave fallback).
`pacman` is strictly limited to binary packages, and preflight halts execution
if an AUR package is missing.

Manifests are completely autonomous. They may repeat utilities also declared by
the base repository; package manager idempotency deduplicates installation
cleanly without cross-repository manifest inspections.
