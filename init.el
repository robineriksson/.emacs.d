(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
(add-to-list 'load-path "/home/robin/Gits/ESS/lisp/")
(require 'ess-site)
(require 'iso-transl)

(setq smerge-command-prefix "\C-cv")
(defun my-enable-smerge-maybe ()
  (when (and buffer-file-name (vc-backend buffer-file-name))
    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward "^<<<<<<< " nil t)
	(smerge-mode +1)))))
(add-hook 'buffer-list-update-hook #'my-enable-smerge-maybe)
