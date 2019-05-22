(require 'package)

;; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(load-theme 'solarized-light t)

(setq auto-save-file-name-transforms
  `((".*" ,(concat user-emacs-directory "auto-save/") t)))
