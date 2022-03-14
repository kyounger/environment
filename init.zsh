#
# Generic options and environment settings
#
## Use `man zshoptions` for reference

#
# Changing directories
#

# Perform cd to a directory if the typed command is invalid, but is a directory.
setopt AUTO_CD

# Make cd push the old directory to the directory stack.
setopt AUTO_PUSHD

autoload -Uz is-at-least && if is-at-least 5.8; then
  # Don't print the working directory after a cd.
  setopt CD_SILENT
fi

# Don't push multiple copies of the same directory to the stack.
setopt PUSHD_IGNORE_DUPS

# Don't print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Have pushd without arguments act like `pushd ${HOME}`.
setopt PUSHD_TO_HOME

# Change directory to a path stored in a variable.
setopt CDABLE_VARS

#
# Expansion and globbing
#

# Treat `#`, `~`, and `^` as patterns for filename globbing.
setopt EXTENDED_GLOB

# I like to see my dots
setopt GLOB_DOTS

# Make globbing (filename generation) sensitive to case.
unsetopt CASE_GLOB

#
# History
#

# The maximum number of events stored internally and saved in the history file.
HISTFILE=${ZDOTDIR:-${HOME}}/.zhistory
HISTSIZE=290000
SAVEHIST=290000

# The file to save the history in.
if (( ! ${+HISTFILE} )) typeset -g HISTFILE=${ZDOTDIR:-${HOME}}/.zhistory

# Don't display duplicates when searching the history.
setopt HIST_FIND_NO_DUPS

# Remove commands from the history that begin with a space.
setopt HIST_IGNORE_SPACE

# Don't execute the command directly upon history expansion.
setopt HIST_VERIFY

# Cause all terminals to share the same history 'session'.
setopt SHARE_HISTORY

# Perform textual history expansion, csh-style, treating the character `!' specially.
setopt BANG_HIST

# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY

#
# Input/output
#

# Allow comments starting with `#` in the interactive shell.
setopt INTERACTIVE_COMMENTS

# Disallow `>` to overwrite existing files. Use `>|` or `>!` instead.
setopt NO_CLOBBER

# Do not exit on end-of-file.  Require the use of exit or logout instead.
setopt IGNORE_EOF

# Try to correct the spelling of commands.
setopt CORRECT

# Disable start/stop characters in shell editor.
unsetopt FLOW_CONTROL

#
# Job control
#

# List jobs in verbose format by default.
setopt LONG_LIST_JOBS

# Prevent background jobs being given a lower priority.
setopt NO_BG_NICE

# Prevent status report of jobs on shell exit.
setopt NO_CHECK_JOBS

# Prevent SIGHUP to jobs on shell exit.
setopt NO_HUP

#
# Scripts and Functions
#

# Write to multiple descriptors.
setopt MULTIOS


#
# My completion preferences
#

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
