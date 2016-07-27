
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    ;;(add-to-list 'package-archives '("popkit" . "https://elpa.popkit.org/packages") t)
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
				   ;; git-emacs 工具
				   ;;git-emacs
				   magit

				   jdee
				   cedet
				   ;;elib
				   ecb
				   helm
				   use-package
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

(use-package hungry-delete
  :init
  (global-hungry-delete-mode)
  )
;;(require 'hungry-delete)
;;(global-hungry-delete-mode)

(use-package smartparens-config
  :init
  (smartparens-global-mode t)
  )
;;(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;(smartparens-global-mode t)

;; config js2-mode for js files
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;;(global-company-mode t)


(use-package highlight-indentation
  :init
  (progn
    (highlight-indentation-mode t)
    (highlight-indentation-current-column-mode t)
    )
  )

;;(require 'highlight-indentation)



(window-numbering-mode)
(autoload 'color-theme "color-theme" "color-theme" t )
;;(require 'color-theme)
;;(color-theme-initialize)

;;(use-package popwin
;;  :init
;;  (popwin-mode 1)
;;  )
(require 'popwin)
(popwin-mode 1)


;;(add-to-list 'load-path "~/.emacs.d/packages/git-emacs")
;;(require 'git-emacs)
;;(require 'magit)
;;(require 'show-paren)

;;(require 'indent-guide)
;;(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;;(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;;(ergoemacs-mode 1)
(use-package company
  :init
  (global-company-mode t)
  :config
  (progn 
    (define-key company-active-map (kbd "\C-n") 'company-select-next)
    (define-key company-active-map (kbd "\C-p") 'company-select-previous)
    (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "\C-v") 'company-show-location)
    (define-key company-active-map (kbd "<tab>") 'company-complete)
    (define-key company-active-map (kbd "\C-g") '(lambda ()
						   (interactive)
						   (company-abort)))
    )
  )

(use-package ecb
;;  :init
;;  (use-package init-ecb)
  :config
  (progn
    (require 'init-ecb)
    (setq ecb-layout-name "leftright-sa-m")
    (setq ecb-tip-of-the-day nil)
    )
  )
;;(autoload 'ecb "ecb" "ecb" t)
;;(eval-after-load 'ecb
;;  (progn
;;    (require 'ecb)
;;    (require 'init-ecb)
;;    (setq ecb-layout-name "leftright-sa-m")
;;    (setq ecb-tip-of-the-day nil)
;;    )
;;  )
;;(require 'ecb)


;;(setq ecb-auto-activate t ecb-tip-of-the-day nil)


;;(require 'semantic-tag-folding nil 'noerror)
;;(global-semantic-tag-folding-mode 1)  

(add-hook 'jdee-mode-hook 'hs-minor-mode)

;;(require 'cedet)
;;(require 'semantic-ia)

(provide 'init-packages)
