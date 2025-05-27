force_color_prompt=yes

HISTSIZE=800000
HISTFILESIZE=800000

cat ~/dotfiles/banner

export GO111MODULE=on
export GOROOT="/usr/local/go"
export GOPATH=$HOME/go export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/usr/local/sbin
export GOBIN=$HOME/go/bin
export EDITOR=vim

alias android="~/Downloads/android-studio/bin/studio &"
alias goland="~/Downloads/goland/bin/goland &"
alias rover="~/Downloads/RustRover/bin/rustrover &"
alias phpstorm="~/Downloads/phpstorm/bin/phpstorm &"
alias pycharm="~/Downloads/pycharm/bin/pycharm &"
alias subl='~/sublime/sublime_text'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias hs='history 0 | grep -i $1'
alias psg='ps aux | grep -i $1'
alias bs='vim ~/.bashrc'
alias bss='vim ~/dotfiles/zsh/takoe.sh'
alias hosts="sudo vim /etc/hosts"
alias sss="source ~/dotfiles/zsh/zshrc_manager.sh && source ~/.bashrc"
alias tailf='tail -f $1'
alias nlp="netstat -nl | grep $1"
alias geo='curl https://ipinfo.io/geo'
alias sshad='ssh-add ~/.ssh/id_rsa'
alias grep='grep --color=always -i'

alias zzz='sh ~/dotfiles/zsh/zshrc_manager.sh'
alias dark='xrandr --output eDP-1 --brightness $1'
alias shit='dark 0.8';

alias k='kubectl'
alias d='docker'
alias com='docker-compose'

alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gu='git pull origin master'
alias gh='git push origin master'
alias ga='git add .'
alias gl='git log --pretty=oneline'
alias gcp='git cherry-pick'
alias pushall='git add . && git commit -am xxx && git push origin master'

