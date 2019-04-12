;; Redefined for spacemacs

;; (defun org-unison-sync ()
;;   (interactive)
;;   (call-process-shell-command "unison Org -batch -silent"))

;; (org-unison-sync)

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'org-unison-sync nil t)))

;; (setq org-directory "~/org")
;; (setq org-agenda-files (list "~/org/"))
;; (if (eq system-type 'windows-nt)
;;     (setq org-mobile-directory "/plink:cultofatnu.org:/home/jacsc/mobile")
;;   (setq org-mobile-directory "/ssh:cultofatnu.org:/home/jacsc/mobile"))


;; ; Refile on top of file max
;; (setq org-refile-use-outline-path 'file)
;; ; use a depth level of 6 max
;; (setq org-refile-targets
;;       '((org-agenda-files . (:maxlevel . 4))))

;; (setq org-outline-path-complete-in-steps nil)

;; (spacemacs/set-leader-keys-for-major-mode 'org-mode "M-RET" 'org-meta-return)

;; ;; Configure some variables
;; (setq diary-file "~/org/diary")

;; js2-mode

;; (setq-default js2-basic-offset 2
;;               js-indent-level 2
;;               js2-bounce-indent-p t)


;; Add my custom packages to the loadpath
;; (with-eval-after-load
;;     (add-to-list 'load-path "~/.emacscust/packages")
;; )

(defvar emc-custom-packages-directory "~/.emacscust/packages")

(let ((pkg (-filter (lambda (dir)
                  (not (char-equal (aref dir 0) ?.))
                  )
                (directory-files "~/.emacscust/packages")
                )
       )
      )
  (message pkg)
  )

;; C++ and C
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Make the tap width less ridiculous
(setq default-tab-width 2)


(use-package lsp)
(use-package lsp-clients)
(use-package company)
(use-package company-lsp)
(push 'company-lsp company-backends)

(add-hook 'dart-mode-hook '(lambda () (progn
                                        (lsp)
                                        (company-mode))))
