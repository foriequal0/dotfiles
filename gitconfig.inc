# vim: filetype=gitconfig

[core]
        editor = vim

[alias]
        graph = log --oneline --decorate --graph
        s = scratch

[remote]
        pushDefault = origin

[fetch]
        showForcedUpdats = true
        prune = true
        pruneTags = true
        all = true

[pull]
        ff = only
        rebase = true

[diff]
        algorithm = histogram
        renames = copies
        colorMoved = default
        mnemonicPrefix = true

[merge]
        conflictstyle = zdiff3

[rebase]
        autoSquash = true
        autoStash = true
        updateRefs = true

[rerere]
        enabled = true
        autoUpdate = true

[user]
        useConfigOnly = true
        name = SeongChan Lee

[gui]
        encoding = UTF-8

[init]
        defaultbranch = main
