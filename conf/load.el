(use-package
  elisp-format
  :init (spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "m=" "format")
  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode
    "==" 'elisp-format-buffer
    "=f" 'elisp-format-file
    "=d" 'elisp-format-directory))


(use-package dap-mode
  :init
  (use-package dap-node)
  (use-package dap-go)
)

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode)
  ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
  ;; line below instead:
  ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
  :ensure t)
(defun my-eshell-remove-pcomplete ()
  (remove-hook 'completion-at-point-functions #'pcomplete-completions-at-point t))

;;  ESHELL FIX
(add-hook 'eshell-mode-hook #'my-eshell-remove-pcomplete)
