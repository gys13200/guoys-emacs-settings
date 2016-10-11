

(setq-default cursor-type 'bar)
(defun guoys-isearch-selection ()
  (interactive)
  (if (use-region-p)
      (let ((selected (buffer-substring-no-properties (point) (mark))))
        (deactivate-mark) ;; 取消选中的region
        (swiper selected)
        )
    ;;      (swiper (buffer-substring-no-properties (point) (mark)))
    (swiper)
    )
  )
