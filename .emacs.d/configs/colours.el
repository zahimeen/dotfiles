;; (use-package doom-themes)
;; (setq doom-themes-enable-bold t
;;       doom-themes-enable-italic t)
(load "~/.emacs.d/theme.el")
(load-theme 'chris-lunar t)

;; (defvar efs/frame-transparency '(85 . 85))
;; (set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
;; (add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))

;; ;; A simple config:
;; (use-package solaire-mode
;;   :hook (after-init . solaire-global-mode))


;; ;; A more complex, more lazy-loaded config
;; (use-package solaire-mode
;;   ;; Ensure solaire-mode is running in all solaire-mode buffers
;;   :hook (change-major-mode . turn-on-solaire-mode)
;;   ;; ...if you use auto-revert-mode, this prevents solaire-mode from turning
;;   ;; itself off every time Emacs reverts the file
;;   :hook (after-revert . turn-on-solaire-mode)
;;   ;; To enable solaire-mode unconditionally for certain modes:
;;   :hook (ediff-prepare-buffer . solaire-mode)
;;   ;; Highlight the minibuffer when it is activated:
;;   :hook (minibuffer-setup . solaire-mode-in-minibuffer))

;; ;; (solaire-global-mode +1)

;; ;; (add-hook 'after-make-frame-functions
;; ;;           (lambda (_frame)
;; ;;             (load-theme 'doom-one t)
;; ;;             (solaire-mode-swap-bg)))

(use-package haskell-mode)
