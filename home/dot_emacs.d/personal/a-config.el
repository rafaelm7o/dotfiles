;; =====================
;; => Custom packages
;; =====================
(prelude-require-packages '(
                            iedit
                            rainbow-delimiters
                            highlight-parentheses
                            rainbow-mode
                            dracula-theme
                            ))

;; =====================
;; => Stylist
;; =====================
(setq prelude-theme nil)
(set-face-attribute 'default nil
   :family "Office Code Pro"
   :height 120
   :weight 'normal
   :width 'normal)
(load-theme 'dracula t)

(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")
(set-face-attribute 'mode-line nil :background "#7954A1")

(unwind-protect
    (condition-case ex
        (set-face-attribute
         'region nil
         :box '(:line-width (-1 . -1)
                            :color "gold"
                            :Styl Nil))
      ('error
       (set-face-attribute
        'region nil
        :box '(:line-width -1
                           :color "gold"
                           :style nil)))))

;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(size-indication-mode t)

;; =====================
;; => Load external files
;; =====================
(let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
  (when (file-directory-p nudev-emacs-path)
    (add-to-list 'load-path nudev-emacs-path)
    (require 'nu)))

;; =====================
;; => Settings
;; =====================

(setq x-select-enable-clipboard t
      helm-ag-insert-at-point 'symbol
      x-underline-at-descent-line t
      projectile-project-search-path '("~/dev/")
     ;; lispyville-barf-stay-with-closing t
      highlight-parentheses t
      helm-candidate-number-limit 50
      projectile-git-submodule-command nil
      auto-revert-interval 1)           ; Refresh buffers fast

(setq-default tab-width 2)

(setq hl-paren-background-colors '("blue"))

(dolist (mode
   '( delete-selection-mode ; Replace selected text
      show-paren-mode       ; Highlight matching parentheses
      winner-mode))         ; Allow undo/redo on window operations
   (funcall mode 1))

(fset 'yes-or-no-p 'y-or-n-p)

;; Defauls
(setq-default truncate-lines t)
(global-hl-line-mode t)
(save-place-mode t)
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; Mini buffer
(add-hook 'minibuffer-setup-hook (lambda ()
            (local-set-key (kbd "ESC") 'abort-minibuffers)))

(defun stop-using-minibuffer ()
  "Kill the minibuffer."
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
;;; a-config.el ends here
