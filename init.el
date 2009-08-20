;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))


;; Configurables
(setq *viper-enabled* nil) 

;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

;; Add dirs in ~/.emacs.d/site-lisp/to load-path
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir (concat dotfiles-dir "/site-lisp/"))
           (default-directory my-lisp-dir))
      (progn
        (setq load-path (cons my-lisp-dir load-path))
        (normal-top-level-add-subdirs-to-load-path))))

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/jabber"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq generated-autoload-file autoload-file)

(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))


(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

; do not want (load "elpa-to-submit/nxhtml/autostart")

;; Load up ELPA, the package manager

(require 'package)
(package-initialize)
(require 'starter-kit-elpa)

(when *viper-enabled*
  (require 'init-viper))


;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
;(require 'starter-kit-ruby)
;(require 'starter-kit-js)


;; More stuff
(when *is-a-mac*
  (require 'init-mac))

(require 'init-ido)
(require 'init-autocompletion)
(require 'init-git) ;; needs egg
(require 'init-org)
(require 'init-clojure)

(require 'color-theme)

(color-theme-initialize)
(color-theme-charcoal-black)

;; work around bug:
(set-face-background 'region "DarkSlateBlue")


(regen-autoloads)
(update-directory-autoloads (concat dotfiles-dir "/site-lisp/clojure-mode/"))
(load autoload-file)

(load custom-file 'noerror)

;; Work around a bug on OS X where system-name is FQDN
(if (eq system-type 'darwin)
    (setq system-name (car (split-string system-name "\\."))))

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))

;;; init.el ends here
