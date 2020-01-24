;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Init][Init:1]]
(setq gc-cons-threshold (* 50 1000 1000)) ;; make startup faster by reducing garbage collection frequency
;; Init:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*UI%20tweaks][UI tweaks:1]]
(setq inhibit-startup-message t
      inhibit-startup-screen t
      initial-scratch-message nil)

(fset 'yes-or-no-p 'y-or-n-p)
;; UI tweaks:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Company][Company:1]]
(use-package company
  :ensure t)
(global-company-mode)
(setq company-idle-delay 0
      company-minimum-prefix-length 3)
(define-key company-mode-map (kbd "C-:") 'helm-company)
(define-key company-active-map (kbd "C-:") 'helm-company)
;; Company:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Define%20Word][Define Word:1]]
(use-package define-word
  :ensure t)
;; Define Word:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Dracula%20Theme][Dracula Theme:1]]
(use-package dracula-theme
  :ensure t)
;; Dracula Theme:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Drag%20Stuff][Drag Stuff:1]]
(use-package drag-stuff
  :ensure t
  :bind (("<M-up>" . drag-stuff-up)
   ("<M-down>" . drag-stuff-down)
   ("<M-left>" . drag-stuff-left)
   ("<M-right>" . drag-right-stuff)))
(drag-stuff-global-mode)
;; Drag Stuff:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Golden%20Ratio][Golden Ratio:1]]
(use-package golden-ratio
  :ensure t)
(golden-ratio-mode)
;; Golden Ratio:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Helm][Helm:1]]
; Incremental and narrowing framework
(use-package helm
  :ensure t)

; Silver search with helm
(use-package helm-ag
  :ensure t
  :config (global-set-key (kbd "s-F") 'helm-projectile-ag))

; Helm interface for company-mode
(use-package helm-company
  :ensure t)

; Helm interface for projectile
(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))
(global-set-key (kbd "s-P") 'helm-projectile-find-file)

; Efficiently hopping squeezed lines
(use-package helm-swoop
  :ensure t)

; Configuration
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-follow-mode-persistent t)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-split-window-inside-p t)
;; Helm:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Javascript%20Support][Javascript Support:1]]
(use-package js2-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
(setq js-indent-level 2)
;; Javascript Support:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Modeline][Modeline:1]]
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
;; Modeline:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Neotree][Neotree:1]]
(use-package neotree
  :ensure t)
;; Neotree:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Org%20Bullets][Org Bullets:1]]
(use-package org-bullets
  :ensure t)
(setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
(add-hook 'org-mode #'org-bullets-mode)
(org-bullets-mode 1)
;; Org Bullets:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Projectile][Projectile:1]]
(use-package projectile
  :ensure t
  :config (progn
     (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
     (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)))
(projectile-global-mode)
;; Projectile:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Smart%20Parentheses][Smart Parentheses:1]]
(use-package smartparens
  :ensure t)
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'emacs-lisp-mode #'smartparens-mode)
;; Smart Parentheses:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Which%20Key][Which Key:1]]
(use-package which-key
  :ensure t)
(which-key-mode)
;; Which Key:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Awesome%20Tab][Awesome Tab:1]]
;; git clone --depth=1 https://github.com/manateelazycat/awesome-tab.git
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/awesome-tab/"))
(require 'awesome-tab)
(awesome-tab-mode t)
(awesome-tab-build-helm-source)
(setq helm-source-list
      '(helm-source-awesome-tab-group))
;; Awesome Tab:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Yasnippet][Yasnippet:1]]
(use-package yasnippet
    :ensure t)
(yas-global-mode)
(setq yas-snippets-dirs '("~/.emacs.d/snippets"))
;; Yasnippet:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Defaults][Defaults:1]]
(setq auto-revert-interval 1            ; Refresh buffers fast
      custom-file (make-temp-file "")   ; Discard customization's
      echo-keystrokes 0.1               ; Show keystrokes asap
      inhibit-startup-message t         ; No splash screen please
      initial-scratch-message nil       ; Clean scratch buffer
      recentf-max-saved-items 100       ; Show more recent files
      ring-bell-function 'ignore        ; Quiet
      sentence-end-double-space nil     ; No double space
      tab-width 2                       ; 2 spaces
      make-backup-files nil             ; stop creating backup~ files
      auto-save-default nil             ; stop creating #autosave# files
      create-lockfiles nil              ; stop creating .# files
  )

(setq-default frame-title-format "%b (%f)"
              indent-tabs-mode nil
              fill-column 140
              tab-width 2)
(setenv "BROWSER" "firefox")
;; Defaults:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Standard%20modes%20%5Bon/off%5D][Standard modes [on/off]:1]]
;; Turn-off modes
(dolist (mode
   '(menu-bar-mode                ; No menu bar
     tool-bar-mode                ; No toolbar
     scroll-bar-mode              ; No scroll bars
     blink-cursor-mode))          ; No blinking cursor
  (funcall mode 0))

;; Turn-on modes
(dolist (mode
   '(abbrev-mode                  ; E.g. sopl -> System.out.println
     column-number-mode           ; Show column number in mode line
     delete-selection-mode        ; Replace selected text
     recentf-mode                 ; Recently opened files
     show-paren-mode              ; Highlight matching parentheses
     ))
  (funcall mode 1))
;; Standard modes [on/off]:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Utils][Utils:1]]
;; Tell me how long is it taking to startup?
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Loading private functions:
(add-hook
 'after-init-hook
 (lambda ()
   (let ((private-file (concat user-emacs-directory "elisp/private.el")))
     (when (file-exists-p private-file)
       (load-file private-file)))))
;; Utils:1 ends here

;; [[file:~/git/wmadruga-utils/dotfiles/emacs.d/my-init.org::*Keybindings][Keybindings:1]]
(global-set-key (kbd "C-a") 'mark-whole-buffer)       ;; select all
;; Keybindings:1 ends here
