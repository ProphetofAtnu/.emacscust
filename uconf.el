;; Custom Vars
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Autocomplete config (For Company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-minimum-prefix-length 3)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
(setq company-tooltip-limit 20)
(setq company-idle-delay .1)
(setq company-echo-delay 0)

;; Helm Config Block
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


;; Org Config block
;; Org Mode capture config
(require 'org)
(setq org-default-notes-file (concat org-directory "/Notes.org"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 5)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-src-fontify-natively t
    org-src-tab-acts-natively t
    org-confirm-babel-evaluate nil
    org-edit-src-content-indentation 0)

(define-key global-map "\C-cc" 'org-capture)

(load "~/.emacs.d/cust/ctemplate.el")

(defun org-unison-sync ()
  (interactive)
  (call-process-shell-command "unison Org -batch -silent"))

(org-unison-sync)

(add-hook 'org-mode-hook
	  (lambda ()
	    (add-hook 'after-save-hook 'org-unison-sync nil t)))

;; Evil Config Block
;; Requires evil-collection, evil-org, evil-leader
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))

(evil-mode t)
(evil-leader-mode)

;; Go Config block
;; Requires go-mode, go-scratch, go-scratch
(require 'company-go)
(add-hook 'go-mode-hook
      (lambda ()
        (set (make-local-variable 'company-backends) '(company-go))
        (company-mode)))

(add-hook 'go-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'gofmt-before-save)
	    ;; Go Mode keybinds
	    (local-set-key (kbd "C-c p") 'dlv)
	    (local-set-key (kbd "M-p") 'compile)
	    (local-set-key (kbd "M-P") 'recompile)
	    (local-set-key (kbd "M-[") 'next-error)
	    (local-set-key (kbd "M-]") 'previous-error)))


;; Javascript Config block
;; Requires js2-mode, tern, and indium

;; js2-mode
(require 'js2-mode)

(custom-set-variables  
 '(js2-basic-offset 2)  
 '(js2-bounce-indent-p t)  
)
;; Add as a major mode for .js files:
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Hook to shell scripts
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; tern + company-tern
;;(require 'tern)
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda ()
			  (setq-local indent-tabs-mode nil)
			  (setq-local tab-width 2)
			  (tern-mode t)))

(require 'company-tern)
(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))

;; Company shell
(add-to-list 'company-backends 'company-shell)

;; God help me, [C/++] mode config
;; Irony
(add-hook 'c++-mode-hook 'irony-mode)
;; Not gonna write these, but figured I might as well include them anyway.
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
