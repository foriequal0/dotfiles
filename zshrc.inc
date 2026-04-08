# vim: filetype=zsh

setopt EXTENDED_HISTORY HIST_IGNORE_ALL_DUPS HIST_LEX_WORDS HIST_REDUCE_BLANKS SHARE_HISTORY
HISTSIZE=100000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history

# command prefix then {up,down} to search history
for f in {up,down}-line-or-beginning-search; do
        autoload -U $f && zle -N $f
done
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

# loading at later stage would cost high startup time.
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
zstyle ':completion:*' menu select
# case-insensitive autocomplete
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

setopt COMPLETE_IN_WORD ALWAYS_TO_END

# Ctrl-X Ctrl-E to trigger edit commandline in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

if [ -d /usr/share/doc/fzf/examples ]; then
        source /usr/share/doc/fzf/examples/key-bindings.zsh
        source /usr/share/doc/fzf/examples/completion.zsh
        export FZF_DEFAULT_OPTS='--color bw'
fi

# Emacs-y word navigation
autoload -Uz select-word-style && select-word-style bash

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# coreutils timestamp (e.g. ls)
export TIME_STYLE=long-iso

## zinit 

# manual install
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# must be installed after `select-word-style bash`
# ISSUE: https://github.com/zdharma-continuum/fast-syntax-highlighting/issues/88
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions # common completion database

ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
zinit light trystan2k/zsh-tab-title

zinit light zdharma-continuum/zinit-annex-bin-gem-node # for zinit sbin
zinit light-mode from"gist.github.com" for \
        id-as"foriequal0/git-overrides" pick"git-overrides.zsh" "foriequal0/6c6ec70bf8f5ba5fd2fa13f34c880a6f" \
        id-as"foriequal0/git-sync" sbin reset "foriequal0/55763d9177803c325904d089299f0970" \
        id-as"foriequal0/git-fixup" sbin reset "foriequal0/7ac461fa7e47658af231238f4c21b52a" \
        id-as"foriequal0/git-scratch" sbin reset "foriequal0/2a3bb342b14dc8fa5ac042ae3e3c6784"

## end of zinit
