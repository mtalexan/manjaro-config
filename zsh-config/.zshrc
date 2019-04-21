# The following lines were added by compinstall

# set that was way too slow
#zstyle ':completion:*' completer _list _expand _complete _ignored _match
#zstyle ':completion:*' completions 1
#zstyle ':completion:*' glob 1
#zstyle ':completion:*' insert-unambiguous true
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' max-errors 1
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' preserve-prefix '//[^/]##/'
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' substitute 1
#zstyle ':completion:*' use-compctl true
#zstyle :compinstall filename '/home/aaravchen/.zshrc'

# subset to keep
zstyle ':completion:*' completer _list _expand _complete _ignored _match
zstyle ':completion:*' completions 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-cache yes

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory extendedglob nomatch notify
unsetopt autocd
# End of lines configured by zsh-newuser-install

source /usr/share/zsh/share/antigen.zsh 

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
antigen bundle gitfast
antigen bundle pip
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle emacs
antigen bundle git-extras
antigen bundle gpg-agent
antigen bundle ripgrep
antigen bundle urltools
antigen bundle zsh-navigation-tools

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=true
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle djui/alias-tips
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle joel-porquet/zsh-dircolors-solarized.git

source ~/manjaro-config/zsh-config/powerlevel10k.config
# hide 'context' segment when username matches this
DEFAULT_USER=aaravchen

antigen theme romkatv/powerlevel10k
#antigen theme robbyrussell

# must be last
antigen apply

# Must be after antigen apply to override
# oh-my-zsh bindings

# Last so it overrides any other key settings
source ~/manjaro-config/zsh-config/keys.config
