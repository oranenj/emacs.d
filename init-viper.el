;;; viper setup

(global-unset-key "\C-z")
(setq viper-mode t)
(setq viper-custom-file-name (concat dotfiles-dir "viper.el"))
(require 'viper)
(define-key viper-insert-global-user-map (kbd "C-n") 'dabbrev-expand)
(define-key viper-insert-global-user-map (kbd "C-p") 'dabbrev-expand)

  ;; Stop C-u from clobbering prefix-arg -- I always use C-b/C-f to
  ;; scroll
  
(define-key viper-vi-basic-map "\C-u" nil)

  ;; Vim-style searching of the symbol at point, made easy by
  ;; highlight-symbol
  
(autoload 'highlight-symbol-next "highlight-symbol" "Highlight symbol at point")
(autoload 'highlight-symbol-prev "highlight-symbol" "Highlight symbol at point")

(setq highlight-symbol-on-navigation-p t)

(define-key viper-vi-global-user-map "*" 'highlight-symbol-next)
(define-key viper-vi-global-user-map "#" 'highlight-symbol-prev)

(provide 'init-viper)