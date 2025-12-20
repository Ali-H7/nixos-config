{ pkgs, config, ... }:

{
  # Configure XDG user directories, which define standard locations for user files (e.g., Desktop, Documents).
  xdg.userDirs = {
    enable = true;
    # Automatically create the user directories if they do not exist.
    createDirectories = true;
  };
}
