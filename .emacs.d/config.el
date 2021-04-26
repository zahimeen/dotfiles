;; disable creating random files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; visual bloat
(setq inhibit-startup-message t)
(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable the toolbar
(tooltip-mode -1)       ; Disable tooltips
(menu-bar-mode -1)      ; Disable the menu bar

(setq-default display-line-numbers 'relative)   ; relative line numbers

;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(global-set-key (kbd "TAB") 'self-insert-command)

;; fonts
(set-face-attribute 'default nil
  :font "FiraCode Nerd Font"
  :height 130
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "UbuntuMono Nerd Font"
  :height 140
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "FiraCode Nerd Font"
  :height 130
  :weight 'medium)
;; (set-face-attribute 'font-lock-comment-face nil
    ;; :slant 'italic
    ;; :family "Ubuntu Mono"
    ;; )
;; (set-face-attribute 'font-lock-keyword-face nil
    ;; :slant 'italic
    ;; :family "Ubuntu Mono"
    ;; )
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-13"))

(setq-default line-spacing 0.3) ;; space between lines

;; icons
(setq global-prettify-symbols-mode t)
(use-package all-the-icons)
(use-package emojify
  :hook (after-init . global-emojify-mode))
