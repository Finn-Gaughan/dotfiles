#using a single flake file manually instead of home manager is much better, figure out how to do it.
#then you can simply run:
#nix profile install . # in the /dotfiles/ directory
#then:
#stow # in the dotfiles directory (potentially with a period "stow .")

#and BAM!, you have all your programs and dotfiles on a new machine with everything configured.
#
#AI SLOP:
{
  description = "Standalone Nix Profile Dotfiles Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin"; # Change to "aarch64-darwin" for M-series Macs, etc.
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.symlinkJoin {
        name = "my-profile-packages";
        paths = with pkgs; [
          # Add all the CLI tools and apps you want installed here
          neovim
          tmux
          alacritty
          git
          ripgrep
          fzf
          stow
          starship
          zoxide
          utm
          uv
          btop
          genact
          cmatrix
          trash
          ffmpeg
          fastfetch
          anki
          # google-chrome
        ];
      };
    };
}
