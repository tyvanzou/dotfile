# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# libgl
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

# ZSH_THEME=""

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

plugins=(git z zsh-syntax-highlighting zsh-autosuggestions autojump)

# path & init
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/icarus/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# CMAKE
export PATH="/home/icarus/.local/share/cmake/cmake3.26.0/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/icarus/.local/share/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/icarus/.local/share/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/icarus/.local/share/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/icarus/.local/share/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# neovim default
alias vi=/usr/bin/nvim

. "$HOME/.cargo/env"


# zsh init last
source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/mine.omp.json)"

# fdfind
alias fd=fdfind

# bat
alias bat="batcat"

# neovim-gtk
export PATH="/home/icarus/.local/share/neovim-gtk/bin:$PATH"

# translate-shell
alias tez="trans -shell en:zh"
alias tze="trans -shell zh:en"
