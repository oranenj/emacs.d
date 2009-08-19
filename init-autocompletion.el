;;; Autocompletion
(require 'auto-complete nil t)
(global-auto-complete-mode t)
(setq ac-auto-start 3)
(setq ac-dwim nil)

(set-default 'ac-sources
             (if (> emacs-major-version 22)
                 (progn
                   (require 'ac-dabbrev)
                   '(ac-source-dabbrev ac-source-words-in-buffer))
               ;; dabbrev is very slow in emacs 22
               '(ac-source-words-in-buffer)))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))

;; This stops "end" followed by "RET" getting completed to something
;; like "endomorph" - have to use an explicit "TAB" to complete.
(define-key ac-complete-mode-map (kbd "\r") nil)

(when *vi-emulation-support-enabled*
  (define-key ac-complete-mode-map (kbd "C-n") 'dabbrev-expand)
  (define-key ac-complete-mode-map (kbd "C-p") 'dabbrev-expand)
  (define-key ac-complete-mode-map viper-ESC-key 'viper-intercept-ESC-key))

(provide 'init-autocompletion)