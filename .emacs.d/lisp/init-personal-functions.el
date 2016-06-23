(defun guoys-isearch-selection () 
  (interactive)
  (if (use-region-p) (swiper (buffer-substring-no-properties (point) (mark)))
    (swiper))
)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(provide 'init-personal-functions)
