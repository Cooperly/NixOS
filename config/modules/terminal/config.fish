function fish_prompt
    set -l protopurple '#d8c2f2'
    set -l protolavender '#a893cf'
    set -l protodark '#1d1a20'

    set_color $protodark --background $protopurple
    printf '  󰌽 %s' $USER

    printf '@%s  ' (hostname -s)

    set_color $protopurple --background $protolavender
    printf ''

    set_color $protodark --background $protolavender

    set -l cwd (prompt_pwd)

    set cwd (string replace -r '^~' '~' $PWD)

    set cwd (string replace -a '/home/void' '/󰉌' $cwd)

    set cwd (string replace -a '/mnt/ColdBoot' '/󰚝' $cwd)
    set cwd (string replace -a '/mnt/Ace' '/󰉐' $cwd)
    set cwd (string replace -a '/mnt/AceOS' '/󱧼' $cwd)
    set cwd (string replace -a '/mnt/WindWave' '/󱃪' $cwd)

    set cwd (string replace -a '/Git' '/' $cwd)
    set cwd (string replace -a '/Documents' '/󱧶' $cwd)
    set cwd (string replace -a '/Downloads' '/󰉍' $cwd)
    set cwd (string replace -a '/Music' '/󱍙' $cwd)
    set cwd (string replace -a '/Pictures' '/󰉏' $cwd)
    set cwd (string replace -a '/Videos' '/󱧺' $cwd)
    set cwd (string replace -a '/Desktop' '/󱞊' $cwd)

    printf ' %s ' $cwd
    printf ' '

    set_color $protolavender --background $protodark

    printf ''

    set_color normal
    printf '\n'
    printf '\n'

    set_color $protopurple

    printf ' ❯ '
    set_color normal
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
    cat ~/.cache/ags/user/generated/terminal/sequences.txt
end

alias pamcan=pacman

alias ls='ls --color=auto -l'
alias grep='grep --color=auto'
alias neofetch="fastfetch"

hyfetch

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

fish_add_path "$HOME/.nix-profile/bin"
