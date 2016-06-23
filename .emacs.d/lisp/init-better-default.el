(setq make-backup-files nil)
(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)
(delete-selection-mode t)
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(setq org-agenda-files '("~/org"))
;; elisp确认由 yes or no 变成 y or n
(fset 'yes-or-no-p 'y-or-n-p)


(provide 'init-better-default)
