;; Configuration setup from: https://realpython.com/emacs-the-best-python-editor/

;; Add MELPA package support
;; =========================

;; Enables basic packaging support
(require 'package)

;; Add Melpa archive to list of available repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; Initialize package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;; Install packages
;; ================

;; myPackages - list of package names
(defvar myPackages
  '(better-defaults
    solarized-theme
    elpy
    flycheck
    py-autopep8
    use-package
    )
  )

;; Scan myPackages and install if not already installed
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)


;; Basic customization
;; ===================

;; (setq inhibit-startup-message t)  ;; Hide startup message
(load-theme 'solarized-dark t)          ;; Load material theme
(global-linum-mode t)             ;; Enable line numbers globally


;; Development setup
;; =================

;; Enable elpy
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Enable use-package
(require 'use-package)

;; Enable dired-sidebar
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))	     
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

