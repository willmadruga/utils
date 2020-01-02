
;; Package Setup ===============================================================
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
 	     '("gnu" . "https://elpa.gnu.org/packages/"))

(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; For use-package options, see https://github.com/jwiegley/use-package

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
