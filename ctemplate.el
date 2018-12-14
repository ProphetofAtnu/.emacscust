;; This is going to be a nightmare

;; LET'S DO THIS
;; (By the way, the capture template is here:
;; https://orgmode.org/manual/Capture-templates.html


;; Task settings...

(setq org-todo-keywords '((type "TODO(t)"
                                "PROG(p)"
                                "HOLD(h)"
                                "ND(n)"
                                "|"
                                "CANNED(c)"
                                "DONE(d)")))
(setq org-todo-keyword-faces '(("TODO" . orange)
                               ("PROG" . blue)
                               ("HOLD" . yellow)
                               ("ND" . purple)
                               ("CANNED" . pink)
                               ("DONE" . green)))


(setq org-capture-templates
      '(

	("t" "Task" entry (file+olp "~/org/Notes.org" "Refile" "Tasks")
	 "* TODO %? %^G")

	("s" "Snippit" entry (file+olp "~/org/Notes.org" "Refile" "Snips")
	 "* %^{Heading}
:PROPERTIES:
:Lang: %^{Language}
:END:
#+BEGIN_SRC %\\2

#+END_SRC
	")

  ("c" "From Clipboard" entry (file+olp "~/org/Notes.org" "Refile" "Snips")
   "* %^{Heading} %T %^G
%x")
	))
