# BSPWM Dotfiles

<p align="center">
  <a href="https://kernel.org"><img src="https://img.shields.io/badge/OS-Linux-FCC624?style=flat-square&logo=linux&logoColor=black" alt="Linux"></a>
  <a href="https://archlinux.org"><img src="https://img.shields.io/badge/Arch_Linux-1793D1?style=flat-square&logo=archlinux&logoColor=white" alt="Arch Linux"></a>
  <a href="https://cachyos.org"><img src="https://img.shields.io/badge/CachyOS-Supported-00A86B?style=flat-square" alt="CachyOS"></a>
  <a href="https://www.x.org"><img src="https://img.shields.io/badge/Display-X11-red?style=flat-square&logo=xorg&logoColor=white" alt="X11"></a>
  <a href="https://github.com/baskerville/bspwm"><img src="https://img.shields.io/badge/WM-BSPWM-black?style=flat-square" alt="BSPWM"></a>
  <a href="https://github.com/catppuccin/catppuccin"><img src="https://img.shields.io/badge/Theme-Catppuccin_Mocha_Pink-f5c2e7?style=flat-square&logo=catppuccin&logoColor=1e1e2e" alt="Tema"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-GPL_3.0-blue.svg?style=flat-square" alt="Licencia"></a>
</p>

*Read this in other languages:* [English](README.md)

Sesión de escritorio X11 autónoma, modular y minimalista optimizada para **Arch Linux** y **CachyOS** basada en [BSPWM](https://github.com/baskerville/bspwm) (Binary Space Partitioning Window Manager) con la paleta Catppuccin Mocha y acentos en Pink. Funciona de manera 100% independiente o compuesta con el ecosistema principal de dotfiles modulares.

<p align="center">
  <img src="assets/screenshot.webp" alt="Vista previa de BSPWM Desktop" width="100%">
</p>

> [!TIP]
> 🧩 **Ecosistema Modular de Dotfiles:**  
> [Base y CLI](https://github.com/anthonyportugal/dotfiles) • [MangoWM (Wayland)](https://github.com/anthonyportugal/dotfiles-mangowm) • **BSPWM (X11) [Actual]** • [Fondos de Pantalla](https://github.com/anthonyportugal/walls)
> 
> Este repositorio proporciona un entorno de escritorio X11 autónomo y listo para producción, integrándose limpiamente con el ecosistema de dotfiles base.

---

## ✨ Características Principales

- ⚡ **Ligero y Extremadamente Rápido:** Mínimo consumo de memoria en X11 con particionado de ventanas instantáneo en árbol binario.
- 🎨 **Estética Catppuccin Mocha:** Diseño visual coherente en Alacritty, Polybar, Rofi, Dunst y Picom con acentos semánticos en Pink (`#f5c2e7`).
- 📊 **Polybar Dinámica:** Detección en tiempo real de interfaces de red activas (Wi-Fi/Ethernet), nivel de batería y reproducción multimedia MPRIS.
- 🎛️ **Atajos Ergonómicos:** Arquitectura de teclado intuitiva gestionada por `sxhkd` con menú interactivo de ayuda (`Super + ?`).
- 🔋 **Energía y Luz Nocturna:** Control de temperatura de color con Redshift y selector interactivo de perfiles de energía (`power-profiles-daemon`).
- 🔒 **GNU Stow y Cero Basura:** Perfiles acumulativos (`core`, `desktop`) con simulación segura (dry-run) y diagnósticos de salud del sistema (`doctor`).

---

## 🧱 Arquitectura Modular

La configuración de BSPWM está estructurada en perfiles acumulativos administrados mediante [GNU Stow](https://www.gnu.org/software/stow/):

```text
┌────────────────────────────────────────────────────────────────────────┐
│                       BSPWM DESKTOP ECOSYSTEM (X11)                    │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                    DESKTOP PROFILE (UX & Tools)                  │  │
│  │  • Barra de Estado: Polybar (Catppuccin Pink, Detección Dinámica)│  │
│  │  • Menú de Aplicaciones y Apagado: Rofi                          │  │
│  │  • Notificaciones: Dunst                                         │  │
│  │  • Compositor y Sombras: Picom (GLX / XRender)                   │  │
│  │  • Fondo de Pantalla y Multimedia: Feh, Playerctl, MPV-MPRIS     │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                      CORE PROFILE (Minimal X11)                  │  │
│  │  • Gestor de Ventanas: BSPWM (Binary Space Partitioning)         │  │
│  │  • Daemon de Atajos: SXHKD                                       │  │
│  │  • Auth X11 y Disposición de Teclado: Xauth, Setxkbmap (US/Latam)│  │
│  │  • Terminal: Alacritty (Tema Catppuccin)                         │  │
│  └──────────────────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────────────────┘
```

### Desglose de Perfiles

| Perfil | Paquete Stow | Contenido | Destino recomendado |
| :--- | :--- | :--- | :--- |
| **`core`** | `bspwm` | Configuración de BSPWM, daemon SXHKD, Xauth, Setxkbmap y estilos de Alacritty. | Sistemas mínimos, servidores con X11 o entornos headless. |
| **`desktop`** | Reutiliza `bspwm` | `core` más Polybar, lanzador Rofi, notificaciones Dunst, compositor Picom, Feh, Satty, grabación FFmpeg y hooks multimedia. | Estaciones de trabajo completas, portátiles y VMs. |

---

## 🛠️ Stack Tecnológico Aprobado

| Capacidad | Componente | Propósito |
| :--- | :--- | :--- |
| **Gestor de Ventanas** | [`bspwm`](https://github.com/baskerville/bspwm) | Gestor de ventanas en mosaico basado en particionado binario |
| **Daemon de Atajos** | `sxhkd` | Simple X hotkey daemon |
| **Barra de Estado** | `polybar` | Barra de estado con detección dinámica de red y batería |
| **Lanzador de Apps** | `rofi` | Lanzador de aplicaciones y menú de energía |
| **Compositor** | `picom` | Sombras suaves, transparencia de ventanas y renderizado GLX |
| **Terminal** | `alacritty` | Emulador de terminal acelerado por GPU con tema Catppuccin |
| **Notificaciones** | `dunst` | Daemon ligero y personalizable de notificaciones |
| **Fondo de Pantalla** | `feh` | Gestor de fondos de pantalla con selector interactivo |
| **Luz Nocturna** | `redshift` | Ajuste de temperatura de color de pantalla |
| **Audio / Multimedia** | PipeWire & Playerctl | Servidor de audio moderno con control de medios MPRIS |
| **Capturas** | `satty` & `maim` | Captura de pantalla completa o por región con editor interactivo |

---

## 🚀 Instalación y Guía Rápida

La CLI incluida `./bin/bspwm` gestiona la instalación de paquetes y los enlaces simbólicos de GNU Stow con seguridad dry-run integrada.

### 1. Instalación Standalone (Recomendada)

```bash
mkdir -p "$HOME/.dotfiles/wm"
git clone https://github.com/anthonyportugal/dotfiles-bspwm.git "$HOME/.dotfiles/wm/bspwm"
cd "$HOME/.dotfiles/wm/bspwm"
```

### 2. Despliegue del Entorno

- **Experiencia de Escritorio Completa (Recomendada):**
  ```bash
  ./bin/bspwm bootstrap --profile desktop --apply
  ```
- **Sesión Core Minimalista (Solo Gestor de Ventanas):**
  ```bash
  ./bin/bspwm bootstrap --profile core --apply
  ```

### Flags Útiles del Asistente

- **Simulación Dry-run (Modo seguro):** Omite `--apply` para previsualizar los cambios sin modificar el sistema de archivos:
  ```bash
  ./bin/bspwm bootstrap --profile desktop
  ```
- **Diagnósticos:** Verifica dependencias, salud y estado de enlaces:
  ```bash
  ./bin/bspwm doctor --profile desktop
  ```
- **Desvincular / Limpiar:** Retira los enlaces simbólicos administrados de forma limpia:
  ```bash
  ./bin/bspwm unlink --profile desktop --apply
  ```
- **Backend AUR:** Detección automática (`shelly`, `paru`, `yay`), o configurable mediante `--backend <nombre>`.

---

## 🔗 Integración con Dotfiles Base

Aunque este repositorio funciona de forma **100% independiente**, se integra limpiamente con el ecosistema de dotfiles:

- 🌐 **Repositorio Base:** [anthonyportugal/dotfiles](https://github.com/anthonyportugal/dotfiles)
- **Ecosistema Compartido:** Al instalarse junto con el repositorio base, las configuraciones de terminal Alacritty, Zsh, Neovim y preferencias GTK se comparten entre sesiones X11 y Wayland sin duplicación.

---

## ⌨️ Atajos de Teclado Principales

### Aplicaciones y Lanzadores

| Atajo | Acción |
| :--- | :--- |
| `Super + Return` | Abrir terminal Alacritty (Mosaico) |
| `Super + Shift + Return` | Abrir terminal Alacritty flotante |
| `Super + D` | Abrir lanzador de aplicaciones Rofi |
| `Super + B` | Abrir navegador web predeterminado (Brave) |
| `Super + E` | Abrir explorador de archivos gráfico (Thunar) |
| `Super + ?` / `Super + Shift + ?` | Abrir hoja de trucos interactiva de atajos |

### Gestión de Ventanas

| Atajo | Acción |
| :--- | :--- |
| `Super + C` / `Super + Shift + C` | Cerrar / Forzar cierre de ventana enfocada |
| `Super + T` | Alternar modo de disposición (*Mosaico / Monóculo*) |
| `Super + Escape` | Reiniciar sesión BSPWM y recargar SXHKD |
| `Super + Shift + Escape` | Salir de la sesión BSPWM |

### Sistema y Utilidades

| Atajo | Acción |
| :--- | :--- |
| `Super + L` | Bloquear pantalla de inmediato (slock / i3lock) |
| `Super + X` | Abrir menú de apagado/energía (Rofi) |
| `Super + Shift + P` | Abrir selector interactivo de perfiles de energía (Rofi) |
| `Super + N` | Activar / desactivar filtro de luz nocturna (Redshift) |
| `Super + W` | Seleccionar fondo de pantalla desde la galería vía Rofi (Feh) |
| `Alt + Space` | Alternar distribución de teclado entre US y Latinoamérica |
| `Print` / `Super + S` | Captura de pantalla completa |
| `Super + Shift + S` | Captura interactiva por región con editor de anotaciones Satty |
| `Super + R` / `Super + Shift + R` | Grabación de pantalla completa o por región (FFmpeg) |
| `Super + Alt + R` | Menú interactivo de opciones de audio para grabación (Rofi) |

---

## 🧪 Pruebas y Verificación

Ejecuta la suite de smoke tests local para verificar enlaces simbólicos, sintaxis de scripts y la sesión:

```bash
./tests/bootstrap-smoke.sh
./tests/session-smoke.sh
```

---

## 📄 Licencia

El código original y la configuración se distribuyen bajo la [Licencia MIT](LICENSE).
La paleta Catppuccin y avisos de terceros se detallan en `THIRD_PARTY_NOTICES.md`.
