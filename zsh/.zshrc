# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=15000
SAVEHIST=15000
CASE_SENSITIVE="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=246"
ZSH_AUTOSUGGEST_USE_ASYNC="true"
setopt appendhistory nomatch notify

# Functions
# Loop a command and show the output in vim

# Set environment variables
source ~/.environment

loop() {
  echo ":cq to quit\n" > /tmp/log/output 
  fc -ln -1 > /tmp/log/program
  while true; do
    cat /tmp/log/program >> /tmp/log/output ;
    $(cat /tmp/log/program) |& tee -a /tmp/log/output ;
    echo '\n' >> /tmp/log/output
    vim + /tmp/log/output || break;
    rm -rf /tmp/log/output
  done;
}

case `uname` in
  Darwin)
		alias ls="ls -G"
  ;;
  Linux)
		alias ls="ls --color"
  ;;
esac

la() {
  ls -a "$@"
}

ll() {
  ls -l "$@"
}

lla() {
  ls -la "$@"
}

alias docker='sudo docker'

# Custom cd
chpwd() la

# For vim mappings: 
stty -ixon

autoload -Uz compinit
# End of lines added by compinstall

plugins=(
	docker
)

for plugin ($plugins); do
    fpath=(~/dotfiles/zsh/plugins/oh-my-zsh/plugins/$plugin $fpath)
done

compinit

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vimode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
source ~/dotfiles/zsh/ls.zsh

if [[ "$TERM" == "xterm" ]]; then
  export TERM=xterm-256color
elif [[ "$TERM" == "screen" ]]; then
  export TERM=screen-256color
fi

ZSH_HIGHLIGHT_STYLES[path]=none
