# Dotfiles

Simple, but extensive customization of ZSH, TMUX, and Vim.

[![VideoWalkthrough](https://img.youtube.com/vi/UgDz_9i2nwc/0.jpg)](https://www.youtube.com/watch?v=UgDz_9i2nwc)

## Setup Options

There are 3 ways in which you can use this, depending on how much you think you'll be customizing.

One of the key features is that this implementation stays in sync across all your machines.
So depending on how much you'd like to customize your configuration, you have a few options:

- Little Customization: Just clone this repo and jump to [Installation](#installation).
- Mild Customization: [Fork]() this repo, and clone your own fork. Keep an eye on this repo for bugfixes
  and other improvements that you'd like to incorporate into your fork. Then jump to [Installation](#installation).
- Most Customization: Building your own dotfiles from scratch! Read through these docs, watch the video above,
  star this repo, and create your own dotfiles!

## Installation

Once the repo is cloned at $HOME directory, execute the deploy script:

```shell
cd $HOME/dotfiles
chmod +x deploy
./deploy
```

This script guides you through the following:

- Checks to see if you have zsh, tmux, and vim installed.
- Installs them using your default package manager if you don't have some of them installed.
- Checks to see if your default shell is zsh.
- Sets zsh to your default shell.
- Backs up your old configuration files.
- Install another shit: guake, fd, sd, xh

Pretty convenient for configuring new servers.

## Import Jetbrains settings

Open your IDE, open Import settings dialog and choose the file from `$HOME/dotfiles/jetbrains` folder.

## **Summary of Changes**

## Basic runtime operations

All default dotfiles (`.zshrc`, `.vimrc`, etc) source something within the dotfiles repository.
This helps separate changes that are synced across all your machines with system-specific changes.

Upon launching a new shell, the first thing that's evaluated is `zshrc_manager.sh`.
This script first launches tmux. Then once zsh logs in, within tmux, it updates the dotfiles repository,
and sources the changes.

## [Zsh](https://en.wikipedia.org/wiki/Z_shell)

- `cd` has been reassigned to `cd` and `ls`. Every time you navigate to a new directory, 
       it will display the content of that directory.
- `v` has been aliased too: `vim -p`. This lets you open multiple files in vim as tabs.

### Prompt

The prompt takes on the form:

```shell
[plugin, plugin, ...]:
```

Each plugin is sensitive to where you are and what you're doing, they reveal themselves when it's contextually relevant.
Plugins include:

- `PWD plugin`: always present, tells you where you are. Always the first plugin.
- `Status code plugin`: appears anytime a program returns with a non-zero status code.
   Tells you what status code the program completed with.
- `Git plugin`: appears when you're in a git repository. Tells you what branch you're on,
   and how many files have been changed since the last commit.
- `Sudo plugin`: tells you when you can sudo without a password. Or when you're logged in as root.
- `Time plugin`: appears when a program took more than 1s to execute. Tells you how long it took to execute.
- `PID plugin`: appears when you background a task. Tells you what the PID of the task is.

### Keybindings

| Key Stroke | What It Does                                                                |
|------------|-----------------------------------------------------------------------------|
| Ctrl-H     | Goes to the root of a git project, runs `cd $(git rev-parse --show-toplevel || echo ".")` |
| Ctrl-K     | Runs `cd ..`                                                                |
| Ctrl-G     | Runs `git add -A; git commit -v && git push`                                |
| Ctrl-V     | Runs `fc`. Takes last command and puts it in a vim buffer.                  |
| Ctrl-S     | Adds `sudo` to the beginning of the buffer.                                 |
| Ctrl-L     | Runs `ls`.                                                                  |
| Ctrl-O     | Equivalent to hitting `Enter`.                                              |
| Ctrl-P     | Equivalent to pressing `Up Arrow`.                                          |
| `+Esc      | Run vim mode                                                                |
| Esc        | Run vim mode for currently typing command                                   |

### Plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Searches your history while you type and provides suggestions.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/ad522a091429ba180c930f84b2a023b40de4dbcc): Provides fish style syntax highlighting for zsh.
- [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3): Borrowed things like tab completion, fixing ls, tmux's vi-mode plugin.
- [vimode-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vi-mode) allows you to hit `esc` and navigate the current buffer using vim movement keys.

## [Vim](<https://en.wikipedia.org/wiki/Vim_(text_editor)>)

- Leader key has been remapped to `,`

## [Tmux](https://en.wikipedia.org/wiki/Tmux)

- Use `prefix + Ctrl + s` to save current layout (tmux-resurrect), and `prefix + Ctrl + r` to restore.
  Auto save interval is set to 10m by default and could be changed at tmux.conf.local
- Ctrl-B has been remapped to the backtick character (&#96;). If you want to type the actual backtick character (&#96;)
  itself, just hit the key twice.
- `%` has been remapped to `v`.
- Use vim movement keys for moving between panes.
- Copy buffer is copied to xclip.
- Status bar tells you date, time, user, and hostname. Especially useful with nested ssh sessions.

Colorful shit at the bottom and another settings are from here: https://github.com/gpakosz/.tmux

## Guake

- F1 - opens guake
- Alt+c - copy
- Alt+v - paste
- Alt+t - new tab
- Alt+LeftKey/Alt+h - prev tab
- Alt+RightKey/Alt+l - next tab
- Ctrl+DownKey - increase terminal height
- Ctrl+UpKey - decrease terminal height

To update guake.dconf file with your own adjustments run:

```
dconf dump /apps/guake/ > $HOME/dotfiles/guake.dconf
```

## fd - better find

https://github.com/sharkdp/fd

- `fd --type f` - only files
- `fd -e md --exec wc -l` - md extension and exec `wc -l` for each
- `fd '^[A-Z]' /` - find by regex related the root folder
- `fd -e jpg -x convert {} {.}.png` - convert all *.jpg files to *.png files

Remember that fd ignores hidden directories and files by default.
It also ignores patterns from .gitignore files. If you want to make sure to find absolutely every
possible file, always use the options -u/--unrestricted option (or -HI to enable hidden and ignored files):

> fd -u …

## sd - better sed

https://github.com/chmln/sd

- `sd docker k8s run.sh` - replace and save
- `cat run.sh | sd docker k8s`

## xh - better curl

https://github.com/ducaale/xh

- `xh ipinfo.io/geo` - simple request
- `xh --download httpbin.org/file.zip` - wget replacement
- `xh put httpbin.org/put x-api-key:kkkk id:=2 age:=24` - custom headers and data:

```
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 537
Content-Type: application/json
Date: Sat, 07 Dec 2024 14:14:20 GMT
Server: gunicorn/19.9.0

{
    "args": {},
    "data": "{\"id\":2,\"age\":24}",
    "files": {},
    "form": {},
    "headers": {
        "Accept": "application/json, */*;q=0.5",
        "Accept-Encoding": "gzip, deflate, br, zstd",
        "Content-Length": "17",
        "Content-Type": "application/json",
        "Host": "httpbin.org",
        "User-Agent": "xh/0.23.0",
        "X-Amzn-Trace-Id": "Root=1-6754583b-1f04b6b00c0032e818eba3a4",
        "X-Api-Key": "kkkk"
    },
    "json": {
        "age": 24,
        "id": 2
    },
    "origin": "88.119.169.156",
    "url": "http://httpbin.org/put"
}
```
