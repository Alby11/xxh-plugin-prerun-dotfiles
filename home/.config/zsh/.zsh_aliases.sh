# vim: filetype=zsh
#
# .zaliases.zsh - Set whatever shell aliases you want.
#

ECHOCAT '.zaliases.zsh - Set whatever shell aliases you want.'

alias -g _="sudo"

if command -v grep &>/dev/null
then
  alias grep='grep --color=auto '
  alias -g G=' | grep -i '
fi
# bat-extras
if command -v bat &>/dev/null
then
  alias -g B=' | bat'
  alias -g BF=' | bat --style=full'
  alias -g batf='bat --style=full'
  alias bathelp='bat --plain --language=help'
  alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
  alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
fi
if command -v batgrep &>/dev/null
then
  alias -g BG=' | batgrep --ignore-case --color '
  alias bgrep='batgrep --ignore-case --color '
fi
if command -v batman &>/dev/null
then
  alias bman='batman'
fi
if command -v batdiff &>/dev/null
then
  alias -g bdiff=' | batdiff '
fi
if command -v batwatch &>/dev/null
then
  alias bwatch='batwatch '
fi

alias C="clear"
alias EE='exit'
alias Sb="source ~/.bashrc"
alias Sba="source ~/.bash_aliases"
alias Sbe="source ~/.bash_exports"
alias Sz="source \$ZDOTDIR/.zshrc"
alias Sza="source \$ZDOTDIR/.zsh_aliases.sh"
alias Sze="source \$ZDOTDIR/.zsh_exports.sh"
alias chmod='sudo chmod '
alias chown='sudo chown '
alias dfh='sudo /bin/df -h'
alias freeh='sudo free -mh'
alias h="history -10" # last 10 history commands
alias hh="history -20" # last 10 history commands
alias hhh="history -30" # last 10 history commands
alias ssar="ss -ar"
alias mountc='mount | column --table --table-columns --json'
alias ping="/usr/bin/ping"
alias sping="/usr/bin/ping -c 5"

if command -v ss &>/dev/null; then
    alias ssa='sudo ss -poenta '
fi

if command -v notify-send &>/dev/null; then
  # Credits to: https://gist.github.com/Feniksovich
  # Add an "alert" alias for long running commands.  Use like so:
  #   sleep 10; alert
  alias -g alert='notify-send --urgency=low -i \
    "$([ $? = 0 ] && echo terminal || \
  echo error)" "$(history|tail -n1 | \
    sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' \
    ;
fi

if command -v systemctl &>/dev/null; then
    # Basic systemctl commands
    alias systemctl="sudo systemctl "
    alias systemctl="sudo systemctl "
    alias ctl="systemctl "
    alias sctl="/bin/systemctl"
    # Daemons reload
    alias ctldr="systemctl daemon-reload"
    # Credits to: https://gist.github.com/Feniksovich
    alias ctlsp="systemctl stop "
    alias ctlst="systemctl start "
    alias ctlrt="systemctl restart "
    alias ctlrl="systemctl reload "
    alias ctls="systemctl status "
    # Enable/Disable commands for units
    alias ctle='systemctl enable '
    alias ctld='systemctl disable '
    # Masking Units to disabling them
    alias ctlmask='systemctl mask '
    alias ctlunmask='systemctl unmask '
    # List failed units and reset systemd system status
    alias ctlfailed='systemctl --failed --all '
    alias ctlrf='systemctl reset-failed '
    # List units
    alias ctllu='systemctl list-units '
    alias ctllus='systemctl list-units --type=service'
fi

if command -v iptables &>/dev/null; then
    alias it='iptables '
    # Lookup iptables chain
    alias itlookup="iptables --line-numbers -nvL "
fi

if command -v journalctl &>/dev/null; then
    alias j="journalctl"
    alias jf="journalctl --follow"
    alias ju="journalctl --catalog --pager-end --unit"
    alias juf="journalctl --follow --catalog --unit"
    alias jfk="journalctl --follow --dmesg"
fi

if command -v apt &>/dev/null; then
    alias apt='sudo apt '
    alias apts='sudo apt search '
    alias aptp='sudo dpkg '
    alias aptf='sudo apt show '
    alias aptl='sudo apt list '
    alias aptlu='sudo apt list --upgradable'
    alias aptli='sudo apt list --installed'
    alias aptu='sudo apt update '
    alias aptup='sudo apt upgrade -y '
    alias aptdup='sudo apt dist-upgrade -y '
    alias apti='sudo apt install -y '
    alias aptr='sudo apt remove '
    alias aptar='sudo apt autoremove '
    alias aptap='sudo apt autopurge '
fi

if command -v dnf &>/dev/null; then
    alias dnf='sudo dnf '
    alias dnfs='sudo dnf search '
    alias dnfp='sudo dnf provides '
    alias dnff='sudo dnf info '
    alias dnfl='sudo dnf list '
    alias dnfli='sudo dnf list --installed '
    alias dnfq='sudo dnf repoquery '
    alias -g dnfcu='sudo dnf check-update '
    alias dnfup='sudo dnf upgrade -y '
    alias dnfds='sudo dnf distro-sync -y '
    alias dnfi='sudo dnf install -y '
    alias dnfr='sudo dnf remove '
    alias -g dnfar='sudo dnf autoremove '
    alias -g dnflar='sudo dnf list autoremove '
    alias dnfk='sudo dnf copr '
    alias dnfuua='sudo dnfcu ; dnfup ; dnfar'
fi


if command -v tmux &>/dev/null; then
    alias T='tmux '
    alias tls='tmux ls '
    alias ta='tmux attach -t '
    alias tn='tmux new -s '
    alias trs='tmux rename-session -t '
    alias tk='tmux kill-session -t '
fi

if CHECK_COMMANDS "zellij"; then
  alias Z='zellij'
fi

if command -v nvim &>/dev/null; then
    alias e='nvim '
    alias nv='nvim '
    alias vi='nvim '
    alias vim='nvim '
    alias E='| nvim '
    if command -v nvr &>/dev/null; then
        alias nvimr='nvim --listen /tmp/nvimsocket '
        alias nvrs='nvr -s '
    fi
fi

if command -v nvimpager &>/dev/null
then
  alias np='nvimpager'
  alias npc='nvimpager -c'
  alias npp='nvimpager -p'
  alias -g NP='| nvimpager -c -'
fi

if command -v xclip &>/dev/null; then
    alias -g Xp='xclip -o '
    alias -g Xy=' | xclip -i '
fi
if command -v clipboard &>/dev/null; then
    alias -g Cp="clipboard "
    alias -g Cy=' | clipboard '
fi
if command -v wl-copy &>/dev/null; then
    alias -g Wp="wl-paste "
    alias -g Wy=' | wl-copy '
fi

if command -v ranger &>/dev/null; then
    alias rw='ranger '
fi

if command -v fd &>/dev/null; then
    alias fdh='fd -H '
elif command -v fdfind &>/dev/null; then
    alias fd='fdfind '
    alias fdh='fdfind -H '
fi

if command -v eza &>/dev/null; then
  alias ola='/bin/ls -lahi --color=always '
  alias ols='/bin/ls --color=auto '
  alias ls="eza --icons --colour-scale --git --group-directories-first "
  alias ll="eza -lg --icons --colour-scale --git --group-directories-first "
  alias la="eza -aglm --icons --colour-scale --git --group-directories-first "
  alias lt="eza -L 2 --icons --colour-scale --tree --git-ignore --group-directories-first "
else
  alias la="/bin/ls -lAh --color=always"
fi

if command -v git &>/dev/null; then
    alias g='git '
    alias dot='dotfiles '
fi

if command -v kubectl &>/dev/null; then
    source <(kubectl completion zsh)
    alias k='kubectl '
fi

if command -v minikube &>/dev/null; then
    source <(minikube completion zsh)
    alias mk='minikube '
fi

if command -v docker &>/dev/null; then
    source <(docker completion zsh)
    alias dkc='docker container'
    alias dkci='docker container inspect'
    alias dkcls='docker container ls'
    alias dkcp='docker container update'
    alias dkcs='docker container stats'
    alias dkct='docker container top'
    alias dk='docker'
    alias dke='docker exec'
    alias dkeit='docker exec --interactive --tty'
    alias dkh='docker search'
    alias dki='docker image'
    alias dkii='docker image inspect'
    alias dkin='docker login'
    alias dkis='docker images'
    alias dkk='docker-compose'
    alias dkkc='docker-compose scale'
    alias dkkr='docker-compose run'
    alias dkkt='docker-compose top'
    alias dkl='docker logs'
    alias dkld='docker logs --details'
    alias dkldf='docker logs --details --follow'
    alias dklf='docker logs --follow'
    alias dkn='docker network'
    alias dkni='docker network inspect'
    alias dknls='docker network ls'
    alias dkout='docker logout'
    alias dkps='docker ps'
    alias dks='docker service'
    alias dksi='docker service inspect'
    alias dksl='docker service logs'
    alias dksls='docker service ls'
    alias dksp='docker service update'
    alias dksps='docker service ps'
    alias dkss='docker service scale'
    alias dkt='docker stack'
    alias dktc='docker stack config'
    alias dktls='docker stack ls'
    alias dktps='docker stack ps'
    alias dkts='docker stack services'
    alias dkx='docker context'
    alias dkv='docker volume'
    alias dkvi='docker volume inspect'
    alias dkvls='docker volume ls'
    alias dkxls='docker context ls'
    alias dkxp='docker context update'
    alias dkxs='docker context show'
    alias dkxu='docker context use'
    alias dky='docker inspect'
fi

if command -v ansible &>/dev/null; then
    alias an='ansible '
    alias ap='ansible-playbook '
    alias ag='ansible-galaxy '
fi

if command -v podman &>/dev/null; then
    source <(podman completion zsh)
    alias pd='podman '
fi

alias xway='env -u WAYLAND_DISPLAY '

if command -v curl &>/dev/null; then
    # Creditst to Jeremy "Jay" LaCroix
    # <https://www.learnlinux.tv/10-linux-terminal-tips-and-tricks-to-enhance-your-workflow/
    alias speedtest='curl -s \
      https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
      | python - \
      ;'
    # alias myip='curl http://ipecho.net/plain; echo '
    alias myip='curl icanhazip.com'
    # alias wimp='curl https://wttr.in/imperia'
    alias wimp='wth imperia'
fi

if [ "$(command -v fzf)" ] && [ "$(command -v rg)" ]; then 
  export FZF_BASE=$(which fzf)
  export FZF_DEFAULT_OPTS=" \
   --ansi \
   --extended \
   --border=rounded \
   --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
   --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
   --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
  export FZF_DEFAULT_COMMAND="rg --ignore-case --files --no-ignore-vcs --hidden "
  export DISABLE_FZF_AUTO_COMPLETION="false"
  export DISABLE_FZF_KEY_BINDINGS="false"
  alias -g F='| fzf'
  alias -g R='| rg '
  alias -g rf="rg . | fzf"
  alias -g rfl="rg . | fzf | cut -d ":" -f 1"
  alias -g rge='rg --regexp'
  if [ "$(command -v bat)" ]; then
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview=$(which bat)"
  else
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview=$(which less)"
    echo "bat missing..."
  fi
else
  echo "fzf&rg missing..."
fi

alias resetSound='/bin/systemctl --user restart pipewire.service'

### Python block
# url encode/decode
if command -v python &>/dev/null
then
  alias -g urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
  alias -g urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'
fi
### End of Python block
# PIP block 
if command -v pip &>/dev/null
then
  alias pipi='pip install '
  alias pipiu='pip install --user '
  alias pipu='pip uninstall '
  alias pipuu='pip uninstall --user '
fi
# end of PIP block
### git
alias gbfzf='fzf-git-branch'
alias gcofzf='fzf-git-checkout'
alias gS='git submodule'
### end of git block
### dot: git adaptation for dotfiles
alias 'dc!'='<EUGPSCoordinates>commit <EUGPSCoordinates>--verbose <EUGPSCoordinates>--amend' 
alias 'dca!'='<EUGPSCoordinates>commit <EUGPSCoordinates>--verbose <EUGPSCoordinates>--all <EUGPSCoordinates>--amend' 
alias 'dcan!'='<EUGPSCoordinates>commit <EUGPSCoordinates>--verbose <EUGPSCoordinates>--all <EUGPSCoordinates>--no-edit <EUGPSCoordinates>--amend' 
alias 'dcans!'='<EUGPSCoordinates>commit <EUGPSCoordinates>--verbose <EUGPSCoordinates>--all <EUGPSCoordinates>--signoff <EUGPSCoordinates>--no-edit <EUGPSCoordinates>--amend' 
alias 'dpf!'='dot push --force'
alias d='dot '
alias da='dot add'
alias daa='dot add --all'
alias dam='dot am'
alias dama='dot am --abort'
alias damc='dot am --continue'
alias dams='dot am --skip'
alias damscp='dot am --show-current-patch'
alias dap='dot apply'
alias dapa='dot add --patch'
alias dapt='dot apply --3way'
alias dau='dot add --update'
alias dav='dot add --verbose'
alias db='dot branch'
alias dbD='dot branch --delete --force'
alias dba='dot branch --all'
alias dbd='dot branch --delete'
alias dbda='dot branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs dot branch --delete 2>/dev/null'
alias dbfzf='fzf-dot-branch'
alias dbg='LANG=C dot branch -vv | grep ": gone\]"'
alias dbgD='LANG=C dot branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | xargs dot branch -D'
alias dbgd='LANG=C dot branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | xargs dot branch -d'
alias dbl='dot blame -b -w'
alias dbnm='dot branch --no-merged'
alias dbr='dot branch --remote'
alias dbs='dot bisect'
alias dbsb='dot bisect bad'
alias dbsg='dot bisect good'
alias dbsr='dot bisect reset'
alias dbss='dot bisect start'
alias dc='<EUGPSCoordinates>commit <EUGPSCoordinates>--verbose' 
alias dca='<EUGPSCoordinates>commit <EUGPSCoordinates>--verbose <EUGPSCoordinates>--all' 
alias dcam='<EUGPSCoordinates>commit <EUGPSCoordinates>--all <EUGPSCoordinates>--message' 
alias dcas='<EUGPSCoordinates>commit <EUGPSCoordinates>--all <EUGPSCoordinates>--signoff' 
alias dcasm='<EUGPSCoordinates>commit <EUGPSCoordinates>--all <EUGPSCoordinates>--signoff <EUGPSCoordinates>--message' 
alias dcb='<EUGPSCoordinates>checkout -b' 
alias dcd='<EUGPSCoordinates>checkout $(<EUGPS'
alias dcf='dot config --list'
alias dcl='dot clone --recurse-submodules'
alias dclean='dot clean --interactive -d'
alias dcm='dot checkout $(git_main_branch)'
alias dcmsg='dot commit --message'
alias dcn!='dot commit --verbose --no-edit --amend'
alias dco='dot checkout'
alias dcofzf='fzf-dot-checkout'
alias dcor='dot checkout --recurse-submodules'
alias dcount='dot shortlog --summary --numbered'
alias dcp='dot cherry-pick'
alias dcpa='dot cherry-pick --abort'
alias dcpc='dot cherry-pick --continue'
alias dcs='dot commit --gpg-sign'
alias dcsm='dot commit --signoff --message'
alias dcss='dot commit --gpg-sign --signoff'
alias dcssm='dot commit --gpg-sign --signoff --message'
alias ddf='dot -c color.ui=false diff'
alias ddfca='dot -c color.ui=false diff --cached'
alias ddct='dot describe --tags $(dot rev-list --tags --max-count=1)'
alias ddfcw='dot -c color.ui=false diff --cached --word-diff'
alias ddfs='dot -c color.ui=false diff --staged'
alias ddft='dot -c color.ui=false diff-tree --no-commit-id --name-only -r'
alias ddfup='dot -c color.ui=false diff @{upstream}'
alias ddfw='dot -c color.ui=false diff --word-diff'
alias dfe='<EUGPSCoordinates>fetch' 
alias dfa='<EUGPSCoordinates>fetch <EUGPSCoordinates>--all <EUGPSCoordinates>--prune <EUGPSCoordinates>--jobs=10' 
alias dfg='<EUGPSCoordinates>ls-files | grep' 
alias dfo='<EUGPSCoordinates>fetch origin' 
alias dg='<EUGPSCoordinates>gui citool' 
alias dga='<EUGPSCoordinates>gui citool <EUGPSCoordinates>--amend' 
alias dgpull='<EUGPSCoordinates>pull origin "$(<EUGPSCoordinates>_current_branch)"' 
alias dgpush='<EUGPSCoordinates>push origin "$(<EUGPSCoordinates>_current_branch)"' 
alias dgsup='<EUGPSCoordinates>branch <EUGPSCoordinates>--set-upstream-to=origin/$(<EUGPSCoordinates>_current_branch)' 
alias dhh='<EUGPSCoordinates>help' 
alias dhub='web_search github'
alias dignore='<EUGPSCoordinates>update-index <EUGPSCoordinates>--assume-unchanged' 
alias dignored='<EUGPSCoordinates>ls-files -v | grep "^[[:lower:]]"' 
alias dit-svn-dcommit-push='<EUGPSCoordinates>svn dcommit && <EUGPSCoordinates>push github $(<EUGPSCoordinates>_main_branch):svntrunk' 
alias dgk='\gitk --all --branches &!'
alias dke='\gitk --all $(dot log --walk-reflogs --pretty=%h) &!'
alias dl='dot pull'
alias dlg='dot log --stat'
alias dlgg='dot log --graph'
alias dlgga='dot log --graph --decorate --all'
alias dlgm='dot log --graph --max-count=10'
alias dlgp='dot log --stat --patch'
alias dlo='dot log --oneline --decorate'
alias dlod='dot log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias dlods='dot log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias dlog='dot log --oneline --decorate --graph'
alias dloga='dot log --oneline --decorate --graph --all'
alias dlol='dot log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias dlola='dot log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias dlols='dot log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias dlp=_git_log_prettily
alias dluc='dot pull upstream $(git_current_branch)'
alias dlum='dot pull upstream $(git_main_branch)'
alias dm='dot merge'
alias dma='dot merge --abort'
alias dmom='dot merge origin/$(git_main_branch)'
alias dms='dot merge --squash'
alias dmtl='dot mergetool --no-prompt'
alias dmtlvim='dot mergetool --no-prompt --tool=vimdiff'
alias dmum='dot merge upstream/$(git_main_branch)'
alias dp='dot push'
alias dpd='dot push --dry-run'
alias dpf='dot push --force-with-lease --force-if-includes'
alias dpoat='dot push origin --all && dot push origin --tags'
alias dpod='dot push origin --delete'
alias dpr='dot pull--rebase'
alias dpristine='dot reset--hard && dot clean--force-dfx'
alias dpsup='dot push --set-upstream origin $(git_current_branch)'
alias dpsupf='dot push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes'
alias dpu='dot push upstream'
alias dpv="dot push --verbose"
alias dr='dot remote'
alias dr='dot remote'
alias dra='dot remote add'
alias dra='dot remote add'
alias drb='dot rebase'
alias drb='dot rebase'
alias drba='dot rebase --abort'
alias drba='dot rebase --abort'
alias drbc='dot rebase --continue'
alias drbc='dot rebase --continue'
alias drbd='dot rebase $(git_develop_branch)'
alias drbd='dot rebase $(git_develop_branch)'
alias drbi='dot rebase --interactive'
alias drbi='dot rebase --interactive'
alias drbm='dot rebase $(git_main_branch)'
alias drbm='dot rebase $(git_main_branch)'
alias drbo='dot rebase --onto'
alias drbo='dot rebase --onto'
alias drbom='dot rebase origin/$(git_main_branch)'
alias drbom='dot rebase origin/$(git_main_branch)'
alias drbs='dot rebase --skip'
alias drbs='dot rebase --skip'
alias drev='dot revert'
alias drev='dot revert'
alias drh='dot reset'
alias drh='dot reset'
alias drhh='dot reset --hard'
alias drhh='dot reset --hard'
alias drm='dot rm'
alias drm='dot rm'
alias drmc='dot rm --cached'
alias drmc='dot rm --cached'
alias drmv='dot remote rename'
alias drmv='dot remote rename'
alias droh='dot reset origin/$(git_current_branch) --hard'
alias droh='dot reset origin/$(git_current_branch) --hard'
alias drrm='dot remote remove'
alias drrm='dot remote remove'
alias drs='dot restore'
alias drs='dot restore'
alias drset='dot remote set-url'
alias drset='dot remote set-url'
alias drss='dot restore --source'
alias drss='dot restore --source'
alias drst='dot restore --staged'
alias drst='dot restore --staged'
alias drt='cd "$(dot rev-parse --show-toplevel || echo .)"'
alias drt='cd "$(dot rev-parse --show-toplevel || echo .)"'
alias dru='dot reset --'
alias dru='dot reset --'
alias drup='dot remote update'
alias drup='dot remote update'
alias drup='dot remote update'
alias drv='dot remote --verbose'
alias drv='dot remote --verbose'
alias drv='dot remote --verbose'
alias dsb='dot status --short --branch'
alias dsb='dot status --short --branch'
alias dsd='dot svn dcommit'
alias dsd='dot svn dcommit'
alias dsh='dot show'
alias dsh='dot show'
alias dsi='dot submodule init'
alias dsi='dot submodule init'
alias dsps='dot show --pretty=short --show-signature'
alias dsps='dot show --pretty=short --show-signature'
alias dsr='dot svn rebase'
alias dss='dot status --short'
alias dst='dot status'
alias dsta='dot stash push'
alias dstaa='dot stash apply'
alias dstall='dot stash --all'
alias dstc='dot stash clear'
alias dstd='dot stash drop'
alias dstl='dot stash list'
alias dstp='dot stash pop'
alias dsts='dot stash show --text'
alias dsu='dot submodule update'
alias dsw='dot switch'
alias dswc='dot switch --create'
alias dswd='dot switch $(git_develop_branch)'
alias dswm='dot switch $(git_main_branch)'
alias dS='dot submodule'
alias dtl='dtl(){ dot tag --sort=-v:refname -n --list "${1}*" }; noglob dtl'
alias dts='dot tag --sign'
alias dtv='dot tag | sort -V'
alias dunignore='dot update-index --no-assume-unchanged'
alias dunwip='dot rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && dot reset HEAD~1'
alias dup='dot pull --rebase'
alias dupa='dot pull --rebase --autostash'
alias dupav='dot pull --rebase --autostash --verbose'
alias dupom='dot pull --rebase origin $(dot_main_branch)'
alias dupomi='dot pull --rebase=interactive origin $(dot_main_branch)'
alias dupv='dot pull --rebase --verbose'
alias dv='dot push --verbose'
alias dv='dot push --verbose'
alias dwch='dot whatchanged -p --abbrev-commit --pretty=medium'
alias dwip='dot add -A; dot rm $(dot ls-files --deleted) 2> /dev/null; dot commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias dwt='dot worktree'
alias dwta='dot worktree add'
alias dwtls='dot worktree list'
alias dwtmv='dot worktree move'
alias dwtrm='dot worktree remove'
### end of dot block

### Git block
# some git overrides
alias gd='git -c color.ui=false diff'
alias gd='git -c color.ui=false diff'
alias gdca='git -c color.ui=false diff --cached'
alias gdcw='git -c color.ui=false diff --cached --word--c color.ui=false diff'
alias gds='git -c color.ui=false diff --staged'
alias gdt='git -c color.ui=false diff-tree --no-commit-id --name-only -r'
alias gdup='git -c color.ui=false diff @{upstream}'
alias gdw='git -c color.ui=false diff --word--c color.ui=false diff'
alias gmtlvim='git mergetool --no-prompt --tool=nvim'
### end of Git block
