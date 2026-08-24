# Bitwarden SSH Agent (Cross-platform Linux & macOS)
set -l bw_sockets \
    "$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock" \
    "$HOME/.bitwarden-ssh-agent.sock" \
    "$HOME/.config/Bitwarden/ssh-agent.sock" \
    "$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock" \
    "$HOME/Library/Group Containers/24322K3528.com.bitwarden.desktop/t/bitwarden-ssh-agent.sock"

for sock in $bw_sockets
    if test -S "$sock"
        set -gx SSH_AUTH_SOCK "$sock"
        break
    end
end

if not set -q SSH_AUTH_SOCK
    if test -d "$HOME/.var/app/com.bitwarden.desktop"
        set -gx SSH_AUTH_SOCK "$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
    else if test (uname) = "Darwin"
        set -gx SSH_AUTH_SOCK "$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
    else
        set -gx SSH_AUTH_SOCK "$HOME/.bitwarden-ssh-agent.sock"
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish --cmd cd | source

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)" # what was this even for?

# Added by Antigravity CLI installer
set -gx PATH "/home/finngaughan/.local/bin" $PATH
