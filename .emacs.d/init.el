(defun load-org-file (org-file-name)
  (org-babel-load-file
   org-file-name))

(load-org-file "~/.emacs.d/packages.org")
(load-org-file "~/.emacs.d/keybindings.org")
(load-org-file "~/.emacs.d/config.org")


(load-org-file "~/.emacs.d/configs/org.org")
(load-org-file "~/.emacs.d/configs/modeline.org")
(load-org-file "~/.emacs.d/configs/dashboard.org")
(load-org-file "~/.emacs.d/configs/comment.org")
(load-org-file "~/.emacs.d/configs/counsel.org")
(load-org-file "~/.emacs.d/configs/ivy.org")
(load-org-file "~/.emacs.d/configs/colours.org")
(load-org-file "~/.emacs.d/configs/git.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" default))
 '(git-gutter:added-sign "▎")
 '(git-gutter:deleted-sign "契")
 '(git-gutter:modified-sign "▎")
 '(git-gutter:window-width 2)
 '(package-selected-packages
   '(autothemer solaire-mode hl-todo tree-sitter-langs tree-sitter smart-comment dashboard haskell-mode doom-themes doom-modeline org-bullets emojify all-the-icons highlight-numbers which-key general evil-collection evil use-package bind-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )