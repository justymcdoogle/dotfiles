#
# ~/.zshrc
#

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================
export MANPAGER="nvim +Man!"
export LDLIBS=-lcs50

# ============================================================================
# ZSH OPTIONS
# ============================================================================
# Better completion
autoload -Uz compinit
compinit

# Spell correction
setopt correct

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups

# Fix key-bindings
bindkey "^[[H"    beginning-of-line      # Home
bindkey "^[[F"    end-of-line            # End
bindkey "^[[3~"   delete-char            # Delete
bindkey "^H"      backward-kill-word     # Ctrl+Backspace
bindkey "^[[1;5D" backward-word          # Ctrl+Left
bindkey "^[[1;5C" forward-word           # Ctrl+Right

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ============================================================================
# PROMPT
# ============================================================================
eval "$(starship init zsh)"

# ============================================================================
# ALIASES
# ============================================================================
# Load external aliases
source ~/.bash_aliases

# Basic commands with colors
alias ls='eza'
alias ll='eza -la'
alias cat='bat'
alias grep='grep --color=auto'

# System
alias sleepy='sleep 5 && systemctl suspend'

# Camera
alias cameraIR='ffplay /dev/video2'

# Monitor mode
alias monitor="sudo airmon-ng start wlp0s20f3"
alias monitorstop="sudo airmon-ng stop wlp0s20f3mon"
alias monitorstart="sudo airodump-ng wlp0s20f3mon"

# Ad-hoc networking
alias adhoc-start='sudo nmcli connection up adhoc-quick'
alias adhoc-stop='sudo nmcli connection down adhoc-quick'

# Wallpaper
alias wallrandom='~/.config/hypr/wallpaperscript/random.sh'

# ============================================================================
# STARTUP
# ============================================================================
if [[ -n "$SHOW_FASTFETCH" ]]; then
    fastfetch
    unset SHOW_FASTFETCH
fi

# ============================================================================
# FZF (fuzzy finder)
# ============================================================================
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ============================================================================
# Auto-start Hyprland on TTY1
# ============================================================================

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec hyprland
fi

# ============================================================================
# PLUGINS (must be at end)
# ============================================================================
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
