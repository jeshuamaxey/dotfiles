# Load ~/.aliases, ~/.bash_prompt, ~/.bashrc, ~/.exports, ~/.extra, ~/.functions, ~/.osx NOT ~/.inputrc
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{aliases,bash_prompt,bashrc,exports,extra,functions,osx}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# configure git auto completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# load nvm
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# update PATH for the Google Cloud SDK.
if [ -f '/Users/jeshuamaxey/code/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jeshuamaxey/code/google-cloud-sdk/path.bash.inc'; fi
# enable bash completion for gcloud.
if [ -f '/Users/jeshuamaxey/code/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jeshuamaxey/code/google-cloud-sdk/completion.bash.inc'; fi

# Bash completion plugin
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# configure git auto complete to work with alias (must be run after loading bash completion plugin)
__git_complete g __git_main

# load virtualenvwrapper for python (after custom PATHs)
venvwrap="virtualenvwrapper.sh"
/usr/bin/which -s $venvwrap
if [ $? -eq 0 ]; then
    venvwrap=`/usr/bin/which $venvwrap`
    source $venvwrap
fi

# configure pyenv - this manages python versions
eval "$(pyenv init -)"


export GOPATH=$HOME/go
