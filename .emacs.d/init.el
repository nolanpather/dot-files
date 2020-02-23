(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(setq my-packages
      '(exec-path-from-shell
	magit
	projectile
	zenburn-theme))

(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "C-x g") 'magit-status)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-switch-project-action 'projectile-dired)

(load-theme 'zenburn t)
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-16"))

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
