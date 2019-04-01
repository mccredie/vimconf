
# Vim Config

This is a dotfiles *like* package but it only contains my vim config.  Feel
free to use it. Note that this has only been tested on my macbook, and I'm
currently using vim 8.0 (though this same setup was working with vim 7.3.x).

# Prerequisites

This doesn't brew install anything, because ideally it doesn't assume a mac.

You will need to do the following (on a mac) before running setup.

1. ensure xcode is installed and run `xcode-select --install`
2. make sure that headers are installed (this is a new mojave thing): `sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /`
3. Install the following with brew
```
brew install tmux
brew install reattach-to-user-namespace
brew install cmake
brew install pipenv or pip install pipenv
```
4. Install some nice fonts for powerline / airline (This can be done after)

# Setup

Just clone this repo and then run `vimconf/setup.sh`. This will create symbolic
links for the `.vimrc` file and a couple of modules that go into the `.vim`
folder. It will then run a vim command to install additional packages, and then
it will attempt to acutally build the YouCompleteMe package.

The last step is the most likely to fail, since it depends on having a compiler
and associated files installed. You may also choose to re-build it with
additional options like auto-complete for C based on Clang.

If you are using it, and run into problems or have a better way of doing
something feel free to send me a pull request or submit an issue.

# Note on how vim is configured

Currently I'm mostly doing Javascript / es6 programming with node.

**Important**: I have disabled `<Esc>` instead you must type `kj` quickly to
escape insert or visual mode.  This is quicker in my experience, and has the
added benefit of being more usable across different keyboard layouts.

YouCompleteMe code completion.  For javascript this uses tern. You will want to
install tern for your project.  If vim is opened from a directory with
`node_modules` it should be able to find `tern`.  You will also need to setup
your tern project via `.tern-project`.

Mine looks like this:


```json
{
    "plugins": {
        "node": {},
        "es_modules": {}
    },
    "libs": [
        "ecma5",
        "ecma6"
    ],
    "ecmaVersion": 6
}
```

Syntastic does syntax checking, but will only work if you have configured it
for your language.  For javascript this means that you will need eslint
installed and the associated config in your project.

For more information it is probably best to just look at the modules referenced
in `vimrc` and the comments in that file.

# Also nice to do for a new laptop

- Setup git
  - git config --global user.name "Your Name"
  - git config --global user.email "your.email@example.com"
- Generate a new ssh key: ssh-keygen -t rsa -C "your.email@example.com"
  - upload public part to github etc.

If you are using python

- pyenv
- pipenv


# Bash Profile snapshot
```
export LANG="en_US.UTF-8"
export CLICOLOR=1

# Enables bash completion. See 'brew info bash-completion' for details.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export PATH=/usr/local/opt/mysql-client/bin:$PATH

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
```
