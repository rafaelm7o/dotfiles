;;; config-python.el --- Config python

;;; Commentary:

;;; Code:
(require 'use-package)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred

(provide 'config-python)
;;; config-python.el ends here
