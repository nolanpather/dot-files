(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(setq my-packages
      '(exec-path-from-shell
	flycheck
	magit
	projectile
	web-mode
	zenburn-theme))

(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(add-hook 'after-init-hook #'global-flycheck-mode)

(global-set-key (kbd "C-x g") 'magit-status)

(projectile-mode +1)
(add-to-list 'projectile-globally-ignored-directories ".cache")
(add-to-list 'projectile-globally-ignored-directories "coverage")
(add-to-list 'projectile-globally-ignored-directories "dist")
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-switch-project-action 'projectile-dired)

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")
				     ("tsx" . "\\.ts[x]?\\'")))

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
    (flycheck exec-path-from-shell magit projectile zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
