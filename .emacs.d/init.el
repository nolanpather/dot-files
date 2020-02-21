(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load-theme 'zenburn t)
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-16"))

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; change the current directory when you switch between projects
;; this allows you to switch between files in the project without having
;; to change the working directory manually
(setq projectile-switch-project-action 'projectile-dired)

(global-set-key (kbd "C-x g") 'magit-status)

;; Eensure environment variables inside Emacs look the same as in the user's shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell magit projectile zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
