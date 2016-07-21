;; add package repository and enable dropping files in ~/.emacs.d/lisp/
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use SHIFT+<left> to go to the left buffer
(windmove-default-keybindings)

;; make it easier to locate files
(require 'ido)
(ido-mode t)

;; fuck tabs
(setq-default indent-tabs-mode nil)

;; 100 characters should be enough for anybody
(setq-default fill-column 100)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(line-number-mode 1)
(column-number-mode 1)

;; https://www.emacswiki.org/emacs/download/column-marker.el
(require 'column-marker)
(set-face-background 'column-marker-1 "red")
(add-hook 'after-change-major-mode-hook
          (lambda () (interactive)
            (column-marker-1 fill-column)))

;; show trailing whitespace, lines that are too long
(require 'whitespace)
(setq whitespace-line-column fill-column)
(setq whitespace-style (quote (face tab-mark trailing lines)))
(global-whitespace-mode t)

;; https://raw.githubusercontent.com/illusori/emacs-flymake-cursor/master/flymake-cursor.el
(require 'flymake)
(load-library "flymake-cursor")
(setq pycodechecker "pychecker")   ;; requires $PATH/pychecker to exist
(when (load "flymake" t)
  (defun flymake-pycodecheck-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pycodechecker (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pycodecheck-init)))
(add-hook 'python-mode-hook 'flymake-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:foreground "limegreen" :slant italic))))
 '(whitespace-line ((t (:foreground "limegreen" :slant italic)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-cursor-error-display-delay 0)
 '(flymake-log-level 1))
