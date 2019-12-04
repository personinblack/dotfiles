# my personal dotfiles

here is me, managing my dotfiles and sharing them with random people
on the internet. these are what i use:

- *zsh* as shell with *oh-my-zsh* for better management (i install *oh-my-zsh* by saying
  `sudo stow oh-my-zsh -t /usr/share/oh-my-zsh`)
- *tmux* as terminal multiplexer
- *xinit* for starting an x session
- *dwm* as window manager
- *st* as terminal emulator
- *neovim* as text editor and IDE
- *aurafetch* for l33t looking screenshots

## installation

- install *stow* if you don't have it.
- clone this repository to your *home directory*.
- cd inside *~/dotfiles*.
- use `stow [foldername]` to install a config. this will symlink files to their respective locations.
