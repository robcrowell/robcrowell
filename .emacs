(add-to-list 'load-path "~/.emacs.d/lisp/")

;use SHIFT+<left> to go to the left buffer
(windmove-default-keybindings)

;fuck tabs
(setq-default indent-tabs-mode nil)

;100 characters should be enough for anybody
(setq-default fill-column 100)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(line-number-mode 1)
(column-number-mode 1)

;https://www.emacswiki.org/emacs/download/column-marker.el
(require 'column-marker)
(set-face-background 'column-marker-1 "red")
(add-hook 'python-mode-hook
          (lambda () (interactive)
            (column-marker-1 fill-column)))

;show trailing whitespace, lines that are too long
(require 'whitespace)
(setq whitespace-line-column fill-column)
(setq whitespace-style (quote (face tab-mark trailing lines)))
(custom-set-faces
 '(whitespace-line ((t (:foreground "violet")))))
(global-whitespace-mode t)
