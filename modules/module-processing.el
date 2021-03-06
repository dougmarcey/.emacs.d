;;; module-processing.el

(use-package processing-mode
  :when IS-MAC
  :commands (processing-mode processing-find-sketch)
  :mode "\\.pde$"
  :init (add-hook 'processing-compilation-mode-hook 'doom-hide-mode-line-mode)
  :config
  (def-builder! processing-mode processing-sketch-build)
  (def-popup! "*processing-compilation*" :align below :size 10 :noselect t)
  (setq processing-location "/usr/local/bin/processing-java"
        processing-application-dir "/Applications/Processing.app"
        processing-sketchbook-dir "~/Dropbox/work/pde"
        processing-output-dir "/tmp")

  (map! :map processing-mode-map
        :nv "M-r" 'processing-sketch-run
        :m "gd" 'processing-find-in-reference
        :m "gF" 'processing-find-sketch
        (:localleader
          "e" 'processing-export-application
          "h" 'processing-open-reference
          "e" 'processing-open-examples
          "o" 'processing-open-sketchbook))

  (after! quickrun
    (quickrun-add-command
     "processing" `((:command . ,processing-location)
                    (:exec . (lambda () (format "--sketch=%s --output=%s --force --run"
                                           (doom/project-root) processing-output-dir)))
                    (:description . "Run Processing sketch"))
     :mode 'processing-mode))

  (add-hook! processing-mode
    (setq-local company-backends '((company-keywords
                                    :with
                                    company-yasnippet
                                    company-dabbrev-code)))
    (make-local-variable 'company-keywords-alist)
    (add-to-list 'company-keywords-alist
                 (cons 'processing-mode (append processing-functions
                                                processing-builtins
                                                processing-constants)))))

(provide 'module-processing)
;;; module-processing.el ends here
