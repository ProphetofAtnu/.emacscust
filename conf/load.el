(use-package
  elisp-format
  :init (spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "m=" "format")
  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode
    "==" 'elisp-format-buffer
    "=f" 'elisp-format-file
    "=d" 'elisp-format-directory))
