(require 'swank-clojure-autoload)

(setq swank-clojure-classpath (list "~/opt/lisp/clojure/clojure.jar"
                                    "/Users/oranenj/opt/lisp/clojure-contrib/src/"
                                    "/Users/oranenj/opt/lisp/clojure/src/clj/"))

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


