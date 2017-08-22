(setq package-enable-at-startup nil)
(package-initialize)

;; set font
(set-face-attribute 'default nil :font "Ubuntu Mono" :height 120)

;; hide toolbar
;;
;; https://www.emacswiki.org/emacs/ToolBar#toc1
(tool-bar-mode -1)

;; hide scrollbar
;;
;; https://www.emacswiki.org/emacs/ScrollBar
(scroll-bar-mode -1)

;; hide menubar
;;
;; https://www.emacswiki.org/emacs/MenuBar
(menu-bar-mode -1)

;; hide splash screen
;;
;; http://stackoverflow.com/a/744681/3034693
(setq inhibit-startup-screen t)

;; hide scratch message
;;
;; https://stackoverflow.com/questions/1498258/how-do-i-change-the-scratch-message-in-emacs
(setq initial-scratch-message nil)



;; custom theme, for looks.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
;;(require 'dracula-theme')
;;(set-frame-font "Inconsolata-14")
;; enable ess (R interpretor)
(use-package ess-site
;;(use-package ess  ;;:ensure t
  ;;:init (require 'ess-site))
  ;;:defer t
  ;;:ensure t
  ;;:bind ("C-c r" . R))
  ;;(autoload 'R-mode "ess-site.el" "" t)
  ;;(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))
  ;;(setq inferior-R-args "--no-restore-history --no-save ")
  ;;(setq ess-history-file nil)
  )
  ;  :load-path "/home/robin/Gits/ESS/lisp/")
;;    :commands R)
;;(add-to-list 'load-path "/home/robin/Gits/ESS/lisp/")
;;(require 'ess-site)
;;tilde and other symbols
(require 'iso-transl)

;; add melpa package list
(require 'package)

(add-to-list 'package-archives
	     '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; flycheck (syntax checking)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
	 ("M-g j" . dumb-jump-go)
	 ("M-g i" . dumb-jump-go-prompt)
	 ("M-g x" . dumb-jump-go-prefer-external)
	 ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)

;;MAGIT
(use-package magit
  :defer t
  :ensure t
  :bind ("C-x g" . magit-status))

;; magit-gh-pull A github extension to magit
(use-package magithub
  :after magit
  :config (magithub-feature-autoinject t))


