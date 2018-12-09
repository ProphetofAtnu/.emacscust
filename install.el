(setq cust-package-list '(
			  restclient
			  inf-mongo
			  js3-mode
			  restart-emacs
			  json-mode
			  mongo
			  nodejs-repl
			  powershell
			  realgud
			  company-irony
			  irony
			  go-dlv
			  company-shell
			  magit
			  git
			  company-tern
			  company-go
			  company
			  tern-auto-complete
			  tern
			  js2-mode
			  go-scratch
			  evil-leader
			  evil-org
			  evil-collection
			  dracula-theme
			  auto-complete
			  go-mode
			  fzf))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package cust-package-list)
  (unless (package-installed-p package)
    (package-install package)))
