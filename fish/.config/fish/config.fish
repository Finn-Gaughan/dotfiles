# Bitwarden SSH Agent (Cross-platform Linux & macOS)
if test -S "$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
    set -gx SSH_AUTH_SOCK "$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
else if test -S "$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
    set -gx SSH_AUTH_SOCK "$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
else if test -S "$HOME/Library/Group Containers/24322K3528.com.bitwarden.desktop/t/bitwarden-ssh-agent.sock"
    set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/24322K3528.com.bitwarden.desktop/t/bitwarden-ssh-agent.sock"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish --cmd cd | source

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"



# Added by Antigravity CLI installer
set -gx PATH "/home/finngaughan/.local/bin" $PATH
