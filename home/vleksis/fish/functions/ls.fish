function ls --description 'List files with eza (one line)'
    eza --oneline --icons --git --group-directories-first --hyperlink --color=auto $argv
end
