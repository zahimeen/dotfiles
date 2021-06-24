(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 35))
  )

(setq doom-modeline-bar-width 5)

(setq doom-modeline-icon t)

(doom-modeline-def-modeline 'main
  '(bar " " matches buffer-info remote-host buffer-position parrot selection-info)
  '(misc-info minor-modes checker input-method buffer-encoding major-mode process vcs " "))
