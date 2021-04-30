(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq inhibit-startup-message t)        ; Disable the startup message
(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable the toolbar
(tooltip-mode -1)       ; Disable tooltips
(menu-bar-mode -1)      ; Disable the menu bar

(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)
(setq-default display-line-numbers-width 3)
(setq-default display-line-numbers-widen t)
(add-hook 'which-key-hook global-display-line-numbers-mode nil)

(setq-default indent-tabs-mode nil
              tab-width 4
              tab-stop-list (number-sequence 4 120 4))
(global-set-key (kbd "TAB") 'tab-to-tab-stop)

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

(setq-default line-spacing 0.3)

(setq-default word-wrap t
              truncate-lines t)
(setq truncate-partial-width-windows nil)

(add-hook 'text-mode-hook #'visual-line-mode)

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

(use-package highlight-numbers
  :hook ((prog-mode conf-mode) . highlight-numbers-mode)
  :config (setq highlight-numbers-generic-regexp "\\_<[[:digit:]]+\\(?:\\.[0-9]*\\)?\\_>"))

(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; how many lines at a time
;; (setq mouse-wheel-progressive-speed t) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq global-prettify-symbols-mode t)
(use-package all-the-icons)
(use-package emojify
  :hook (after-init . global-emojify-mode))
