(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;(package-refresh-contents)

(setq my-packages
      '(atom-one-dark-theme
	evil
	evil-magit
	magit
	neotree
	undo-tree))

(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Enable atom-one-dark-theme
(load-theme 'atom-one-dark t)

;; Enable evil
(require 'evil)
(evil-define-key nil evil-insert-state-map (kbd "jk") 'evil-normal-state)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(evil-mode 1)

;; Enable evil-magit
(require 'evil-magit)

;; Enable ido-ubiquitous-mode
(require 'ido)
(require 'ido-completing-read+)
(ido-mode t)
(setq ido-everywhere t)
(ido-ubiquitous-mode t)

;; Enable neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Enable undo-tree
(global-undo-tree-mode)

;; Include Custom Modules
(add-to-list 'load-path "~/.emacs.d/modules/")

(require 'np-fonts-fira-code)

;; ---------------------------------------------------------------------
;; the following is generated code - do not add anything past this point
;; ---------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (atom-one-dark-theme evil evil-magit magit neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
