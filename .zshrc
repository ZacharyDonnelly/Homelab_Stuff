# Paths
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export DISPLAY=:1.0

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias c='clear'
alias e='exit'
alias vi='vim'
alias md='mkdir'
alias rd='rmdir'
alias df='df -h'
alias la='ls -AlF'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias wake1='~/bin/wakeonlan 00:11:32:C9:A1:13'
alias wake2='~/bin/wakeonlan 90:09:D0:35:E4:98'
alias heimdall='sudo docker run --name=heimdall -d -v /home/zach/docker/heimdall:/config -e PGID=1000>

setopt histignorealldups sharehistory

# Keep 5000 lines of history within the shell and cache to HISTFILE
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# zplug - manage plugins
source /usr/share/zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "clvv/fasd"
zplug "MichaelAquilina/zsh-you-should-use"

# Load theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Customizing zsh suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=204,bold"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
