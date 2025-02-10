# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/tomenos/.asdf/installs/dotnet

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export LIBGL_ALWAYS_INDIRECT=1
# export DOTNET_ROOT=/home/tomenos/.asdf/installs/dotnet
# export MSBuildSDKsPath=${DOTNET_ROOT}/8.0.203/sdk/8.0.203/

alias ls="eza --icons"
alias lsa="eza -la --icons"
alias bat="bat --style=auto"
alias code="code-insiders"
alias k="kubectl"


source /opt/asdf-vm/asdf.sh

# opam configuration
[[ ! -r /home/tomenos/.opam/opam-init/init.zsh ]] || source /home/tomenos/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

##### WIDGETS
# TESTE
select-all() {
  if [[ $CURSOR == 0 ]]; then
    # If at the beginning of the line, select to the end
    zle set-mark-command
    zle end-of-line -w
  else
    # If not at the beginning, select to the beginning
    zle set-mark-command
    zle beginning-of-line -w
  fi
}

shift-select::select-and-invoke() {
	if (( !REGION_ACTIVE )); then
		zle set-mark-command -w
		zle -K shift-select
	fi
	zle ${WIDGET#shift-select::} -w
}

# Register the widgets
zle -N select-all
zle -N shift-select::select-and-invoke

##### BINDINGS    widges
bindkey '\e[1;5C' emacs-forward-word  # ctrl
bindkey '\e[1;5D' emacs-backward-word # ctrl
bindkey '\e[1;7D' select-all
bindkey '\e[3~'   delete-char
bindkey '\e[2~'   quoted-insert
