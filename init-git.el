(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(autoload 'git-blame-mode "git-blame" "Minor mode for incremental blame for Git." t)
(require 'git) 
(require 'egg)

(provide 'init-git)
