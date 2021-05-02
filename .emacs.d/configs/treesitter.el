(use-package tree-sitter)
(use-package tree-sitter-langs)

(global-tree-sitter-mode)

(add-hook 'python-mode-hook #'tree-sitter-hl-mode)
