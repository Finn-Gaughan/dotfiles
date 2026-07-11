using a single flake file manually instead of home manager is much better, figure out how to do it.
then you can simply run:
nix profile install . # in the /dotfiles/ directory
then:
stow # in the dotfiles directory (potentially with a period "stow .")

and BAM!, you have all your programs and dotfiles on a new machine with everything configured.
