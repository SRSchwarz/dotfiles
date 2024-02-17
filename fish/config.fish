if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
abbr cf nvim ~/.config/fish/config.fish
abbr cn nvim ~/.config/nvim
abbr ck nvim ~/.config/kitty/kitty.conf
abbr ta "tmux new -As (pwd)"
abbr ls eza --all --icons
abbr gs git status
abbr gca "git add . && git commit -m"
abbr rg "rg --hyperlink-format=kitty"
