#!/bin/sh

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/history"

[ -z "$PATH_ORIG" ] && export PATH_ORIG="$PATH"
export PATH="$PATH_ORIG"

[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
[ -f "$HOME/.scripts/env" ] && . "$HOME/.scripts/env"

[ -x "$(command -v wezterm)" ] && export TERM="wezterm"

if [ -x "$(command -v nvim)" ]; then
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  export MOZ_ENABLE_WAYLAND=1
else
  unset MOZ_ENABLE_WAYLAND
fi
