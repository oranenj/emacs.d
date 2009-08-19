;;; Mac OS specific customisation

(eval-after-load "woman"
  '(setq woman-manpath (append (list "/opt/local/man") woman-manpath)))
(dolist (dir (mapcar 'expand-file-name '("/usr/local/bin" "/opt/local/bin"
                                         "/opt/local/lib/postgresql83/bin" "~/bin")))
  (setenv "PATH" (concat dir ":" (getenv "PATH")))
  (setq exec-path (append (list dir) exec-path))))


(setq mac-command-modifier 'meta)

(when (and *viper-enabled* *is-cocoa-emacs*)
  (defun viper-change-cursor-color (new-color &optional frame)))

(provide 'init-mac)
