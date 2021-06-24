(use-package smart-comment
  :init
  (nvmap :keymaps 'global :states 'normal
         "g c c"        'smart-comment)
  (nvmap :keymaps 'global :states 'visual
         "g c"          'smart-comment))
