
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)
;;(load-theme 'monokai t)
(color-theme-deep-blue)
(global-hl-line-mode t)

;; hl-line ����ɫ
(set-face-background 'hl-line "#3e4446")
;; h1-line-mode�£��﷨������Ȼ����
(set-face-foreground 'highlight nil)


(provide 'init-ui)
