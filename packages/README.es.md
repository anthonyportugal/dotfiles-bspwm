# Manifiestos de BSPWM

*Leer esto en otros idiomas:* [English](README.md)

Estos archivos son datos de entrada para `bin/bspwm`; no son scripts. Usan un
nombre de paquete por línea, omiten líneas vacías y comentarios, y no fijan
versiones de una distribución rolling.

## Perfiles

Los perfiles son acumulativos:

| Perfil | Contenido | Paquete Stow |
| --- | --- | --- |
| `core` | Servidor Xorg, autorización Xauth, bspwm, sxhkd, GNU Stow, herramientas de display/teclado (`xorg-xrandr`, `xorg-setxkbmap`, `xorg-xsetroot`) y utilidades de bloqueo de sesión (`util-linux` / `flock`). | `bspwm` |
| `desktop` | `core` más barra Polybar, compositor Picom, launcher Rofi, notificaciones Dunst, remapeo `xcape`, bloqueador Catppuccin `i3lock-color` (AUR), fondos con Feh, capturas y grabación (Maim, Slop, Satty, FFmpeg), audio PipeWire completo (`pipewire`, `pipewire-alsa`, `pipewire-pulse`, `wireplumber`), control de medios Playerctl, gestión de energía (`power-profiles-daemon`), Bluetooth (`bluez-utils`), filtro nocturno Redshift, portapapeles `xclip`, navegador Brave, visor/editor Micro, emulador Alacritty y fuentes. | `bspwm` |

Ambos perfiles seleccionan el único paquete Stow `bspwm`. El perfil predeterminado es `desktop`.

## Procedencia

La resolución respeta la prioridad estándar del ecosistema:

1. Repositorios de CachyOS (e.g., `brave-bin` en `packages/cachyos/desktop.txt`);
2. Repositorios oficiales de Arch Linux (`repo/`);
3. AUR (`aur/`) cuando no existe un paquete binario oficial equivalente.

### Decisiones técnicas clave

- **`xorg-xauth` en `core`:** Esencial para que display managers ligeros como Ly autoricen correctamente la sesión X11.
- **`xorg-setxkbmap` y `xorg-xsetroot`:** Aplican configuraciones portables de teclado (alternancia de idioma con Alt+Espacio) y establecen el cursor de inicio sin alterar configuraciones globales del sistema.
- **`util-linux`:** Provee `flock`, utilizado en los scripts de arranque para impedir ejecuciones duplicadas o concurrentes de Polybar y demonios de fondo.
- **`xcape` en `desktop`:** Permite usar la tecla Super para abrir el launcher Rofi al pulsarse y soltarse rápidamente, sin interferir con combinaciones que la mantienen presionada.
- **`i3lock-color` (AUR):** Provee la pantalla de bloqueo con anillo, fecha y reloj Catppuccin Mocha, logrando paridad visual completa con MangoWM / Wayland.
- **Brave Browser:** Declarado de forma dual: `cachyos/desktop.txt` para CachyOS y `aur/desktop-fallback.txt` para Arch genérico.
- **`external/`:** Sin descargas directas externas en este componente.

## Backends

La detección automática intenta Shelly sólo en CachyOS y continúa con `paru`,
`yay` y `pacman`. Shelly, paru y yay pueden resolver el paquete AUR (`i3lock-color` y fallback de Brave).
`pacman` se limita a paquetes binarios y el preflight detiene la ejecución si falta un paquete AUR.

Los manifiestos son completamente autónomos. Pueden declarar utilidades que
también solicita la base; el gestor de paquetes deduplica la instalación de forma
idempotente y este repositorio no consulta manifiestos externos.
