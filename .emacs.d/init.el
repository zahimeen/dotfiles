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
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   '("be177b476e181a7a4777d7cde6ee162b978787f70e2fe3cc1fa2a1b7c2cdeb7d" "3e7a588c605454390c246aed8882adee804aa149c1a7009ab43dff35190d13fa" "1da49658fa9755d0c7bbb7690e4ebc7bb80e5c3ebdfd57f23488fcf185b5b866" "6075d0efaa9e45afee2f797c2b143f46290f86e7f82bad74537a430ba420a2cb" "3dfa7d4710fe16de2dc01cc0faf36684cf5ee251c86e4ce8ef3019792e1be6f6" "4c25061278a15b9c68660e3d8afa596aa95eaab3534a7d0c85421c67983e4278" "dcb02f9f832f9e52f5f9fd0a4560b70e53cc01e7bd11a2afee5d73ebd6174694" "d3a3b0a88c09bd702a1741c8db8a40c1eb59eca9bcb855a0fe7ae05e818503e1" "f11010d49e7e76a2f5c71e810ee425b36295260aefb021ed8d92322479026ae4" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "957838c5ab481f5d406700441340035f384a79ba317bdc2f7836dcccd3f09a56" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" default))
 '(debug-on-error t)
 '(doom-modeline-mode t)
 '(fci-rule-color "#5B6268")
 '(git-gutter:added-sign "▎")
 '(git-gutter:deleted-sign "契")
 '(git-gutter:modified-sign "▎")
 '(git-gutter:update-interval 2)
 '(git-gutter:window-width 2)
 '(ivy-rich-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(package-selected-packages
   '(autothemer solaire-mode hl-todo tree-sitter-langs tree-sitter smart-comment dashboard haskell-mode doom-themes doom-modeline org-bullets emojify all-the-icons highlight-numbers which-key general evil-collection evil use-package bind-key))
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
