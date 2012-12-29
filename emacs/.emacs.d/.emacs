(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(delete-selection-mode nil)
 '(mark-even-if-inactive t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
(semantic-load-enable-minimum-features)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

;; (load "~/.emacs.d/auto-complete" t t)
(load "~/.emacs.d/language-c" t t)
