;; Redefined for spacemacs

(defun org-unison-sync ()
  (interactive)
  (call-process-shell-command "unison Org -batch -silent"))

(org-unison-sync)

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'org-unison-sync nil t)))

(setq org-directory "~/org")
(setq org-agenda-files (list "~/org/"))
(if (eq system-type 'windows-nt)
    (setq org-mobile-directory "/plink:cultofatnu.org:/home/jacsc/mobile")
  (setq org-mobile-directory "/ssh:cultofatnu.org:/home/jacsc/mobile"))


; Refile on top of file max
(setq org-refile-use-outline-path 'file)
; use a depth level of 6 max
(setq org-refile-targets
      '((org-agenda-files . (:maxlevel . 4))))

(setq org-outline-path-complete-in-steps nil)

(spacemacs/set-leader-keys-for-major-mode 'org-mode "M-RET" 'org-meta-return)

;; Configure some variables
(setq diary-file "~/org/diary")

;; js2-mode

(setq-default js2-basic-offset 2
              js-indent-level 2
              js2-bounce-indent-p t)

;; C++ and C
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
