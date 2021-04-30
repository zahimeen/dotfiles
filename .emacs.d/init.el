(defun load-org-file (org-file-name)
  (org-babel-load-file
   org-file-name))

(load-org-file "~/.emacs.d/packages.org")
(load-org-file "~/.emacs.d/keybindings.org")
(load-org-file "~/.emacs.d/config.org")


(load-org-file "~/.emacs.d/configs/org.org")
(load-org-file "~/.emacs.d/configs/modeline.org")
(load-org-file "~/.emacs.d/configs/colours.org")
(load-org-file "~/.emacs.d/configs/dashboard.org")
(load-org-file "~/.emacs.d/configs/comment.org")
