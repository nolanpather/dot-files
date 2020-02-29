(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(setq my-packages
      '(add-node-modules-path
	exec-path-from-shell
	flycheck
	helm
	helm-ls-git
	magit
        markdown-mode
	solarized-theme
	tide
	web-mode))

(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; add-node-modules-path
;; this package is required to find the eslint executable in local installations of node_modules
(eval-after-load 'typescript-mode '(add-hook 'typescript-mode-hook #'add-node-modules-path))
(eval-after-load 'web-mode '(add-hook 'web-mode-hook #'add-node-modules-path))

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(javascript-jshint))

;; helm
(require 'helm-config)
(require 'helm-ls-git)
(helm-mode 1)

(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-c h") 'helm-command-prefix)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x r p") 'helm-projects-history)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; solarized-theme
(load-theme 'solarized-dark t)
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-16"))

;; tide
(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(flycheck-add-next-checker 'typescript-tide 'javascript-eslint)
(flycheck-add-next-checker 'tsx-tide 'javascript-eslint)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; ---------------------------------------------------------------------
;; the following is generated code - do not add anything past this point
;; ---------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell magit projectile tide zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
