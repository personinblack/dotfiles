# vim:fileencoding=utf-8:foldmethod=marker:softtabstop=2:shiftwidth=2
#
#          xinit Configuration File
#
# Author: personinblack
# GitHub: https://github.com/personinblack/dotfiles
#

#!/bin/sh

#       "' DIRECTORIES'" {{{


sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# }}}

#       "' XRANDR DISPLAY STUFF '" {{{


xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# }}}

#       "' XRESOURCE AND KEYMAP CONFIGS '" {{{


if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

# }}}

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec dwm
