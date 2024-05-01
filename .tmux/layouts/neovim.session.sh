# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$HOME/.config/nvim/lua/user/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "neovim"; then

  # Create a new window inline within session layout definition.
  new_window "neovim"

  # Create a new window inline within session layout definition.
  new_window "bash"
  run_cmd "cd $HOME && clear"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
