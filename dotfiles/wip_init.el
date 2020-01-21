;; Package Setup ===============================================================

(require 'package)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

;; General Configuration =======================================================

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq display-line-numbers-type t)
(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; Package Install + Initial config ============================================

(use-package try :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package golden-ratio
  :ensure t
  :config (golden-ratio-mode))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (global-auto-complete-mode t))

(use-package company
  :ensure t
  :config (global-company-mode))
  
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)) ;; super-p
(setq projectile-project-search-path '("~/git"))

(use-package dracula-theme :ensure t)

(use-package powerline :ensure t)

(use-package helm
  :ensure t)

;; Javascript setup
(use-package cl-lib :ensure t)
(use-package js2-mode :ensure t)
(use-package ac-js2 :ensure t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Awesome tab
;; git clone --depth=1 https://github.com/manateelazycat/awesome-tab.git
(add-to-list 'load-path (expand-file-name "~/.emacs.d/local/awesome-tab/"))
(require 'awesome-tab)
(awesome-tab-mode t)
(awesome-tab-build-helm-source)
(setq helm-source-list '(helm-source-awesome-tab-group))


;; packages to try and consider:
;; ivy, counsel, swiper, avy, flycheck, indent-guide, awesome-tabs, magit

;; Other Stuff ================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm projectile powerline company ac-js2 js2-mode dracula-theme auto-complete golden-ratio golden-ration which-key try use-package bind-key))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
