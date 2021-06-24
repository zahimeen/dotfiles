(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp-deferred)

(setq lsp-headerline-breadcrumb-enable nil)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'top))

(setq lsp-ui-imenu-auto-refresh t)
(setq lsp-ui-imenu-window-width 25)

(use-package company
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<S-tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(add-hook 'after-init-hook 'global-company-mode)

;; (setq flymake-error-bitmap "")
;; (setq flymake-note-bitmap "")
;; (setq flymake-warning-bitmap "")

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))
