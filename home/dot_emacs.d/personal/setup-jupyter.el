;;; setup-jupyer.el --- Key chord setup

;;; Commentary:

;; Extennd jupyer config

;;; Code:
(use-package jupyter
  :ensure t)

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t))

(provide 'setup-python)

;;; setup-jupyter.el ends here
