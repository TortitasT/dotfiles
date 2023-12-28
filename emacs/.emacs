;; Remove menu bar
(menu-bar-mode -1)

;; Remove tool bar
(tool-bar-mode -1)

;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; PACKAGES

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;(package-refresh-contents) This triggers a long load at startup


;; Quelpa
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

;; Quelpa use package
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

;; Copilot.el
(use-package copilot
  :quelpa (copilot :fetcher github
                   :repo "zerolfx/copilot.el"
                   :branch "main"
                   :files ("dist" "*.el")))
  ;; :hook
  ;; (prog-mode . copilot-mode)
  ;; (copilot-mode . (lambda ()
  ;;                   (setq-local copilot--indent-warning-printed-p t))))

(add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "C-e") 'copilot-accept-completion)

;; Evil mode
(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key lsp-ui copilot editorconfig dash s quelpa-use-package quelpa doom-themes evil)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Rainbow delimiters
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-rouge t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Font
(set-face-attribute 'default nil :family "GoMono Nerd Font" :height 200)

;; Treesitter
(setq treesit-language-source-alist
      '((php "https://github.com/tree-sitter/tree-sitter-php")
        (c "https://github.com/tree-sitter/tree-sitter-c")))
(dolist (lang treesit-language-source-alist)
  (unless (treesit-language-available-p (car lang))
    (treesit-install-language-grammar (car lang))))
