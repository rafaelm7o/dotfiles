(use-package winum
  :ensure t
 :config
(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "C-²") 'winum-select-window-by-number)
      (define-key map (kbd "s-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "s-1") 'winum-select-window-1)
      (define-key map (kbd "s-2") 'winum-select-window-2)
      (define-key map (kbd "s-3") 'winum-select-window-3)
      (define-key map (kbd "s-4") 'winum-select-window-4)
      (define-key map (kbd "s-5") 'winum-select-window-5)
      (define-key map (kbd "s-6") 'winum-select-window-6)
      (define-key map (kbd "s-7") 'winum-select-window-7)
      (define-key map (kbd "s-8") 'winum-select-window-8)
      map))

(winum-mode))

;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Window
(progn
  (define-prefix-command 'w-key-map)
  (define-key w-key-map (kbd "-") 'split-window-below)
  (define-key w-key-map (kbd "/") 'split-window-right))
(global-set-key (kbd "<s-return> w") '("window" . w-key-map))

;; Search
(progn
  (define-prefix-command 's-key-map)
  (define-key s-key-map (kbd "b") 'helm-ag-buffers)
  (define-key s-key-map (kbd "f") 'helm-file-do-git-grep)
  (define-key s-key-map (kbd "/") 'helm-ag-project-root))
(global-set-key (kbd "<s-return> s") '("search" . s-key-map))

;; File
(progn
  (define-prefix-command 'f-key-map)
  (define-key f-key-map (kbd "c") 'crux-copy-file-preserve-attributes)
  (define-key f-key-map (kbd "r") 'crux-rename-buffer-and-file)
  (define-key f-key-map (kbd "s") 'save-buffer)
  (define-key f-key-map (kbd "d") 'crux-delete-file-and-buffer))
(global-set-key (kbd "<s-return> f") '("file" . f-key-map))

(global-set-key (kbd "s-*") 'helm-projectile-ag)
(global-set-key (kbd "C-;") 'iedit-mode)

;; visual
(progn
  (define-prefix-command 'v-key-map)
  (define-key v-key-map (kbd "i p") 'er/mark-inside-pairs))
(global-set-key (kbd "<s-return> v") '("visual" . v-key-map))

;; Make <escape> quit as much as possible - From SPACEMACS
;;(global-set-key (kbd "M-ESC C-g") 'keyboard-escape-quit)
;; (define-key key-translation-map (kbd "<escape>") (kbd "C-g"))
(global-set-key (kbd "<s-return> TAB") '("switch-previous-buffer" . crux-switch-to-previous-buffer))
(global-set-key (kbd "<s-return> X K") '("Kill Emacs" . kill-emacs))

;; MAGIT
(progn
  (define-prefix-command 'g-key-map)
  (define-key g-key-map (kbd "b") 'magit-diff-buffer-file)
  (define-key g-key-map (kbd "s") 'magit-diff-buffer-staged)
  (define-key g-key-map (kbd "s") 'magit-diff-buffer-staged)
  (define-key g-key-map (kbd "u") 'magit-diff-buffer-unstaged))
(global-set-key (kbd "<s-return> g") '("magit" .  g-key-map))

(provide 'binding)
;;; binding.el ends here
