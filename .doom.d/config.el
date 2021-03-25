(setq doom-theme 'doom-gruvbox)
;; (setq doom-gruvbox-dark-variant "hard")

(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 13)
;; (setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 13)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 13)
      doom-big-font (font-spec :family "Hack Nerd Font Mono" :size 19))
      ;; doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 19))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq user-full-name "Zahin Muhaimeen"
      user-mail-address "zahin.muhaimeen@gmail.com")

(setq org-directory "~/org/"
      projectile-project-search-path "~/code/")
