(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/config.el")

(defun load-directory (dir)
  (let ((load-it (lambda (f)
           (load-file (concat (file-name-as-directory dir) f)))
         ))
(mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/lisp/")
