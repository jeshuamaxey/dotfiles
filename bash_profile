# Load ~/.aliases, ~/.bash_prompt, ~/.bashrc, ~/.functions, ~/.osx NOT ~/.inputrc
for file in ~/.{aliases,bash_prompt,bashrc,functions,osx}; do
	[ -r "$file" ] && source "$file"
done
unset file

# silence warning that mac default shell is zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# configure git auto completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
   . `brew --prefix`/etc/bash_completion
fi

# Bash completion plugin
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# configure git auto complete to work with alias (must be run after loading bash completion plugin)
__git_complete g __git_main
