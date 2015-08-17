(setq package-archives
      '(
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("elpa" . "http://tromey.com/elpa/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ))
(package-initialize) ;; init elpa packages

;;uncomment to debug on
;;(setq debug-on-error t)

;;full screen
(set-frame-parameter nil 'fullscreen 'fullboth)

;;For starting-up without the startup message
(setq inhibit-startup-message t)

;;Disable menu bar
(menu-bar-mode -1)

;;Disable tool bar
(tool-bar-mode -1)

;;Disable scroll bar
(scroll-bar-mode -1)

;;Map yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;rid of bell
(setq visible-bell t)

;;delete selection mode
(delete-selection-mode 1)

;;show matching parens
(show-paren-mode t)

;;keep all backup files at one place
(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/backups")))

;;deletes trailing whitespaces before closing buffer
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;;apply theme
(load-file  "~/.emacs.d/elpa/zenburn-0.1/zenburn.el")
(zenburn)

;;Enable ido mode
(ido-mode 1)

;;Enable flex matching for ido-mode
(setq ido-enable-flex-matching t)

;;For auto-complete mode
(require 'auto-complete)
(global-auto-complete-mode t)

;;YASnippets
;;Loading YAsnippet
(add-to-list 'load-path
	     "~/.emacs.d/elpa/yasnippet-0.8.0")

(require 'yasnippet) ;; not yasnippet-bundle
(yas--initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets")

;;Magit setup
(add-to-list 'load-path "~/.emacs.d/elpa/magit-20141025.429")
(require 'magit)

;;keybinding for magit entry point(magit-status)
;; more later as start getting familiar
(global-set-key (kbd "C-x g") 'magit-status)

;;keybinding for compile command
(global-set-key (kbd "C-x c") 'compile)

;;Setting emacs path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;;setting up cider
(add-to-list 'load-path "~/.emacs.d/elpa/cider-20141116.1221")
(require 'cider)

;; Setting up web-mode
(add-to-list 'load-path "~/.emacs.d/elpa/web-mode")
(require 'web-mode)
(setq web-mode-markup-indent-offset 2)

;; Splitting pop-up vertically
(setq split-width-threshold 0)

;;Appending auto-mode-alist with other extensions
(setq auto-mode-alist
      (append
       ;;different file extensions append here
       '(("\\.php\\'" . php-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode)
	 ("\\.kv\\'". python-mode)
	 ("\\.html?\\'" . web-mode))
       auto-mode-alist))
