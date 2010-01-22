;;; Mac OS specific customisation

(eval-after-load "woman"
  '(setq woman-manpath (append (list "/opt/local/man") woman-manpath)))
(dolist (dir (mapcar 'expand-file-name '("/usr/local/bin" "/opt/local/bin"
                                         "/bin"
                                         "/usr/texbin")))
  (setenv "PATH" (concat dir ":" (getenv "PATH")))
  (setq exec-path (append (list dir) exec-path)))

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-2") 'set-mark-command)

(setq mac-control-modifier 'meta)
(setq mac-option-modifier nil)
(setq mac-command-modifier 'control)

(when (and *viper-enabled* *is-cocoa-emacs*)
  (defun viper-change-cursor-color (new-color &optional frame)))

(provide 'init-mac)
