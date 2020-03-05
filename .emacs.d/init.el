(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(setq my-packages
      '(add-node-modules-path
	company
	counsel-projectile
	exec-path-from-shell
	flycheck
	magit
        markdown-mode
	neotree
	nyan-mode
	projectile
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

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; nyan-mode
(require 'nyan-mode)
(nyan-mode)

;; projectile
(require 'projectile)
(require 'counsel-projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(projectile-mode +1)
(counsel-projectile-mode +1)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-s") 'swiper)

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
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "yarn eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

(add-hook 'after-save-hook
	  (lambda() (when (string-match "tsx?$" (file-name-extension buffer-file-name)) (eslint-fix-file-and-revert))))

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
