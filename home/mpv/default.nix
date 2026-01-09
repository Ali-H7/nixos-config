{
  pkgs,
  ...
}:

{
  programs.mpv = {
    config = {
      slang = "ara,ar,eng,en";
      alang = "ara,ar,eng,en";
      sub-font = "Rubik";
      sub-font-size = 48;
      save-position-on-quit = "yes";
    };
  };
}
