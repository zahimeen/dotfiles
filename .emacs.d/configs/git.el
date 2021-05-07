(use-package git-gutter
    :config
    (custom-set-variables
        '(git-gutter:window-width 2)
        '(git-gutter:modified-sign "▎")
        '(git-gutter:added-sign "▎")
        '(git-gutter:deleted-sign "契"))

    (set-face-foreground 'git-gutter:modified "DeepSkyBlue")
    (set-face-foreground 'git-gutter:added "LightGreen")
    (set-face-foreground 'git-gutter:deleted "red")

    (add-to-list 'git-gutter:update-hooks 'focus-in-hook)

    (custom-set-variables
      '(git-gutter:update-interval 2)))

(global-git-gutter-mode)
