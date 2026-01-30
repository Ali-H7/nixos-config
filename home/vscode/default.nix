{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  marketplace = inputs.vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;
  isEnabled = config.programs.vscode.enable;
in
{
  config = lib.mkIf isEnabled {
    home.packages = with pkgs; [
      nixfmt
    ];

    programs.vscode = {
      profiles.default = {
        extensions = with marketplace; [
          jnoortheen.nix-ide # Nix IDE
          asvetliakov.vscode-neovim # VSCode Neovim
          a5huynh.vscode-ron # (RON) syntax
          monokai.theme-monokai-pro-vscode # Monokai Pro
        ];
        
     };
    };
  };
}
