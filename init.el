;;Initialize packages
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

(find-file "~/Dropbox/todo.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/todo.org")))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "DONE(d)" "WAITING(w)" "SOMEDAY(s)"))))
 '(package-selected-packages
   (quote
    (elpy auctex use-package magit flycheck dumb-jump auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "C-c a") 'org-agenda)

;;; AUCTEX
;; (use-package tex
;;   :defer t
;;   :ensure auctex
;;   :config
;;   (setq TeX-auto-save t))
(use-package auctex
  :defer t
  :ensure t)
  ;; :config
  ;; (setq TeX-auto-save t)
  ;; (setq TeX-parse-self t)
  ;; (setq-default TeX-master nil))

;; remove whitepspaces.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; C-code style
;; not really a fan of this, but right now used in a package
;; with style guidelines that should be follows.
(setq c-default-style "k&r"
      c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; octave major mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


(use-package elpy
  ;;:defer t
  ;;:ensure t
  )
(elpy-enable)

;; (defvar myPackages
;;   '(better-defaults
;;     elpy ;; add the elpy package
;;     material-theme))
;; (elpy-enable)
;;; init.el ends here
