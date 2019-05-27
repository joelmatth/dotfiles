(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(cider
  evil
  flx-ido
  projectile
  solarized-theme))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p)))

(require 'evil)
(evil-mode 1)

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(load-theme 'solarized-light t)

(setq backup-directory-alist
      '(("." . (concat user-emacs-directory "auto-save/"))))
