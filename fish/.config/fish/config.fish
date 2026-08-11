# Bitwarden SSH Agent (Flatpak)
if test -S "$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
    set -gx SSH_AUTH_SOCK "$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish --cmd cd | source

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

if status is-interactive
    and not set -q TMUX
    exec tmux
end


# Added by Antigravity CLI installer
set -gx PATH "/home/finngaughan/.local/bin" $PATH
