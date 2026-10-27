# Packages

Explicitly installed packages (`pacman -Qqe`), grouped by purpose.
Columns: what the package does, and where it is used on this system.

To check that this list is still complete:

```
comm -13 <(grep -o '^| `[^`]*`' packages.md | tr -d '|` ' | sort) <(pacman -Qqe | sort)
```

## Desktop (Hyprland setup)

| Package | What it does | Where it is used |
|---|---|---|
| `hyprland` | Dynamic tiling Wayland compositor | The whole desktop, config in `dotfiles/hypr/hyprland.conf` |
| `waybar` | Customizable status bar | Top bar, config in `dotfiles/waybar/` |
| `rofi` | Application launcher and dmenu replacement | `SUPER+Space`, `SUPER+Tab` and `scripts/wifi-menu.sh` |
| `nwg-dock-hyprland` | GTK dock for Hyprland | Bottom dock, started with `exec-once` |
| `wlogout` | Logout / power menu | Power button on the waybar |
| `hyprshot` | Screenshot helper | `SUPER+Delete` binds (region, window, output) |
| `grim` | Wayland screenshot tool | Backend used by `hyprshot` |
| `slurp` | Region selector for Wayland | Backend used by `hyprshot` to pick a region |
| `hyprpicker` | Color picker for Wayland | Picking colors from the screen |
| `wl-clipboard` | Command line copy/paste for Wayland | Clipboard from the terminal and scripts |
| `wev` | Shows Wayland input events | Finding key names (e.g. `XF86` keys) for binds |
| `xdg-desktop-portal-hyprland` | Portal backend for Hyprland | Screen sharing and file pickers |
| `kdeconnect` | Connects the desktop with the phone | Phone remote input and notifications |
| `hypr-kdeconnect-fix-git` | RemoteDesktop portal bridge for KDE Connect | Makes phone remote input work on Hyprland (`hypr-kdeconnect-portal` autostart) |
| `wezterm` | GPU-accelerated terminal and multiplexer | Main terminal |
| `alacritty` | GPU-accelerated terminal | Backup terminal (`$terminal` can point to it) |
| `brave-bin` | Browser that blocks ads and trackers | Main browser, entertainment mode kiosk |
| `firefox` | Web browser | Secondary browser |
| `pavucontrol` | PulseAudio volume control GUI | Audio module click on the waybar |
| `papirus-icon-theme` | Icon theme | Icons for the dock, rofi and GTK apps |
| `meld` | Compares files and directories | Diffing config files |

## Audio

| Package | What it does | Where it is used |
|---|---|---|
| `wireplumber` | Session manager for PipeWire (provides `wpctl`) | Volume keys in `hyprland.conf` |
| `pipewire-pulse` | PulseAudio replacement on top of PipeWire | Apps that expect PulseAudio |
| `pipewire-alsa` | ALSA configuration for PipeWire | ALSA apps output through PipeWire |
| `gst-plugin-pipewire` | GStreamer plugin for PipeWire | Media apps using GStreamer |
| `brightnessctl` | Brightness control tool | Brightness keys in `hyprland.conf` |
| `pamixer` | PulseAudio command line mixer | Scripts that change volume |
| `alsa-utils` | ALSA utilities (`alsamixer`, `amixer`) | Low level audio debugging |
| `alsa-plugins` | Additional ALSA plugins | Audio routing for ALSA apps |
| `alsa-firmware` | Firmware for some sound cards | Sound hardware support |
| `sof-firmware` | Sound Open Firmware | Laptop sound card firmware |

## Network and Bluetooth

| Package | What it does | Where it is used |
|---|---|---|
| `networkmanager` | Network connection manager (provides `nmcli`) | Wi-Fi and cable, used by `scripts/wifi-menu.sh` |
| `nm-connection-editor` | NetworkManager GUI editor | Right click on the network module, "Advanced settings" in the Wi-Fi menu |
| `networkmanager-openvpn` | OpenVPN plugin for NetworkManager | VPN connections |
| `iwd` | Internet Wireless Daemon | Wireless backend |
| `wpa_supplicant` | WPA key negotiation | Wireless authentication |
| `modemmanager` | Mobile broadband modem manager | Mobile data modems |
| `usb_modeswitch` | Switches USB devices from storage to modem mode | USB modems |
| `netctl` | Profile based network management | Installed with the CachyOS base, not used |
| `dnsmasq` | Lightweight DNS forwarder and DHCP server | Hotspot / shared connections in NetworkManager |
| `nss-mdns` | Host name resolution through mDNS | Finding `.local` devices on the network |
| `xl2tpd` | L2TP implementation | L2TP VPN support |
| `ethtool` | Controls network drivers and hardware | Debugging the cable connection |
| `inetutils` | Common network programs (`hostname`, `ping`) | Basic networking commands |
| `bind` | DNS tools (`dig`, `nslookup`) | Debugging DNS |
| `openssh` | SSH client and server | Remote login and `git` over SSH |
| `nfs-utils` | Network File System support | Mounting NFS shares |
| `ufw` | Simple firewall | Firewall rules |
| `ufw-extras` | Extra configuration for UFW | Application profiles for the firewall |
| `blueman` | Bluetooth manager GUI | Click on the bluetooth module of the waybar |
| `bluez` | Bluetooth protocol stack daemon | Bluetooth devices |
| `bluez-utils` | Bluetooth command line tools (`bluetoothctl`) | Pairing from the terminal |
| `bluez-libs` | Bluetooth libraries | Dependency of Bluetooth apps |
| `bluez-obex` | Object Exchange daemon | Sending files over Bluetooth |
| `bluez-hid2hci` | Switches HID proxy Bluetooth adapters | Some Bluetooth adapters |
| `wget` | Downloads files from the web | Scripts and manual downloads |

## NVIDIA and graphics

| Package | What it does | Where it is used |
|---|---|---|
| `nvidia-utils` | NVIDIA driver utilities | GTX 1650 driver |
| `lib32-nvidia-utils` | 32-bit NVIDIA utilities | Steam and Wine games |
| `linux-cachyos-nvidia-open` | Open NVIDIA kernel modules for `linux-cachyos` | GTX 1650 driver on the main kernel |
| `linux-cachyos-lts-nvidia-open` | Open NVIDIA kernel modules for the LTS kernel | GTX 1650 driver on the fallback kernel |
| `nvidia-settings` | NVIDIA configuration tool | Tuning the GPU |
| `nvidia-prime` | PRIME render offload tools | Running apps on the NVIDIA GPU |
| `switcheroo-control` | Service for dual-GPU laptops | GPU selection |
| `egl-wayland` | EGLStream Wayland platform | NVIDIA on Hyprland |
| `libva-nvidia-driver` | VA-API through NVDEC | Hardware video decoding in browsers |
| `opencl-nvidia` | OpenCL for NVIDIA | GPU compute |
| `lib32-opencl-nvidia` | 32-bit OpenCL for NVIDIA | GPU compute for 32-bit apps |
| `vulkan-icd-loader` | Vulkan loader | Gaming mode (gamescope, Steam) |
| `lib32-vulkan-icd-loader` | 32-bit Vulkan loader | Gaming mode, 32-bit games |
| `mesa-utils` | Mesa tools (`glxinfo`, `glxgears`) | Checking OpenGL |
| `chwd` | CachyOS hardware detection tool | Installing the right drivers |

## Kernel, boot and firmware

| Package | What it does | Where it is used |
|---|---|---|
| `linux-cachyos` | CachyOS optimized kernel | Main kernel |
| `linux-cachyos-headers` | Kernel headers | Building kernel modules (DKMS) |
| `linux-cachyos-lts` | CachyOS long term support kernel | Fallback kernel |
| `linux-cachyos-lts-headers` | Headers for the LTS kernel | Building modules for the LTS kernel |
| `linux-firmware` | Firmware files for hardware | Wi-Fi, GPU and other devices |
| `intel-ucode` | Intel CPU microcode updates | Loaded at boot |
| `limine` | Bootloader | Boot menu |
| `limine-mkinitcpio-hook` | Installs kernels for Limine | Updates boot entries after kernel updates |
| `limine-snapper-sync` | Adds Snapper snapshots to the Limine menu | Booting into a snapshot |
| `mkinitcpio` | Initramfs generator | Boot image creation |
| `efibootmgr` | Edits the EFI boot manager | Boot entries |
| `efitools` | UEFI Secure Boot tools | Secure Boot keys |
| `os-prober` | Detects other operating systems | Boot menu entries for other OSes |
| `plymouth` | Graphical boot splash | Boot animation |
| `cpupower` | CPU frequency and power tool | Power tuning |
| `power-profiles-daemon` | Power profiles over D-Bus | Switching performance / battery profiles |
| `upower` | Power device information | Battery module of the waybar |
| `realtime-privileges` | Realtime scheduling permissions | Low latency audio |

## CachyOS

| Package | What it does | Where it is used |
|---|---|---|
| `cachyos-settings` | CachyOS system tweaks | Sysctl and performance defaults |
| `cachyos-hooks` | CachyOS pacman hooks | Run automatically after package updates |
| `cachyos-keyring` | CachyOS signing keys | Verifies CachyOS packages |
| `cachyos-mirrorlist` | CachyOS repository mirrors | `pacman` |
| `cachyos-v3-mirrorlist` | Mirrors for the x86-64-v3 repository | `pacman` |
| `cachyos-v4-mirrorlist` | Mirrors for the x86-64-v4 repository | `pacman` |
| `cachyos-rate-mirrors` | Service that ranks mirrors | Keeps the mirrors fast |
| `cachyos-hello` | Welcome screen | First run after install |
| `cachyos-kernel-manager` | Kernel manager GUI | Installing / switching kernels |
| `cachyos-packageinstaller` | Package installer GUI | Installing apps from a GUI |
| `cachyos-snapper-support` | Snapper configuration for CachyOS | Btrfs snapshots |
| `cachyos-micro-settings` | Config for the `micro` editor | Terminal editor defaults |
| `cachyos-fish-config` | Fish shell configuration | Login shell (fish) |
| `cachyos-zsh-config` | Zsh shell configuration | Zsh sessions |
| `cachyos-drm-awaiter` | Waits for DRM modules at boot | Boot ordering for the GPU |
| `cachyos-plymouth-bootanimation` | CachyOS boot animation | Plymouth |
| `cachyos-plymouth-theme` | CachyOS Plymouth theme | Plymouth |
| `cachyos-wallpapers` | CachyOS wallpapers | Desktop backgrounds |
| `paru` | AUR helper | Installing AUR packages (`brave-bin`, `hyprshot`) |
| `shelly` | Package manager tool installed with CachyOS | Not used directly |

## Filesystems and storage

| Package | What it does | Where it is used |
|---|---|---|
| `btrfs-progs` | Btrfs utilities | Root filesystem |
| `btrfs-assistant` | Manages Btrfs subvolumes and snapshots | Restoring snapshots from a GUI |
| `snapper` | Btrfs snapshot manager | Automatic snapshots before updates |
| `e2fsprogs` | Ext2/3/4 utilities | Formatting and checking ext4 drives |
| `dosfstools` | FAT utilities | EFI partition and USB drives |
| `exfatprogs` | exFAT utilities | USB drives and SD cards |
| `xfsprogs` | XFS utilities | XFS drives |
| `jfsutils` | JFS utilities | JFS drives |
| `f2fs-tools` | F2FS utilities | Flash storage |
| `nilfs-utils` | NILFS2 utilities | NILFS2 drives |
| `mtools` | Access MS-DOS disks | Reading FAT images |
| `cryptsetup` | Disk encryption (dm-crypt) | Encrypted partitions |
| `lvm2` | Logical Volume Manager | LVM volumes |
| `device-mapper` | Device mapper library | Used by LVM and cryptsetup |
| `mdadm` | Software RAID management | RAID arrays |
| `dmraid` | Device mapper RAID interface | Firmware RAID |
| `fsarchiver` | File system backup tool | Backing up partitions |
| `hdparm` | Drive parameter tool | Tuning and testing drives |
| `smartmontools` | S.M.A.R.T. monitoring | Checking drive health |
| `sg3_utils` | Generic SCSI utilities | SCSI / SATA device commands |
| `lsscsi` | Lists SCSI devices | Identifying drives |
| `sysfsutils` | Tools based on sysfs | Reading device attributes |
| `duf` | Disk usage and free space viewer | Quick disk overview |
| `plocate` | Fast file search database | `locate` command |
| `pkgfile` | Searches files in repo packages | Finding which package owns a command |

## Command line tools

| Package | What it does | Where it is used |
|---|---|---|
| `git` | Version control | This repo |
| `micro` | Terminal text editor | Main terminal editor |
| `nano` | Simple terminal editor | Quick edits |
| `nano-syntax-highlighting` | Syntax colors for nano | Used with nano |
| `vim` | Vi improved editor | Quick edits |
| `btop` | System resource monitor | Checking CPU, RAM and GPU load |
| `glances` | Curses monitoring tool | System monitoring |
| `fastfetch` | System information display | Terminal greeting and screenshots |
| `ripgrep` | Fast text search (`rg`) | Searching the dotfiles |
| `rsync` | File copy and sync | Backups and transfers |
| `sudo` | Run commands as root | Administration |
| `less` | Text pager | Reading long output |
| `which` | Shows the path of commands | Shell scripts |
| `man-db` | Reads man pages | `man` command |
| `man-pages` | Linux man pages | `man` command |
| `texinfo` | GNU info documentation | `info` command |
| `diffutils` | `diff` and `patch` | Comparing files |
| `pv` | Shows progress through a pipe | Copy / backup pipelines |
| `unzip` | Extracts .zip files | Archives |
| `unrar` | Extracts .rar files | Archives |
| `s-nail` | Command line mail client | System mail from cron / scripts |
| `logrotate` | Rotates log files | Keeps logs small |
| `lsb-release` | Distribution version query | Scripts that detect the distro |
| `bash-completion` | Tab completion for bash | Bash sessions |
| `dmidecode` | Reads hardware tables (DMI) | Hardware info |
| `hwinfo` | Hardware detection tool | Hardware info |
| `hwdetect` | Hardware detection for mkinitcpio | Initramfs setup |
| `usbutils` | USB tools (`lsusb`) | Listing USB devices |
| `xdg-user-dirs` | Manages `~/Downloads`, `~/Music`, etc. | Default user folders |
| `accountsservice` | D-Bus user account service | Login and user settings |
| `pacman-contrib` | Extra pacman tools (`paccache`, `checkupdates`) | Cleaning the package cache |
| `rebuild-detector` | Detects packages that need a rebuild | Checking AUR packages after updates |
| `reflector` | Updates the pacman mirror list | Fast mirrors |
| `base` | Minimal Arch Linux package set | System base |
| `base-devel` | Tools to build packages | Building AUR packages with `paru` |
| `perl` | Perl language | Dependency of many system tools |
| `python` | Python language | Scripts and many tools |
| `python-defusedxml` | XML attack protection for Python | Dependency of Python tools |
| `python-packaging` | Python packaging utilities | Dependency of Python tools |

## Fonts

| Package | What it does | Where it is used |
|---|---|---|
| `ttf-meslo-nerd` | Meslo font patched with Nerd Font icons | Terminal font |
| `ttf-nerd-fonts-symbols` | Extra icon glyphs | Waybar icons (wifi, battery, bluetooth) |
| `woff2-font-awesome` | Font Awesome icons | Waybar icons |
| `awesome-terminal-fonts` | Icons for powerline prompts | Terminal prompt |
| `noto-fonts` | Google Noto fonts | Default text font |
| `noto-fonts-cjk` | Noto fonts for Chinese, Japanese, Korean | Web pages in those languages |
| `noto-fonts-emoji` | Color emoji font | Emoji in apps |
| `cantarell-fonts` | Humanist sans serif font | GNOME / GTK apps |
| `ttf-dejavu` | DejaVu font family | Fallback font |
| `ttf-liberation` | Fonts compatible with Arial and Times | Web pages and documents |
| `ttf-opensans` | Open Sans font | Web pages and apps |
| `ttf-bitstream-vera` | Bitstream Vera fonts | Fallback font |

## Media

| Package | What it does | Where it is used |
|---|---|---|
| `vlc-plugins-all` | All VLC plugins | Playing video and audio |
| `gst-libav` | GStreamer libav plugin | Video codecs in GStreamer apps |
| `gst-plugins-bad` | GStreamer extra plugins | Extra codecs |
| `gst-plugins-ugly` | GStreamer plugins with licensing limits | Extra codecs (MP3, DVD) |
| `libdvdcss` | DVD decryption | Playing DVDs |
| `ffmpegthumbnailer` | Video thumbnails | File manager previews |
| `libgsf` | Structured file I/O library | Thumbnails for office files |
| `libopenraw` | RAW photo decoding | Thumbnails for camera photos |
| `poppler-glib` | PDF rendering library | PDF previews |
