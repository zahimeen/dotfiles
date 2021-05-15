(use-package git-gutter
    :config
    (custom-set-variables
        '(git-gutter:window-width 1)
        '(git-gutter:modified-sign "▎")
        '(git-gutter:added-sign "▎")
        '(git-gutter:deleted-sign "契"))

    (custom-set-variables
      '(git-gutter:update-interval 1)))

(global-git-gutter-mode)
