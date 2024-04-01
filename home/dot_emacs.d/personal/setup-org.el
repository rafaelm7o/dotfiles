;;; setup-org.el --- Adding new things to org mode

;;; Commentary:
;;; Blaorgorg

;;; Code:
(require 'use-package)

;; (message (getenv "ORGMODE_GTD"))
;; (list
                        ;; (directory-files (getenv "ORGMODE_NOTES") "\\.org$")
                          ;; (concat (getenv "ORGMODE_GTD") "inbox.org")
                          ;; (concat (getenv "ORGMODE_GTD") "gtd.org")
                          ;; (concat (getenv "ORGMODE_GTD") "tickler.org"))
;; (setq org-agenda-files (list
                        ;; (directory-files (getenv "ORGMODE_NOTES") "\\.org$")
                          ;; (concat (getenv "ORGMODE_GTD") "inbox.org")
                          ;; (concat (getenv "ORGMODE_GTD") "gtd.org")
                          ;; (concat (getenv "ORGMODE_GTD") "tickler.org")))

;; (use-package org-journal
;;   :ensure t
;;   :defer t
;;   :init
;;   ;; Change default prefix key; needs to be set before loading org-journal
;;   (setq org-journal-prefix-key "C-c j ")
;;   :config
;;   (setq org-journal-dir (getenv "ORGMODE_NOTES")
;;         org-journal-date-format "%A, %d %B %Y"))


(progn
  (define-prefix-command 'o-key-map)
  (define-key o-key-map (kbd "c") 'org-capture)
  (define-key o-key-map (kbd "r") 'org-refile))
(global-set-key (kbd "<s-return> o") o-key-map)

(progn
  (define-prefix-command 'o-key-map)
  (define-key o-key-map (kbd "c") 'org-capture))
(global-set-key (kbd "<s-return> o") o-key-map)

(defun config-org-mode-settings ()
  (setq org-hide-emphasis-markers t))

(setq config-org-mode-hook 'config-org-mode-settings)

(add-hook 'org-mode-hook (lambda () (run-hooks 'config-org-mode-hook)))

;; GTD
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline (concat (getenv "ORGMODE_GTD") "inbox.org") "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline  (concat (getenv "ORGMODE_GTD") "tickler.org") "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(((concat (getenv "ORGMODE_GTD") "gtd.org") :maxlevel . 3)
                           ((concat (getenv "ORGMODE_GTD") "someday.org") :level . 1)
                           ((concat (getenv "ORGMODE_GTD") "tickler.org") :maxlevel . 2)))

(setq org-agenda-custom-command
      '(("s" "Via slack" tags-todo "@slack"
         ((org-agenda-overriding-header "Slack")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first))
         ("e" "Via email" tags-todo "@email"
          ((org-agenda-overriding-header "Email")
           (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first))))))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  "Current todo status."
  (string= "TODO" (org-current-is-todog-get-todo-state)))

;; ;; OrgRoam;
;; (use-package org-roam
;;   :ensure t
;;   :custom
;;   (org-roam-directory (file-truename (concat (getenv "ORGMODE_NOTES") "/org-roam/")))
;;   :bind ()
;;   :config
;;   ;; If you're using a vertical completion framework, you might want a more informative completion interface
;;   (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;;   (org-roam-db-autosync-mode)
;;   ;; If using org-roam-protocol
;;   (require 'org-roam-protocol))


;; Beauty

(setq org-emphasis-alist
      '(("*" bold)
        ("/" italic)
        ("_" underline)
        ("=" org-verbatim verbatim)
        ("~" org-code verbatim)
        ("+" (:strike-through t))))

(defface my-org-emphasis-bold
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#a60000")
    (((class color) (min-colors 88) (background dark))
     :foreground "#ff8059"))
  "My bold emphasis for Org.")

(defface my-org-emphasis-italic
  '((default :inherit italic)
    (((class color) (min-colors 88) (background light))
     :foreground "#005e00")
    (((class color) (min-colors 88) (background dark))
     :foreground "#44bc44"))
  "My italic emphasis for Org.")

(defface my-org-emphasis-underline
  '((default :inherit underline)
    (((class color) (min-colors 88) (background light))
     :foreground "#813e00")
    (((class color) (min-colors 88) (background dark))
     :foreground "#d0bc00"))
  "My underline emphasis for Org.")

(defface my-org-emphasis-strike-through
  '((((class color) (min-colors 88) (background light))
     :strike-through "#972500" :foreground "#505050")
    (((class color) (min-colors 88) (background dark))
     :strike-through "#ef8b50" :foreground "#a8a8a8"))
  "My strike-through emphasis for Org.")


(provide 'setup-org)
;;; setup-org.el ends here
