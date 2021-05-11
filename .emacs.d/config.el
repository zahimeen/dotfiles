(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq inhibit-startup-message t)        ; Disable the startup message
(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable the toolbar
(tooltip-mode -1)       ; Disable tooltips
(menu-bar-mode -1)      ; Disable the menu bar

(set-face-attribute 'default nil :font "FiraCode Nerd Font"
  :height 130
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "UbuntuMono Nerd Font"
  :height 120
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "FiraCode Nerd Font"
  :height 130
  :weight 'medium)

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-13"))

(setq-default indent-tabs-mode nil
              tab-width 4
              tab-stop-list (number-sequence 4 120 4))
(global-set-key (kbd "TAB") 'tab-to-tab-stop)

(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)
(setq-default display-line-numbers-width 4)
(setq-default display-line-numbers-widen t)

;; disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                which-key-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq-default line-spacing 0)

(setq-default word-wrap t
              truncate-lines t)
(setq truncate-partial-width-windows nil)

(add-hook 'text-mode-hook #'visual-line-mode)

(use-package hl-todo)
(global-hl-todo-mode)
(add-hook 'org-mode-hook #'hl-todo-mode)

(use-package hl-line
  :init
  (defvar global-hl-line-modes
    '(prog-mode text-mode conf-mode special-mode
      org-agenda-mode)
    "What modes to enable `hl-line-mode' in."))

  ;; Not having to render the hl-line overlay in multiple buffers offers a tiny
  ;; performance boost. I also don't need to see it in other buffers.
  (setq hl-line-sticky-flag nil
        global-hl-line-sticky-flag nil)

(global-hl-line-mode)

(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; how many lines at a time
;; (setq mouse-wheel-progressive-speed t) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(setq global-prettify-symbols-mode t)
(use-package all-the-icons)
(use-package emojify
  :hook (after-init . global-emojify-mode))

(show-paren-mode 1)
(setq show-paren-delay 0)

(use-package highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
(add-hook 'org-mode-hook 'highlight-numbers-mode)
