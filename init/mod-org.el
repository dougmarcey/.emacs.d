;; Ex-commands
(evil-ex-define-cmd "gtd" 'open-gtd)
(evil-ex-define-cmd "notes" 'open-notes)

;; Defuns
(defun my/org-insert-list-item ()
  "Force insertion of org item"
  (interactive)
  (if (not (org-in-item-p))
      (insert "\n- ")
    (org-insert-item)))

(defun my/org-eol-call (fun)
  "Go to end of line and call provided function"
  (end-of-line)
  (funcall fun)
  (evil-append nil))

;;
(use-package org :ensure t
  :mode ("\\.org\\'" . org-mode)
  :init
  (progn
    (setq org-directory "~/Dropbox/notes")
    (setq org-default-notes-file (concat org-directory "/notes.org"))
    (setq org-archive-location "~/Dropbox/notes/archives.org")
    (setq org-agenda-files '("~/Dropbox/notes/gtd.org"
                             "~/Dropbox/notes/notes.org"
                             "~/Dropbox/notes/blog.org"
                             "~/Dropbox/notes/invoices.org"
                             "~/Dropbox/notes/journal.org"
                             "~/Dropbox/notes/vocab.org"
                             "~/Dropbox/notes/excerpts.org"))

    (setq org-completion-use-ido t)
    (setq org-hide-leading-stars t)
    (setq org-export-backends '(ascii html latex md))
    (setq org-todo-keywords
          '((sequence "TODO" "DOING" "VERIFY" "WAITING" "|" "DONE" "DELEGATED" "CANCELLED")))

    (setq org-tag-alist '(("@work" . ?b)
                          ("@home" . ?h)
                          ("@writing" . ?w)
                          ("@errands" . ?e)
                          ("@drawing" . ?d)
                          ("@coding" . ?c)
                          ("@phone" . ?p)
                          ("@reading" . ?r)
                          ("@computer" . ?l)
                          ("projects" . ?q)
                          ("lowenergy" . ?0)
                          ("highenergy" . ?1)))

    (setq org-capture-templates
          '(("t" "TODO" entry (file+headline (concat org-directory "/gtd.org") "Inbox") "* TODO %? %u")
            ("T" "TODO Someday" entry (file+headline (concat org-directory "/gtd.org") "Someday") "* TODO %? %u :someday:")
            ("i" "Invoice" entry (file+headline (concat org-directory "/invoices.org") "Invoices") "** TODO %?")
            ("n" "Note" entry (file+datetree (concat org-directory "/notes.org")) "** %?")
            ("b" "Blog" entry (file+datetree (concat org-directory "/blog.org")) "** %?")
            ("j" "Journal" entry (file+datetree (concat org-directory "/journal.org")) "** %?%^g\n%?\nAdded: %U")
            ("v" "Vocab" entry (file (concat org-directory "/vocab.org")) "* %?")
            ("e" "Excerpt" entry (file (concat org-directory "/excerpts.org")) "* %?")
            ))

    (setq org-agenda-custom-commands
          '(("x" agenda)
            ("y" agenda*)
            ("w" todo "WAITING")
            ("W" todo-tree "WAITING")
            ("tp" tags "+Projects")
            ("tg" tags-todo "+gamedev")
            ("tw" tags-tree "+webdev")
            ("f" occur-tree "\\<FIXME\\>")
            ("h" . "HOME+Name tags searches") ; description for "h" prefix
            ("hl" tags "+home+Lisa")
            ("hp" tags "+home+Peter")
            ("hk" tags "+home+Kim")))

    (define-minor-mode evil-org-mode
      "Buffer local minor mode for evil-org"
      :init-value nil
      :lighter " EvilOrg"
      :keymap (make-sparse-keymap) ; defines evil-org-mode-map
      :group 'evil-org)

    ;; Keymaps
    ;; (emap org-agenda-mode-map
    ;;       ...)

    (imap evil-org-mode-map
          (kbd "<s-return>") 'org-insert-heading-after-current)

    (vmap evil-org-mode-map
          ",l" 'org-insert-link
          )

    (nmap evil-org-mode-map
          ",l" 'org-insert-link
          ",s" 'org-schedule
          ",a" 'org-attach
          ",A" 'org-agenda
          ",t" 'org-todo
          ",T" 'org-show-todo-tree
          ",\\" 'org-match-sparse-tree
          ",+" 'org-align-all-tags
          "gh" 'outline-up-heading
          "gj" (if (fboundp 'org-forward-same-level) ;to be backward compatible with older org version
                   'org-forward-same-level
                 'org-forward-heading-same-level)
          "gk" (if (fboundp 'org-backward-same-level)
                   'org-backward-same-level
                 'org-backward-heading-same-level)
          "gl" 'outline-next-visible-heading
          "go" 'org-open-at-point
          "gr" 'org-refile
          "H" 'org-beginning-of-line
          "L" 'org-end-of-line
          "$" 'org-end-of-line
          "^" 'org-beginning-of-line
          "<" 'org-metaleft
          ">" 'org-metaright
          "-" 'org-cycle-list-bullet
          (kbd "RET") (lambda() (interactive) (org-insert-heading-after-current) (evil-insert-state))
          (kbd "SPC") 'org-todo
          (kbd "M-SPC") (lambda() (interactive) (org-todo "DONE"))
          (kbd "TAB") 'org-cycle
          )

    ;; normal & insert state shortcuts.
    (mapc (lambda (state)
            (evil-define-key state evil-org-mode-map
              (kbd "M--") 'my/org-insert-list-item
              (kbd "M-l") 'org-metaright
              (kbd "M-h") 'org-metaleft
              (kbd "M-k") 'org-metaup
              (kbd "M-j") 'org-metadown
              (kbd "M-L") 'org-shiftmetaright
              (kbd "M-H") 'org-shiftmetaleft
              (kbd "M-K") 'org-shiftmetaup
              (kbd "M-J") 'org-shiftmetadown
              (kbd "M-o") '(lambda () (interactive)
                             (my/org-eol-call
                              '(lambda()
                                 (org-insert-heading)
                                 (org-metaright))))
              (kbd "M-t") '(lambda () (interactive)
                             (my/org-eol-call
                              '(lambda()
                                 (org-insert-todo-heading nil)
                                 (org-metaright))))
              ))
          '(normal insert))

    ;; Make sure certain keybindings work
    (add-hook 'org-mode-hook (lambda() (evil-mode nil) (evil-mode 1)))

    (add-hook 'org-mode-hook 'evil-org-mode)
    (add-hook 'org-mode-hook 'flyspell-mode)
    (add-hook 'org-mode-hook 'my/enable-hard-wrap))
)

;;
(provide 'mod-org)