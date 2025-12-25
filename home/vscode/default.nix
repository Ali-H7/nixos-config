{
  pkgs,
  lib,
  ...
}:

{

  home.packages = with pkgs; [
    nixfmt-rfc-style # Formatter for Nix code
  ];

  programs.vscode = {
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide # Nix IDE
      asvetliakov.vscode-neovim # VSCode Neovim
      a5huynh.vscode-ron # (RON) syntax
    ];
  };
}
