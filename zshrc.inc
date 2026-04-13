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
# for MSYS
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# loading at later stage would cost high startup time.
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
zstyle ':completion:*' menu select
# case-insensitive autocomplete
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

setopt COMPLETE_IN_WORD ALWAYS_TO_END

# CONFIG: mainly for MSYS, which is located at '/mingw64/share/fzf/'
FZF_SCRIPTS_ROOT=${FZF_SCRIPTS_ROOT:=/usr/share/doc/fzf/examples}
if [ -d "${FZF_SCRIPTS_ROOT}" ]; then
        source "${FZF_SCRIPTS_ROOT}"/key-bindings.zsh
        source "${FZF_SCRIPTS_ROOT}"/completion.zsh
        export FZF_DEFAULT_OPTS='--color bw'
fi

# Emacs-y word navigation
autoload -Uz select-word-style && select-word-style bash

# Ctrl-X Ctrl-E to trigger edit commandline in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

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

is-msys() {
	[ -n "$MSYS" -o -n "$MSYSTEM" ]
}

# must be installed after `select-word-style bash`
# ISSUE: https://github.com/zdharma-continuum/fast-syntax-highlighting/issues/88
is-msys && zinit ice wait lucid # saves 500ms on MSYS
zinit load zdharma-continuum/fast-syntax-highlighting

# NOTE: takes 3 seconds to load on MSYS.
is-msys || zinit light zsh-users/zsh-completions

ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
zinit load trystan2k/zsh-tab-title

zinit ice as"program" pick"*" reset
zinit light "foriequal0/git-utils"

## end of zinit

export PATH=$HOME/.local/bin:$PATH
