# my personal dotfiles

here is me, managing my dotfiles and sharing them with random people
on the internet. these are what i use:

- *zsh* as shell with *oh-my-zsh* for better management (i install *oh-my-zsh* config
  by saying `sudo stow oh-my-zsh -t /usr/share/oh-my-zsh`)
- *tmux* as terminal multiplexer with tmux plugin manager (tpm)
- *xinit* for starting X sessions
- *dwm* as window manager
- *st* as terminal emulator
- *neovim* as text editor and IDE
- *aurafetch* for l33t looking screenshots
- *exa* as an ls replacement
- *thefuck* for when i fuck up
- *scrot* for screenshots
- *firefox* as web browser
- *discord* for chatting with friends

## installation

- install *stow* if you don't have it.
- clone this repository to your *home directory*.
- cd inside *~/dotfiles*.
- use `stow [foldername]` to install a config. this will symlink files to their respective locations.
