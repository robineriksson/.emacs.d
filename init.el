(setq package-enable-at-startup nil)
(package-initialize)

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
  :load-path "/home/robin/Gits/ESS/lisp/"
    :commands R)
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
