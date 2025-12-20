{
  pkgs,
  lib,
  ...
}:

{
  # Basic configuration of git
  programs.git = {
    settings = {
      user = {
        email = "172230399+Ali-H7@users.noreply.github.com";
        name = "Ali-H7";
      };
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
