(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet" )
(require 'yasnippet)
(yas-global-mode 1)
(setq
     backup-by-copying t      ; don't clobber symlinks
        backup-directory-alist
	    '(("." . "~/.saves/"))    ; don't litter my fs tree
	       delete-old-versions t
	          kept-new-versions 6
		     kept-old-versions 2
		        version-control t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("zathura" ("zathura") ""))))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-check-signature nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (auctex magit company flycheck emmet-mode yasnippet-snippets))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;;
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent はスペース2個
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil))
 (keyboard-translate ?\C-i ?\H-i)
(define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;;
(setq latex-run-command "xelatex")
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
