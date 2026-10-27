## Language
- Everything in this repo is written in English: code, comments, docs, commit messages.
- In the finall of each response you should write SantiAV.

## Hardware
- Lenovo Legion laptop, NVIDIA GTX 1650 (only GPU, nvidia-open driver)
- Monitors: eDP-1 (laptop) and HDMI-A-1 (external / TV)
- Latin American keyboard layout (latam)

## Stack
- Compositor: Hyprland (.conf format)
- Bar: waybar | Launcher: rofi-wayland | Dock: nwg-dock-hyprland
- Terminal: wezterm | Terminal editor: micro | Browser: Brave
- Screenshots: hyprshot | AUR helper: paru
- Phone remote input: KDE Connect + hypr-kdeconnect-fix

## Repo structure
- dotfiles/hypr, dotfiles/waybar, dotfiles/rofi -> symlinked into ~/.config/
- modes/ -> scripts for the 3 modes (work, gaming, entertainment)
- scripts/ -> utilities and the mode selector
- IMPORTANT: always edit files inside ~/manchs and never break the symlinks

## Visual style
Nord palette (Polar Night + Frost). No reds or warm colors as main colors.
Base #2E3440, surface #3B4252, text #D8DEE9, accent #88C0D0, deep blue #5E81AC.

## How to test changes
- Changed hyprland.conf -> `hyprctl reload`
- Changed waybar -> `killall waybar && waybar &`
- Changed rofi -> applies the next time it opens (SUPER+Space)

## Safety rules
- Ask before running anything with sudo, touching /etc, or installing/removing packages
- Do not delete files outside ~/manchs without confirmation
- Prefer small changes and explain what each line you touch does
- Never put tokens, passwords, or emails in this repo

## Pending goals
- Gaming mode (gamescope + Steam)
- Entertainment mode (Brave kiosk / Kodi, controlled from the phone)
- Mode selector controllable from the phone
- Personal AI assistant integrated into the syste
