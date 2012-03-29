(add-to-list 'load-path "~/.emacs.d/")
(set-face-foreground 'font-lock-comment-face "red")
(setq-default indent-tabs-mode nil)

(require 'whitespace)
(setq whitespace-line-column 140)
(setq whitespace-style (quote (face tab-mark trailing lines)))
(global-whitespace-mode t)