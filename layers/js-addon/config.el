(autoload 'js2-jsx-mode "js2-jsx-mode"
  "Load JS2 JSX mode on .jsx files" t)
(add-to-list 'auto-mode-alist
             '("\\.jsx\\'" . js2-jsx-mode))
