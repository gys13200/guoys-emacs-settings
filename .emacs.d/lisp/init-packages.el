(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    )


(require 'cl)
;;add whatever packages you want here
(defvar guoys/packages '(
				   company
				   monokai-theme
				   hungry-delete
				   swiper
				   counsel
				   smartparens
				   ;;show-paren
				   js2-mode
				   nodejs-repl
				   exec-path-from-shell
				   window-numbering
				   color-theme
				   ;;indent-guide
				   highlight-indentation
				   ;; 将光标移动到新建的窗口上
				   popwin
				   ;;ergoemacs-mode
				   )  "Default packages")

(setq package-selected-packages guoys/packages)

(defun guoys/packages-installed-p ()
    (loop for pkg in guoys/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (guoys/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg guoys/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; config js2-mode for js files
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-company-mode t)

(require 'highlight-indentation)
(highlight-indentation-mode t)
(highlight-indentation-current-column-mode t)

(window-numbering-mode)
(require 'color-theme)
(color-theme-initialize)

(require 'popwin)
(popwin-mode 1)
;;(require 'show-paren)

;;(require 'indent-guide)
;;(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;;(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;;(ergoemacs-mode 1)
(provide 'init-packages)
