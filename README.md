# my personal dotfiles

here is me, managing my dotfiles and sharing them with random people
on the internet. these are what i use:

- *albert* as application launcher
- *compton* for shadows and transparency
- *dunst* as notification daemon
- *htop* and *glances* for system monitoring
- *i3-gaps* as window manager
- *mpd* as music player and *ncmpcpp* as a gui for it
- *neofetch* for l33t looking screenshots
- *polybar* as statusbar
- *thunar* as file manager
- *tilda* as dropdown terminal
- *alacritty* as terminal emulator
- *visual studio code* as text editor and for coding
- *xbindkeys* for keybindings
- *xinit* for starting a x session with *i3-gaps*
- *zsh* as shell with *oh-my-zsh* for better management (i install *oh-my-zsh* by saying `stow oh-my-zsh -t /usr/share/oh-my-zsh`)

## installation

- install *stow* if you don't have it.
- clone this repository to your *home directory*.
- cd inside *~/dotfiles*.
- use `stow [foldername]` to install a config. this will symlink files to their respective locations.
