;; NARF One Dark (inspired by Atom)
;; By Henrik Lissner <http://github.com/hlissner/emacs.d>

(deftheme narf-one "A dark theme for narfy emacs, inspired by Molokai")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let* ((c '((class color)))

       ;; Global bold flag
       (bold           t)

       (bg             "#262c34")
       (bg-d           "#1f252b")
       (bg-l           "#2b323a")
       (fg             "#d5dae0")
       (subtle         "#aab6c7")
       (vsubtle        "#556172")
       (vvsubtle       "#354152")
       (dim-highlight  "#3f4b56")

       (black          "#141a22")
       (white          "#FFFFFF")
       (grey-l         "#C0C5CF")
       (grey           "#586470")
       (grey-d         "#3F3F48")
       (grey-dd        "#20272e")
       (yellow         "#E2C770")
       (yellow-d       "#9d8464")
       (orange         "#E69055")
       (red            "#ff665c")
       (magenta        "#DC79DC")
       (violet         "#9C91E4")
       (violet-d       "#7C71C4")
       (cyan           "#00b8c3")
       (cyan-d         "#8FA1B3")
       (blue-l         "#40D3FF")
       (blue           "#00B3EF")
       (blue-d         "#00437F")
       (green          "#7bc275")
       (green-d        "#86B20E")

       (search-bg      green)
       (search-fg      black)
       (search-rest-bg violet)
       (search-rest-fg black)
       (highlight      blue)
       (vertical-bar   black)
       (current-line   bg-d)
       (selection      blue-d)
       (builtin        magenta)
       (comments       grey)
       (comments-l     "#7F7F8A")
       (constants      green)
       (delimiters     violet)
       (functions      blue-l)
       (keywords       blue)
       (methods        cyan-d)
       (operators      magenta)
       (type           yellow)
       (strings        green)
       (variables      cyan)

       (error-highlight red)

       (linum-bg       bg-d)
       (linum-fg       "#465263")
       (linum-hl-fg    blue)
       (linum-hl-bg    bg-d)

       (active-minibuffer grey-d)
       (modeline-fg    white)
       (modeline-fg-2  blue-l)
       (modeline-fg-3  blue)
       (modeline-bg    bg-d)
       (modeline-bg-hl bg-d)
       (modeline-fg-inactive grey)
       (modeline-bg-inactive grey-dd)

       (vc-modified    yellow-d)
       (vc-added       green)
       (vc-deleted     red))

  (custom-theme-set-faces
   'narf-one

   ;; Text
   `(default                         ((,c (:foreground ,fg :background ,bg-d))))
   `(narf-default                    ((,c (:inherit default :background ,bg))))
   `(fringe                          ((,c (:inherit narf-default :foreground ,comments))))
   ;; `(narf-fringe                     ((,c (:inherit fringe :background ,bg))))
   `(cursor                          ((,c (:background ,white))))
   `(hl-line                         ((,c (:background ,current-line))))
   `(region                          ((,c (:background ,selection :foreground ,white))))
   `(highlight                       ((,c (:foreground ,yellow :inverse-video t))))
   `(shadow                          ((,c (:foreground ,cyan))))
   ;; `(secondary-selection          ((,c (:background ,orange))))
   ;; `(lazy-highlight               ((,c (:background ,orange))))
   ;; `(match                        ((,c (:background ,magenta))))
   `(minibuffer-prompt               ((,c (:foreground ,blue))))

   `(error                           ((,c (:foreground ,red   ))))
   `(warning                         ((,c (:foreground ,yellow))))
   `(success                         ((,c (:foreground ,green ))))

   `(flycheck-error                  ((,c (:underline (:style wave :color ,red)    :background ,grey-d))))
   `(flycheck-warning                ((,c (:underline (:style wave :color ,yellow) :background ,grey-d))))
   `(flycheck-info                   ((,c (:underline (:style wave :color ,green)  :background ,grey-d))))
   `(flyspell-incorrect              ((,c (:underline (:style wave :color ,error-highlight)
                                           :inherit unspecified))))

   `(hs-face                         ((,c (:foreground ,comments :background ,black))))
   `(hs-fringe-face                  ((,c (:foreground ,blue))))

   `(font-lock-builtin-face          ((,c (:foreground ,builtin))))
   `(font-lock-comment-face          ((,c (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((,c (:foreground ,comments))))
   `(font-lock-doc-face              ((,c (:foreground ,comments-l))))
   `(font-lock-doc-string-face       ((,c (:foreground ,comments-l))))
   `(font-lock-constant-face         ((,c (:foreground ,constants))))
   `(font-lock-function-name-face    ((,c (:foreground ,functions))))
   `(font-lock-keyword-face          ((,c (:foreground ,keywords))))
   `(font-lock-string-face           ((,c (:foreground ,strings))))
   `(font-lock-type-face             ((,c (:foreground ,type))))
   `(font-lock-variable-name-face    ((,c (:foreground ,variables))))
   `(font-lock-warning-face          ((,c (:foreground ,red))))
   `(font-lock-negation-char-face          ((,c (:foreground ,operators :bold t))))
   `(font-lock-preprocessor-char-face      ((,c (:foreground ,operators :bold t))))
   `(font-lock-regexp-grouping-backslash   ((,c (:foreground ,operators :bold t))))
   `(font-lock-regexp-grouping-construct   ((,c (:foreground ,operators :bold t))))

   `(bold                           ((,c (:weight bold  :foreground ,white))))
   `(italic                         ((,c (:slant italic :foreground ,subtle))))
   `(bold-italic                    ((,c (:weight bold  :slant italic :foreground ,white))))

   `(trailing-whitespace            ((,c (:background "#884444"))))
   `(whitespace-tab                 ((,c (:foreground ,grey-d))))
   `(whitespace-newline             ((,c (:foreground ,grey-d))))
   `(whitespace-trailing            ((,c (:background ,grey-d))))

   `(vertical-border                ((,c (:foreground ,vertical-bar :background ,vertical-bar))))

   `(linum                          ((,c (:foreground ,linum-fg :background ,bg-d :bold nil))))
   `(narf-linum                     ((,c (:inherit linum :background ,bg))))
   `(linum-highlight-face           ((,c (:inherit linum :foreground ,linum-hl-fg :background ,current-line))))
   `(show-paren-match               ((,c (:foreground ,magenta :inverse-video t))))

   ;; Modeline
   `(narf-minibuffer-active         ((,c (:background ,bg))))
   `(mode-line                      ((,c (:foreground ,modeline-fg          :background ,modeline-bg))))
   `(mode-line-inactive             ((,c (:foreground ,modeline-fg-inactive :background ,modeline-bg-inactive))))

   `(mode-line-is-modified          ((,c (:foreground ,red :bold t))))
   `(mode-line-buffer-file          ((,c (:foreground ,modeline-fg :bold t))))
   `(mode-line-buffer-path          ((,c (:foreground ,modeline-fg-2))))
   `(mode-line-count-face           ((,c (:foreground ,black :background ,blue))))

   `(spaceline-flycheck-error       ((,c (:underline nil :foreground ,black :background ,red))))
   `(spaceline-flycheck-warning     ((,c (:underline nil :foreground ,black :background ,yellow))))
   `(spaceline-flycheck-info        ((,c (:underline nil :foreground ,black :background ,green))))
   `(spaceline-highlight-face       ((,c (:foreground ,black :background ,yellow))))
   `(powerline-active1              ((,c (:foreground ,modeline-fg-2 :background ,modeline-bg))))
   `(powerline-active2              ((,c (:foreground ,modeline-fg-3 :background ,modeline-bg))))
   `(powerline-inactive1            ((,c (:foreground ,modeline-fg-inactive :background ,modeline-bg-inactive))))
   `(powerline-inactive2            ((,c (:foreground ,modeline-fg-inactive :background ,modeline-bg-inactive))))

   ;; Search
   `(isearch                        ((,c (:foreground ,search-fg :background ,search-bg))))
   `(isearch-lazy-highlight-face    ((,c (:foreground ,search-rest-fg :background ,search-rest-bg))))

   `(narf-todo-face                 ((,c (:foreground ,yellow))))
   `(narf-fixme-face                ((,c (:foreground ,red))))
   `(narf-note-face                 ((,c (:foreground ,cyan))))

   `(evil-ex-substitute-replacement ((,c (:foreground ,magenta :background ,black :bold ,bold))))
   `(evil-search-highlight-persist-highlight-face ((,c (:background ,search-rest-bg))))

   ;; plugin-specific
   ;; *****************************************************************************************

   `(indent-guide-face ((,c (:foreground "#2F2F38"))))

   ;; highlight-{quoted,numbers,indentation}-mode
   `(highlight-indentation-face                 ((,c (:background "#222830"))))
   `(highlight-indentation-current-column-face  ((,c (:background "#222830"))))
   `(highlight-quoted-symbol     ((,c (:foreground ,type))))
   `(highlight-quoted-quote      ((,c (:foreground ,operators))))
   `(highlight-numbers-number    ((,c (:foreground ,constants))))

   ;; re-builder
   `(reb-match-0                 ((,c (:foreground ,orange   :inverse-video t))))
   `(reb-match-1                 ((,c (:foreground ,magenta  :inverse-video t))))
   `(reb-match-2                 ((,c (:foreground ,green    :inverse-video t))))
   `(reb-match-3                 ((,c (:foreground ,yellow   :inverse-video t))))

   ;; workgroups2
   `(wg-current-workgroup-face   ((,c (:foreground ,black :background ,orange))))
   `(wg-other-workgroup-face     ((,c (:foreground ,grey  :background ,current-line))))

   ;; neotree
   `(neo-root-dir-face           ((,c (:foreground ,green))))
   `(neo-file-link-face          ((,c (:foreground ,fg))))
   `(neo-dir-link-face           ((,c (:foreground ,blue))))
   `(neo-expand-btn-face         ((,c (:foreground ,blue))))

   ;; company-mode
   `(tooltip                     ((,c (:background ,black :foreground ,fg))))

   `(company-tooltip             ((,c (:inherit tooltip))))
   `(company-tooltip-common      ((,c (:foreground ,blue))))
   `(company-tooltip-search      ((,c (:foreground ,search-fg :background ,highlight))))
   `(company-tooltip-selection   ((,c (:background ,selection))))
   `(company-tooltip-mouse       ((,c (:background ,magenta :foreground ,bg))))
   `(company-tooltip-annotation  ((,c (:foreground ,violet))))
   `(company-scrollbar-bg        ((,c (:background ,black))))
   `(company-scrollbar-fg        ((,c (:background ,blue))))
   `(company-preview             ((,c (:foreground ,blue))))
   `(company-preview-common      ((,c (:foreground ,magenta :background ,grey-d))))
   `(company-preview-search      ((,c (:inherit company-tooltip-search))))

   `(popup                       ((,c (:inherit tooltip))))
   `(popup-tip-face              ((,c (:inherit tooltip))))

   ;; evil-snipe
   `(evil-snipe-first-match-face ((,c (:foreground ,search-fg :background ,search-bg))))
   `(evil-snipe-matches-face     ((,c (:foreground ,search-bg :underline t))))

   ;; Volatile highlights
   `(vhl/default-face            ((,c (:background ,grey-d))))

   ;; VCS
   `(diff-hl-change              ((,c (:foreground ,vc-modified))))
   `(diff-hl-delete              ((,c (:foreground ,vc-deleted))))
   `(diff-hl-insert              ((,c (:foreground ,vc-added))))
   `(git-gutter:modified         ((,c (:foreground ,vc-modified))))
   `(git-gutter:added            ((,c (:foreground ,vc-added))))
   `(git-gutter:deleted          ((,c (:foreground ,vc-deleted))))
   `(git-gutter+-modified        ((,c (:foreground ,vc-modified :background nil))))
   `(git-gutter+-added           ((,c (:foreground ,vc-added :background nil))))
   `(git-gutter+-deleted         ((,c (:foreground ,vc-deleted :background nil))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face   ((,c (:foreground ,blue))))
   `(rainbow-delimiters-depth-2-face   ((,c (:foreground ,magenta))))
   `(rainbow-delimiters-depth-3-face   ((,c (:foreground ,green))))
   `(rainbow-delimiters-depth-4-face   ((,c (:foreground ,orange))))
   `(rainbow-delimiters-depth-5-face   ((,c (:foreground ,orange))))
   `(rainbow-delimiters-unmatched-face ((,c (:foreground ,red :inverse-video t))))

   ;; Helm
   `(helm-selection              ((,c (:background ,selection :foreground ,fg))))
   `(helm-match                  ((,c (:foreground ,magenta :bold t))))
   `(helm-source-header          ((,c (:background ,current-line :foreground ,grey))))
   `(helm-swoop-target-line-face ((,c (:foreground ,highlight :inverse-video t))))

   `(helm-ff-file              ((,c (:foreground ,fg))))
   `(helm-ff-prefix            ((,c (:foreground ,magenta))))
   `(helm-ff-dotted-directory  ((,c (:foreground ,grey-d))))
   `(helm-ff-directory         ((,c (:foreground ,orange))))
   `(helm-ff-executable        ((,c (:foreground ,white :slant italic))))

   ;; Avy
   `(avy-lead-face-0    ((,c (:background ,highlight :foreground ,black))))
   `(avy-lead-face-1    ((,c (:background ,highlight :foreground ,black))))
   `(avy-lead-face-2    ((,c (:background ,highlight :foreground ,black))))
   `(avy-lead-face      ((,c (:background ,highlight :foreground ,black))))

   ;; lang-specific
   ;; *****************************************************************************************
   ;; (css|scss)-mode
   `(css-proprietary-property ((,c (:foreground ,keywords))))

   ;; js2-mode
   `(js2-function-param  ((,c (:foreground ,variables))))
   `(js2-function-call   ((,c (:foreground ,functions))))
   `(js2-object-property ((,c (:foreground ,methods))))
   `(js2-jsdoc-tag       ((,c (:foreground ,comments))))

   ;; web-mode
   `(web-mode-doctype-face           ((,c (:foreground ,comments))))
   `(web-mode-html-tag-face          ((,c (:foreground ,methods))))
   `(web-mode-html-tag-bracket-face  ((,c (:foreground ,methods))))
   `(web-mode-html-attr-name-face    ((,c (:foreground ,type))))
   `(web-mode-html-entity-face       ((,c (:foreground ,cyan :italic t))))
   `(web-mode-block-control-face     ((,c (:foreground ,orange))))
   ;; `(web-mode-html-tag-bracket-face  ((,c (:foreground ,operators))))

   ;; markdown-mode
   `(markdown-header-face           ((,c (:foreground ,blue :bold t))))
   `(markdown-header-delimiter-face ((,c (:inherit markdown-header-face))))
   `(markdown-blockquote-face ((,c (:foreground ,violet))))
   `(markdown-markup-face     ((,c (:foreground ,operators))))
   `(markdown-pre-face        ((,c (:inherit markdown-markup-face))))
   `(markdown-inline-face     ((,c (:foreground ,cyan))))
   `(markdown-list-face       ((,c (:foreground ,magenta))))
   `(markdown-link-face       ((,c (:foreground ,yellow :bold nil))))
   `(markdown-url-face        ((,c (:foreground ,green :bold nil))))

   `(markdown-header-face-1 ((,c (:inherit markdown-header-face))))
   `(markdown-header-face-2 ((,c (:inherit markdown-header-face))))
   `(markdown-header-face-3 ((,c (:inherit markdown-header-face))))
   `(markdown-header-face-4 ((,c (:inherit markdown-header-face))))
   `(markdown-header-face-5 ((,c (:inherit markdown-header-face))))
   `(markdown-header-face-6 ((,c (:inherit markdown-header-face))))
   ;; `(markdown-header-rule-face       (:inherit shadow))
   ;; `(markdown-italic-face            (:inherit italic))
   ;; `(markdown-link-face              (:inherit shadow))
   ;; `(markdown-link-title-face        (:inherit link))
   ;; `(markdown-url-face               (:inherit link))

   ;; org-mode
   `(variable-pitch  ((,c (:font "Proxima Nova"))))
   `(fixed-pitch     ((,c (:font "DejaVu Sans Mono" :height 1.0))))
   `(org-tag         ((,c (:foreground ,yellow :bold nil))))
   ;; `(org-ellipsis    ((,c (:inherit hs-face))))

   `(org-hide        ((,c (:foreground ,bg))))

   `(org-table                  ((,c (:foreground ,cyan))))
   `(org-quote                  ((,c (:slant italic :foreground ,grey :background ,current-line))))
   `(org-document-info          ((,c (:foreground ,orange))))
   `(org-document-info-keyword  ((,c (:foreground ,grey-d))))
   `(org-meta-line              ((,c (:foreground ,vsubtle))))
   `(org-block-begin-line       ((,c (:background ,current-line :foreground ,vsubtle))))
   `(org-block-end-line         ((,c (:inherit org-block-begin-line))))
   `(org-block-background       ((,c (:background ,current-line))))
   `(org-archived               ((,c (:foreground ,grey))))

   `(org-document-title   ((,c (:foreground ,cyan))))
   `(org-level-1          ((,c (:background ,current-line :foreground ,magenta   :bold ,bold))))
   `(org-level-2          ((,c (                          :foreground ,cyan-d :bold ,bold))))
   `(org-level-3          ((,c (                          :foreground ,violet    :bold ,bold))))
   `(org-level-4          ((,c (                          :foreground ,green     :bold ,bold))))
   `(org-level-5          ((,c (                          :foreground ,yellow))))
   `(org-level-6          ((,c (                          :foreground ,blue))))

   `(org-code             ((,c (:foreground ,orange))))
   `(org-verbatim         ((,c (:foreground ,green))))
   `(org-formula          ((,c (:foreground ,cyan))))
   `(org-list-dt          ((,c (:foreground ,cyan))))
   `(org-footnote         ((,c (:foreground ,orange))))

   `(org-link             ((,c (:underline t :foreground ,cyan :bold inherit))))
   `(org-date             ((,c (:foreground ,violet))))
   `(org-todo             ((,c (:foreground ,yellow :bold inherit))))
   `(org-done             ((,c (:foreground ,green :bold inherit))))
   `(org-headline-done    ((,c (:foreground ,grey :strike-through t :bold nil))))
   `(org-special-keyword  ((,c (:foreground ,magenta))))
   `(org-checkbox-statistics-todo ((,c (:inherit org-todo))))
   `(org-checkbox-statistics-done ((,c (:inherit org-done))))

   ;; NARF custom org faces
   `(org-headline-todo    ((,c (:bold nil))))
   `(org-block            ((,c (:background ,current-line))))
   `(org-block-background ((,c (:background ,current-line))))
   `(org-todo-high        ((,c (:foreground ,orange :bold inherit))))
   `(org-todo-vhigh       ((,c (:foreground ,magenta :bold inherit))))
   `(org-list-bullet      ((,c (:foreground ,orange :bold ,bold))))
   `(org-whitespace       ((,c (:inherit fixed-pitch))))
   `(org-todo-checkbox    ((,c (:inherit variable-pitch))))
   )

;; *****************************************************************************************

  (after! vc-annotate
    (require 'dash)

    ;; Color helper functions
    ;; Shamelessly *borrowed* from solarized
    (defun --color-name-to-rgb (color &optional frame)
      (let ((valmax (float (car (color-values "#ffffff")))))
        (mapcar (lambda (x) (/ x valmax)) (color-values color frame))))

    (defun --color-rgb-to-hex  (red green blue)
      (format "#%02x%02x%02x"
              (* red 255) (* green 255) (* blue 255)))

    (defun --color-blend (color1 color2 alpha)
      (apply '--color-rgb-to-hex
             (-zip-with '(lambda (it other)
                           (+ (* alpha it) (* other (- 1 alpha))))
                        (--color-name-to-rgb color1)
                        (--color-name-to-rgb color2))))

    (custom-theme-set-variables
     'narf-one
     `(vc-annotate-color-map
       '((20 .  ,green)
         (40 .  ,(--color-blend yellow green (/ 1.0 3)))
         (60 .  ,(--color-blend yellow green (/ 2.0 3)))
         (80 .  ,yellow)
         (100 . ,(--color-blend orange yellow (/ 1.0 3)))
         (120 . ,(--color-blend orange yellow (/ 2.0 3)))
         (140 . ,orange)
         (160 . ,(--color-blend magenta orange (/ 1.0 3)))
         (180 . ,(--color-blend magenta orange (/ 2.0 3)))
         (200 . ,magenta)
         (220 . ,(--color-blend red magenta (/ 1.0 3)))
         (240 . ,(--color-blend red magenta (/ 2.0 3)))
         (260 . ,red)
         (280 . ,(--color-blend grey-2 red (/ 1.0 4)))
         (300 . ,(--color-blend grey-2 red (/ 2.0 4)))
         (320 . ,(--color-blend grey-2 red (/ 3.0 4)))
         (340 . ,grey-2)
         (360 . ,grey-2)))
     `(vc-annotate-very-old-color nil)
     `(vc-annotate-background ,black))))

;; *****************************************************************************************

(provide-theme 'narf-one)

;; Local Variables:
;; no-byte-compile: t
;; End: