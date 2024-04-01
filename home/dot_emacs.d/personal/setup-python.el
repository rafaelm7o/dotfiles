;;; setup-python.el --- Key chord setup

;;; Commentary:

;; Extennd python config

;;; Code:
(use-package better-jumper)

(defun jump-def ()
  "Integrate better jumper."
    (interactive)
    (better-jumper-set-jump)
    (lsp-find-definition))

(add-hook 'python-mode-hook
          (defalias 'my/setup-python-mode
            (lambda ()
              (message "==> Enabling python-mode-hook")
              (turn-on-better-jumper-mode)
              (define-key python-mode-map (kbd "<s-return> >") 'jump-def)
              (define-key python-mode-map (kbd "<s-return> <") '("Go back" . better-jumper-jump-backward)))))

(provide 'setup-python)

;;; setup-python.el ends here
