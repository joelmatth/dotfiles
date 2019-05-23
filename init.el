(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(evil
                      solarized-theme
                      cider))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p)))

(require 'evil)
(evil-mode 1)

(load-theme 'solarized-light t)

(setq auto-save-file-name-transforms
  `((".*" ,(concat user-emacs-directory "auto-save/") t)))
