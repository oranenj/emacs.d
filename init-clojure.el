(require 'swank-clojure-autoload)

(setq swank-clojure-jar-path "~/opt/lisp/clojure/clojure.jar")
(unless (boundp 'swank-clojure-extra-classpaths)
  (setq swank-clojure-extra-classpaths nil))
(add-to-list 'swank-clojure-extra-classpaths
             "/Users/oranenj/opt/lisp/clojure/clojure-contrib/src/")
(add-to-list 'swank-clojure-extra-classpaths
             "/Users/oranenj/opt/lisp/clojure/src/clj/")

(eval-after-load 'clojure-mode
  '(progn
     (require 'slime)
     (setf slime-lisp-implementations
           `((clojure ,(swank-clojure-cmd)
                      :init swank-clojure-init
                      :coding-system utf-8-unix)))
     (setq slime-net-coding-system 'utf-8-unix)
     (slime-setup '(slime-fancy))))

(provide 'init-clojure)


