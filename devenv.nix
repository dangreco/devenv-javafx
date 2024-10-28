{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [ 
    git
    just
  ];

  languages.java = {
    enable = true;
    jdk.package = pkgs.jdk21;
    maven.enable = true;
  };

  env = {
    LD_LIBRARY_PATH = "/nix/store/jkk691f3dhxsq6j0ap0djyilsa8mm6jq-libXtst-1.2.4/lib/";
  };

  devcontainer = {
    enable = true;
    settings = {
      customizations.vscode.extensions = [
        "mkhl.direnv"
        "jnoortheen.nix-ide"
        "vscjava.vscode-java-pack"
        "skellock.just"
      ];
    };
  };
}
