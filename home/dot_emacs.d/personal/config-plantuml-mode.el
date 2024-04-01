;;; config-plantuml.el --- Adding custome styles

;;; Commentary:

;;; Code:
(require 'use-package)

(use-package plantuml-mode)

(add-to-list 'auto-mode-alist
             '("\\.puml\\'" . plantuml-mode))

(with-eval-after-load 'plantuml-mode

  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))


  ( plantuml-default-exec-mode 'jar)
  (setq plantuml-jar-path "/Users/rmedinaalarcon/code/stuff/emacs-modes/plantuml-1.2023.11.jar")
  (setq org-plantuml-jar-path (expand-file-name "/Users/rmedinaalarcon/code/stuff/emacs-modes/plantuml-1.2023.11.jar"))
  (setq org-startup-with-inline-images t))


(provide 'config-plantuml-mode)
;;; config-plantuml-mode.el ends here
