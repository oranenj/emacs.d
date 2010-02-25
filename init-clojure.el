(require 'swank-clojure)

(setq swank-clojure-classpath (list "~/opt/lisp/clojure/clojure.jar"
                                    "/Users/oranenj/opt/lisp/clojure-contrib/src/"
                                    "/Users/oranenj/opt/lisp/clojure/src/clj/"
                                    "/Users/oranenj/.emacs.d/site-lisp/swank-clojure/src/"))

(eval-after-load 'clojure-mode
  '(progn
     (require 'slime)
     (setf slime-lisp-implementations
           `((clojure ,(swank-clojure-cmd)
                      :init swank-clojure-init
                      :coding-system utf-8-unix)))
     (setq slime-net-coding-system 'utf-8-unix)
     (slime-setup '(slime-repl))
     (add-hook 'slime-repl-mode-hook 'swank-clojure-slime-repl-modify-syntax t)))
  

(provide 'init-clojure)


