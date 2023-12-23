;; Kill the *scratch* buffer
(setq initial-scratch-message nil)
(kill-buffer "*scratch*")


;; Start Emacs in fullscreen mode
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Define desktop-restore-frames before setting it
(setq desktop-restore-frames nil)

;; Save and restore the last session
(desktop-save-mode 1)




;; using darcual theme
(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))


;;; PACKAGE LIST
(setq package-install-upgrade-built-in t)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))


(package-initialize)

;; Install essential packages
(package-install 'darcula-theme)
(package-install 'company)
(package-install 'company-irony)
(package-install 'flycheck)
(package-install 'irony)
(package-install 'yasnippet)
(package-install 'yasnippet-snippets)
(package-install 'auto-complete-c-headers)
(package-install 'format-all)
;; Don't show the splash screen
(setq inhibit-startup-message t)  ; Comment at end of line!

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)


;; set default editor font ==> cascadia code
(set-face-attribute 'default nil :font "cascadia Code 15")

;; disable menu on startup
(menu-bar-mode -1)
;; disable tools on startup
(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(format-all auto-complete-c-headers yasnippet-snippets neotree yasnippet irony flycheck company-irony company auto-auto-indent auto-complete darcula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; start auto-complete with emacs
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; company mode for emacs
(require 'company)
(require 'company-irony)

(require 'flycheck)
(require 'irony)

;; snippets for C++ in emacs
(require 'yasnippet)
(yas-global-mode 1)


;; Enable company mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Configure company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; Enable Flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Configure Irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; Enable yasnippet globally
(yas-global-mode 1)

(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; automatically open and colse () {} "" []
(electric-pair-mode 1)


;; neotree plugin
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; auto-complete-c-headers
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


;; format all
(use-package format-all
  :ensure t)

;; Python
(add-hook 'python-mode-hook #'format-all-mode)

;; C
(add-hook 'c-mode-hook #'format-all-mode)

;; C++
(add-hook 'c++-mode-hook #'format-all-mode)

;; JavaScript
(add-hook 'js2-mode-hook #'format-all-mode) ; Use js2-mode for JavaScript

;; Key bindings for quick formatting
(global-set-key (kbd "C-c f p") #'format-all-buffer) ; Format Python
(global-set-key (kbd "C-c f c") #'format-all-buffer) ; Format C
(global-set-key (kbd "C-c f C") #'format-all-buffer) ; Format C++
(global-set-key (kbd "C-c f j") #'format-all-buffer) ; Format JavaScript


