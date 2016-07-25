(defun guoys-isearch-selection () 
  (interactive)
  (if (use-region-p) (swiper (buffer-substring-no-properties (point) (mark)))
    (swiper))
)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun my-ecb-active-or-deactive () 
  (interactive)
  (if ecb-minor-mode 
      (ecb-deactivate)
    (ecb-activate)
    )
  )

(provide 'init-personal-functions)
