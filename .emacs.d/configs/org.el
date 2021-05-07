(require 'org)

(add-hook 'org-mode-hook 'org-indent-mode)
(setq-default org-display-custom-times t)
(setq org-directory "~/Org/"
      org-agenda-files '("~/Org/agenda.org")
      org-default-notes-file (expand-file-name "notes.org" org-directory)
      org-ellipsis " ▼ "
      org-log-done 'time
      org-journal-dir "~/Org/journal/"
      org-journal-date-format "%B %d, %Y (%A) "
      org-journal-file-format "%d-%m-%Y.org"
      org-time-stamp-custom-formats '("<%d-%m-%Y %a>" . "<%d-%m-%Y %a %H:%M>")
      org-hide-emphasis-markers t)

(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)

(setq org-src-fontify-natively t
    org-src-tab-acts-natively t
    org-confirm-babel-evaluate nil
    org-edit-src-content-indentation 0)

(use-package org-tempo
  :ensure nil) ;; tell use-package not to try to install org-tempo since it's already there.

(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(setq org-blank-before-new-entry (quote ((heading . nil)
                                         (plain-list-item . nil))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

(nvmap :prefix "SPC" :state 'normal
    "o a"   '(org-agenda :which-key "Org Agenda")
    "o s"   '(org-schedule :which-key "Org Schedule")
    "o d"   '(org-deadline :which-key "Org Deadline")
    "o o"   '(org-open-at-point :which-key "Org Open Link")
    "o t"   '(org-toggle-checkbox :which-key "Org Toggle Checkbox"))
