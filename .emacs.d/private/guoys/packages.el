;;; packages.el --- guoys layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <root@ROOT-PC>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `guoys-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `guoys/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `guoys/pre-init-PACKAGE' and/or
;;   `guoys/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq guoys-packages
      '(swiper
        ;;fuzzy
        ;;auto-complete-nxml
        )
  )
(defun guoys/init-swiper ()
  (use-package swiper
    )
  )

;;(defun guoys/init-auto-complete-nxml ()
;;  (use-package auto-complete-nxml)
;;  )
;;(defun guoys/init-fuzzy ()
;;  (use-package fuzzy)
;;p  )



;;; packages.el ends here
