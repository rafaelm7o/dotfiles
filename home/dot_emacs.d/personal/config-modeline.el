;;; Config-modeline --- A shiny modeline

;;; Commentary:
;;; Setup

;;; Code:
(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function))

(use-package minions
  :config (minions-mode 1))

(provide 'config-modeline)
;;; config-modeline.el ends here
