(use-package dashboard
    :ensure t
    :init
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-footer-icon (all-the-icons-fileicon "elisp"
                                                       :height 1.1
                                                       :v-adjust -0.05
                                                       :face 'all-the-icons-blue))
    (setq dashboard-startup-banner "~/.emacs.d/images/emacs-dash.png")
    (setq dashboard-center-content t)
    (setq dashboard-items '((recents . 5)
                            (agenda . 5)
                            (bookmarks . 3)))
                            ;; (projects . 3)
                            ;; (registers . 3)))
    :config
    (dashboard-setup-startup-hook))
    (dashboard-modify-heading-icons '((recents . "file-text")
                                      (bookmarks . "book")))

(setq initial-buffer-choice (lambda () (dashboard-refresh-buffer)))
