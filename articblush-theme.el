(deftheme articblush "UwU color theme.")

;;; Variables
(eval-and-compile
  (defvar articblush-colors-alist
    '(("articblush-fg"                . "#cce9ea")
      ("articblush-bg"                . "#040c16")
      ("articblush-black"             . "#3d3e51")
      ("articblush-red"               . "#FF7377")
      ("articblush-green"             . "#AAF0C1")
      ("articblush-yellow"            . "#eadd94")
      ("articblush-blue"              . "#bdd6f4")
      ("articblush-magenta"           . "#f9ecf7")
      ("articblush-cyan"              . "#b3ffff")
      ("articblush-white"             . "#edf7f8")
      ("articblush-bright-black"      . "#323949")
      ("articblush-bright-red"        . "#E6676B")
      ("articblush-bright-green"      . "#A2E4B8")
      ("articblush-bright-yellow"     . "#e2d06a")
      ("articblush-bright-blue"       . "#92bbed")
      ("articblush-bright-magenta"    . "#ecc6e8")
      ("articblush-bright-cyan"       . "#80ffff")
      ("articblush-bright-white"      . "#cfebec")
      ("articblush-comment"           . "#d3d3d3")
      ("articblush-highlight"         . "#c2cae2")
      ("articblush-warning"           . "#FFE900")
      ("articblush-error"             . "#FF5733"))))

(defvar articblush-use-variable-pitch nil
  "When non-nil, use variable pitch face for some headings and titles.")

(defvar articblush-scale-org-headlines nil
  "Whether `org-mode' headlines should be scaled.")

(defvar articblush-scale-outline-headlines nil
  "Whether `outline-mode' headlines should be scaled.")

(defvar articblush-scale-shr-headlines nil
  "Whether `shr' headlines should be scaled.")

(defcustom articblush-distinct-line-numbers t
  "Whether line numbers should look distinct."
  :type 'boolean
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defcustom articblush-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defcustom articblush-height-plus-1 1.075
  "Font size +1."
  :type 'number
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defcustom articblush-height-plus-2 1.1
  "Font size +1."
  :type 'number
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defcustom articblush-height-plus-3 1.125
  "Font size +2."
  :type 'number
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defcustom articblush-height-plus-4 1.15
  "Font size +3."
  :type 'number
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defcustom articblush-height-plus-5 1.2
  "Font size +4."
  :type 'number
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defcustom articblush-height-plus-6 1.3
  "Font size +5."
  :type 'number
  :group 'articblush-theme
  :package-version '(articblush . "1.0"))

(defmacro articblush-with-color-variables (&rest body)
  "`let' bind all colors defined in `articblush-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append articblush-colors-alist))
         (z-variable-pitch (if articblush-use-variable-pitch
                               'variable-pitch 'default)))
     ,@body))

;;; Theme Faces
(articblush-with-color-variables
  (custom-theme-set-faces 'articblush
                          '(button ((t (:underline t))))
                          `(default ((t (:background ,articblush-bg :foreground ,articblush-fg))))
                          `(cursor ((t (:background ,articblush-white :foreground ,articblush-bright-black))))
                          `(link ((t (:underline t :foreground ,articblush-blue))))
                          `(link-visited ((t (:underline t :foreground ,articblush-bright-blue))))
                          `(underline ((t (:underline t :foreground ,articblush-yellow))))
                          `(font-lock-keyword-face ((t (:foreground ,articblush-magenta))))
                          `(font-lock-function-name-face ((t (:foreground ,articblush-blue))))
                          `(font-lock-string-face ((t (:foreground ,articblush-green))))
                          `(font-lock-warning-face ((t (:inverse-video t :background ,articblush-bg :foreground ,articblush-error))))
                          `(font-lock-type-face ((t (:weight bold :foreground ,articblush-yellow))))
                          `(font-lock-preprocessor-face ((t (:foreground ,articblush-blue))))
                          `(font-lock-builtin-face ((t (:weight bold :foreground ,articblush-yellow))))
                          `(font-lock-variable-name-face ((t (:foreground ,articblush-red))))
                          `(font-lock-constant-face ((t (:foreground ,articblush-yellow))))
                          `(font-lock-doc-face ((t (:slant italic :foreground ,articblush-comment))))
                          `(font-lock-comment-face ((t (:slant italic :foreground ,articblush-comment))))
                          `(shadow ((t (:foreground ,articblush-comment))))
                          `(Info-quoted ((t (:inherit font-lock-constant-face))))
                          `(show-paren-match-face ((t (:inverse-video t :background ,articblush-white :foreground ,articblush-red))))
                          `(highline-face ((t (:background ,articblush-black))))
                          `(ac-selection-face ((t (:background ,articblush-magenta :foreground ,articblush-highlight))))
                          `(ac-candidate-face ((t (:background ,articblush-black :foreground ,articblush-white))))
                          `(flymake-errline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-error)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,articblush-error :weight bold :underline t))))
                          `(flymake-warnline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-warning)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,articblush-warning :weight bold :underline t))))
                          `(flymake-infoline
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-green)
                                          :inherit unspecified :foreground unspecified :background unspecified))
                             (t (:foreground ,articblush-bright-green :weight bold :underline t))))
                          `(flyspell-duplicate
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-yellow) :inherit unspecified))
                             (t (:foreground ,articblush-yellow :weight bold :underline t))))
                          `(flyspell-incorrect
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-red) :inherit unspecified))
                             (t (:foreground ,articblush-bright-red :weight bold :underline t))))
                          `(minibuffer-prompt ((t (:foreground ,articblush-yellow))))
                          `(menu ((t (:foreground ,articblush-fg :background ,articblush-bg))))
                          `(highlight ((t (:background ,articblush-highlight))))
                          `(hl-line-face ((,class (:background ,articblush-highlight))
                                          (t :weight bold)))
                          `(hl-line ((,class (:background ,articblush-highlight :extend t))
                                     (t :weight bold)))
                          `(success ((t (:foreground ,articblush-green :weight bold))))
                          `(warning ((t (:foreground ,articblush-warning :weight bold))))
                          `(error ((t  (:foreground ,articblush-error))))
                          `(tooltip ((t (:foreground ,articblush-fg :background ,articblush-black))))
                          `(region ((t (:inverse-video t :background ,articblush-black))))
                          `(secondary-selection ((t (:background ,articblush-bright-black))))
                          `(trailing-whitespace ((t (:background ,articblush-red))))
                          `(border ((t (:background ,articblush-bright-black :foreground ,articblush-white))))
                          `(vertical-border ((t (:foreground ,articblush-bright-black))))
                          `(mode-line ((t (:foreground ,articblush-white :background ,articblush-black :weight normal
                                                       :box (:line-width 1 :color ,articblush-black)))))
                          `(mode-line-inactive ((t (:foreground ,articblush-comment :background ,articblush-black :weight normal :box (:line-width 1 :color ,articblush-black)))))
                          `(mode-line-buffer-id ((t (:weight bold :background ,articblush-black :foreground ,articblush-bright-white))))
                          `(mode-line-emphasis ((t (:foreground ,articblush-fg :slant italic))))
                          `(mode-line-highlight ((t (:foreground ,articblush-magenta :box nil :weight bold))))
                          `(fringe ((t (:underline t :background ,articblush-bg :foreground ,articblush-highlight))))
                          `(fill-column-indicator ((,class :foreground ,articblush-highlight :weight semilight)))
                          `(linum ((t (:background ,articblush-black :foreground ,articblush-white))))
                          `(line-number ((t (:foreground ,(if articblush-distinct-line-numbers articblush-white articblush-comment)
                                                         ,@(when articblush-distinct-line-numbers
                                                             (list :background articblush-black))))))
                          `(line-number-current-line ((t (:inherit line-number :foreground ,(if articblush-distinct-line-numbers articblush-bright-white articblush-white)
                                                                   ,@(when articblush-distinct-line-numbers
                                                                       (list :background articblush-highlight))))))
                          `(header-line ((t (:foreground ,articblush-yellow
                                                         :background ,articblush-black
                                                         :box (:line-width -1 :style released-button)
                                                         :extend t))))
                          `(widget-field ((t (:foreground ,articblush-fg :background ,articblush-bright-black))))
                          `(widget-button ((t (:underline t))))
                          `(escape-glyph ((t (:foreground ,articblush-yellow :weight bold))))
                          `(dired-directory ((t (:weight bold :foreground ,articblush-blue))))
                          `(lazy-highlight ((t (:foreground ,articblush-blue :background ,articblush-bg :inverse-video t))))
                          `(isearch ((t (:inverse-video t :background ,articblush-highlight :foreground ,articblush-bright-blue))))
                          `(isearch-fail ((t (:background ,articblush-bg :inherit font-lock-warning-face :inverse-video t))))
                          `(isearch-lazy-highlight-face ((t (:inverse-video t :foreground ,articblush-yellow))))
                          `(grep-context-face ((t (:foreground ,articblush-fg))))
                          `(grep-error-face ((t (:foreground ,articblush-red :weight bold :underline t))))
                          `(grep-hit-face ((t (:foreground ,articblush-bright-blue))))
                          `(grep-match-face ((t (:foreground ,articblush-bright-blue :weight bold))))
                          `(match ((t (:background ,articblush-black :foreground ,articblush-bright-blue :weight bold))))
                          `(completions-annotations ((t (:foreground ,articblush-white))))
                          `(completions-common-part ((t (:foreground ,articblush-bright-blue))))
                          `(completions-first-difference ((t (:foreground ,articblush-bright-white))))
                          ;; ido
                          `(ido-first-match ((t (:foreground ,articblush-blue :weight bold))))
                          `(ido-only-match ((t (:foreground ,articblush-green :weight bold))))
                          `(ido-subdir ((t (:foreground ,articblush-yellow))))
                          `(ido-indicator ((t (:foreground ,articblush-yellow :background ,articblush-bright-red))))
                          ;; org-mode
                          `(org-agenda-date-today
                            ((t (:foreground ,articblush-fg :slant italic :weight bold))) t)
                          `(org-agenda-structure
                            ((t (:inherit font-lock-comment-face))))
                          `(org-archived ((t (:foreground ,articblush-fg :weight bold))))
                          `(org-block ((t (:background ,articblush-black :foreground ,articblush-white :extend t))))
                          `(org-block-begin-line ((t (:foreground ,articblush-comment :background ,articblush-black :extend t))))
                          `(org-code ((t (:foreground ,articblush-bright-yellow ))))
                          `(org-checkbox ((t (:background ,articblush-bg :foreground ,articblush-fg
                                                          :box (:line-width 1 :style released-button)))))
                          `(org-date ((t (:foreground ,articblush-blue :underline t))))
                          `(org-deadline-announce ((t (:foreground ,articblush-red))))
                          `(org-done ((t (:weight bold :weight bold :foreground ,articblush-green))))
                          `(org-formula ((t (:foreground ,articblush-yellow))))
                          `(org-headline-done ((t (:foreground ,articblush-green))))
                          `(org-hide ((t (:background ,articblush-bg :foreground ,articblush-bg))))
                          `(org-verbatim ((t (:foreground ,articblush-bright-yellow))))
                          `(org-meta-line ((t (:foreground ,articblush-comment))))
                          `(org-indent ((t (:background ,articblush-bg :foreground ,articblush-bg))))
                          `(org-level-1 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-blue
                                                      ,@(when articblush-scale-org-headlines
                                                          (list :height articblush-height-plus-6))))))
                          `(org-level-2 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-green
                                                      ,@(when articblush-scale-org-headlines
                                                          (list :height articblush-height-plus-5))))))
                          `(org-level-3 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-magenta
                                                      ,@(when articblush-scale-org-headlines
                                                          (list :height articblush-height-plus-4))))))
                          `(org-level-4 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-red
                                                      ,@(when articblush-scale-org-headlines
                                                          (list :height articblush-height-plus-3))))))
                          `(org-level-5 ((t (:inherit ,z-variable-pitch :foreground ,articblush-blue
                                                      ,@(when articblush-scale-org-headlines
                                                          (list :height articblush-height-plus-2))))))
                          `(org-level-6 ((t (:inherit ,z-variable-pitch :foreground ,articblush-green
                                                      ,@(when articblush-scale-org-headlines
                                                          (list :height articblush-height-plus-1))))))
                          `(org-level-7 ((t (:inherit ,z-variable-pitch :foreground ,articblush-magenta))))
                          `(org-level-8 ((t (:inherit ,z-variable-pitch :foreground ,articblush-red))))
                          `(org-link ((t (:foreground ,articblush-blue :underline t))))
                          `(org-scheduled ((t (:foreground ,articblush-green))))
                          `(org-scheduled-previously ((t (:foreground ,articblush-red))))
                          `(org-scheduled-today ((t (:foreground ,articblush-blue))))
                          `(org-sexp-date ((t (:foreground ,articblush-blue :underline t))))
                          `(org-special-keyword ((t (:inherit font-lock-comment-face))))
                          `(org-table ((t (:foreground ,articblush-blue))))
                          `(org-tag ((t (:weight bold :weight bold))))
                          `(org-time-grid ((t (:foreground ,articblush-yellow))))
                          `(org-todo ((t (:weight bold :foreground ,articblush-red :weight bold))))
                          `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
                          `(org-warning ((t (:weight bold :foreground ,articblush-error :weight bold :underline nil))))
                          `(org-column ((t (:background ,articblush-bg))))
                          `(org-column-title ((t (:background ,articblush-bg :underline t :weight bold))))
                          `(org-mode-line-clock ((t (:foreground ,articblush-fg :background ,articblush-bg))))
                          `(org-mode-line-clock-overrun ((t (:foreground ,articblush-bg :background ,articblush-red))))
                          `(org-ellipsis ((t (:foreground ,articblush-yellow :underline t))))
                          `(org-footnote ((t (:foreground ,articblush-cyan :underline t))))
                          `(org-document-title ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-blue
                                                             :weight bold
                                                             ,@(when articblush-scale-org-headlines
                                                                 (list :height articblush-height-plus-4))))))
                          `(org-document-info ((t (:foreground ,articblush-magenta))))
                          `(org-document-info-keyword ((t (:foreground ,articblush-comment))))
                          `(org-habit-ready-face ((t :background ,articblush-green)))
                          `(org-habit-alert-face ((t :background ,articblush-yellow :foreground ,articblush-bg)))
                          `(org-habit-clear-face ((t :background ,articblush-blue)))
                          `(org-habit-overdue-face ((t :background ,articblush-red)))
                          `(org-habit-clear-future-face ((t :background ,articblush-blue)))
                          `(org-habit-ready-future-face ((t :background ,articblush-green)))
                          `(org-habit-alert-future-face ((t :background ,articblush-yellow :foreground ,articblush-bg)))
                          `(org-habit-overdue-future-face ((t :background ,articblush-red)))
                          ;; org-ref
                          `(org-ref-ref-face ((t :underline t)))
                          `(org-ref-label-face ((t :underline t)))
                          `(org-ref-cite-face ((t :underline t)))
                          `(org-ref-glossary-face ((t :underline t)))
                          `(org-ref-acronym-face ((t :underline t)))
                          ;; flycheck
                          `(flycheck-error
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-error) :inherit unspecified))
                             (t (:foreground ,articblush-error :weight bold :underline t))))
                          `(flycheck-warning
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-warning) :inherit unspecified))
                             (t (:foreground ,articblush-warning :weight bold :underline t))))
                          `(flycheck-info
                            ((((supports :underline (:style wave)))
                              (:underline (:style wave :color ,articblush-cyan) :inherit unspecified))
                             (t (:foreground ,articblush-cyan :weight bold :underline t))))
                          `(flycheck-fringe-error ((t (:foreground ,articblush-error :weight bold))))
                          `(flycheck-fringe-warning ((t (:foreground ,articblush-warning :weight bold))))
                          `(flycheck-fringe-info ((t (:foreground ,articblush-cyan :weight bold))))
                          ;; company-mode
                          `(company-tooltip ((t (:foreground ,articblush-fg :background ,articblush-black))))
                          `(company-tooltip-annotation ((t (:foreground ,articblush-blue :background ,articblush-black))))
                          `(company-tooltip-annotation-selection ((t (:foreground ,articblush-blue :background ,articblush-black))))
                          `(company-tooltip-selection ((t (:foreground ,articblush-bright-white :background ,articblush-highlight))))
                          `(company-tooltip-mouse ((t (:background ,articblush-black))))
                          `(company-tooltip-common ((t (:foreground ,articblush-green))))
                          `(company-tooltip-common-selection ((t (:foreground ,articblush-green))))
                          `(company-scrollbar-fg ((t (:background ,articblush-black))))
                          `(company-scrollbar-bg ((t (:background ,articblush-bright-black))))
                          `(company-preview ((t (:background ,articblush-bright-green))))
                          `(company-preview-common ((t (:foreground ,articblush-bright-green :background ,articblush-black))))
                          ;; term, ansi-term, vterm
                          `(term-color-black ((t (:foreground ,articblush-bg
                                                              :background , articblush-bg))))
                          `(term-color-red ((t (:foreground ,articblush-red
                                                            :background ,articblush-bright-red))))
                          `(term-color-green ((t (:foreground ,articblush-green
                                                              :background ,articblush-bright-green))))
                          `(term-color-yellow ((t (:foreground ,articblush-yellow
                                                               :background ,articblush-bright-yellow))))
                          `(term-color-blue ((t (:foreground ,articblush-blue
                                                             :background ,articblush-bright-blue))))
                          `(term-color-magenta ((t (:foreground ,articblush-magenta
                                                                :background ,articblush-bright-magenta))))
                          `(term-color-cyan ((t (:foreground ,articblush-cyan
                                                             :background ,articblush-bright-cyan))))
                          `(term-color-white ((t (:foreground ,articblush-fg
                                                              :background ,articblush-fg))))
                          '(term-default-fg-color ((t (:inherit articblush-fg))))
                          '(term-default-bg-color ((t (:inherit articblush-bg))))
                          ;; diff-mode
                          `(diff-added ((t (:foreground ,articblush-bright-green :background: ,articblush-black :extend t))))
                          `(diff-changed ((t  (:foreground ,articblush-warning :background: ,articblush-black :extend t))))
                          `(diff-removed ((t (:foreground ,articblush-error :background: ,articblush-black :extend t))))
                          `(diff-indicator-added ((t (:inherit diff-added))))
                          `(diff-indicator-changed ((t (:inherit diff-changed))))
                          `(diff-indicator-removed ((t (:inherit diff-removed))))
                          `(diff-refine-added   ((t (:background ,articblush-bright-green :foreground ,articblush-black))))
                          `(diff-refine-changed ((t (:background ,articblush-warning :foreground ,articblush-black))))
                          `(diff-refine-removed ((t (:background ,articblush-error :foreground ,articblush-black))))
                          `(diff-header ((,class (:background ,articblush-black))
                                         (t (:background ,articblush-fg :foreground ,articblush-bg))))
                          `(diff-file-header
                            ((,class (:background ,articblush-black :foreground ,articblush-fg :weight bold))
                             (t (:background ,articblush-fg :foreground ,articblush-bg :weight bold))))
                          ;; diff-hl
                          `(diff-hl-change ((,class (:inverse-video t :foreground ,articblush-warning :background ,articblush-bg))))
                          `(diff-hl-delete ((,class (:inverse-video t :foreground ,articblush-error :background ,articblush-bg))))
                          `(diff-hl-insert ((,class (:inverse-video t :foreground ,articblush-bright-green :background ,articblush-bg))))
                          ;; tab-bar
                          `(tab-bar ((t (:height 1.1 :foreground ,articblush-white :background ,articblush-black))))
                          `(tab-bar-tab ((t (:background ,articblush-black
                                                         :foreground ,articblush-magenta
                                                         :box (:line-width 1 :style released-button)))))
                          `(tab-bar-tab-inactive ((t (:inherit tab-bar-tab
                                                               :background ,articblush-black
                                                               :foreground ,articblush-comment))))

                          ;; tab-line
                          `(tab-line ((t (:foreground ,articblush-white :background ,articblush-black))))
                          `(tab-line-close-highlight ((t (:foreground ,articblush-red))))
                          `(tab-line-tab ((t (:background ,articblush-black
                                                          :foreground ,articblush-magenta
                                                          :box (:line-width 1 :style released-button)))))
                          `(tab-line-tab-inactive ((t (:inherit tab-line-tab
                                                                :background ,articblush-black
                                                                :foreground ,articblush-comment))))
                          ;; vertico
                          `(vertico-current ((t (:background ,articblush-black :foreground ,articblush-yellow :weight bold))))
                          `(vertico-multiline ((t (:foreground ,articblush-green :weight bold))))
                          `(vertico-group-title ((t (:foreground ,articblush-green :weight bold))))
                          `(vertico-group-separator ((t (:foreground ,articblush-green :weight bold))))
                          ;; selectrum
                          `(selectrum-current-candidate ((t (:background ,articblush-black :foreground ,articblush-yellow :weight bold))))
                          `(selectrum-primary-highlight ((t (:foreground ,articblush-blue :weight bold))))
                          `(selectrum-secondary-highlight ((t (:foreground ,articblush-magenta :weight bold))))
                          ;; orderless
                          `(orderless-match-face-0 ((t (:foreground ,articblush-blue))))
                          `(orderless-match-face-1 ((t (:foreground ,articblush-magenta))))
                          `(orderless-match-face-2 ((t (:foreground ,articblush-green))))
                          `(orderless-match-face-3 ((t (:foreground ,articblush-cyan))))
                          ;; helm
                          `(helm-header
                            ((t (:foreground ,articblush-green
                                             :background ,articblush-bg
                                             :underline nil
                                             :box nil
                                             :extend t))))
                          `(helm-source-header
                            ((t (:foreground ,articblush-yellow
                                             :background ,articblush-black
                                             :underline nil
                                             :weight bold
                                             :box (:line-width -1 :style released-button)
                                             :extend t))))
                          `(helm-selection ((t (:background ,articblush-black :weight bold :underline nil))))
                          `(helm-selection-line ((t (:background ,articblush-black))))
                          `(helm-visible-mark ((t (:foreground ,articblush-bg :background ,articblush-bright-yellow))))
                          `(helm-candidate-number ((t (:foreground ,articblush-green :background ,articblush-black))))
                          `(helm-separator ((t (:foreground ,articblush-red :background ,articblush-bg))))
                          `(helm-time-zone-current ((t (:foreground ,articblush-green :background ,articblush-bg))))
                          `(helm-time-zone-home ((t (:foreground ,articblush-red :background ,articblush-bg))))
                          `(helm-bookmark-addressbook ((t (:foreground ,articblush-yellow :background ,articblush-bg))))
                          `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
                          `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
                          `(helm-bookmark-gnus ((t (:foreground ,articblush-magenta :background ,articblush-bg))))
                          `(helm-bookmark-info ((t (:foreground ,articblush-green :background ,articblush-bg))))
                          `(helm-bookmark-man ((t (:foreground ,articblush-yellow :background ,articblush-bg))))
                          `(helm-bookmark-w3m ((t (:foreground ,articblush-magenta :background ,articblush-bg))))
                          `(helm-buffer-not-saved ((t (:foreground ,articblush-red :background ,articblush-bg))))
                          `(helm-buffer-process ((t (:foreground ,articblush-cyan :background ,articblush-bg))))
                          `(helm-buffer-saved-out ((t (:foreground ,articblush-fg :background ,articblush-bg))))
                          `(helm-buffer-size ((t (:foreground ,articblush-white :background ,articblush-bg))))
                          `(helm-ff-directory ((t (:foreground ,articblush-cyan :background ,articblush-bg :weight bold))))
                          `(helm-ff-file ((t (:foreground ,articblush-fg :background ,articblush-bg :weight normal))))
                          `(helm-ff-file-extension ((t (:foreground ,articblush-fg :background ,articblush-bg :weight normal))))
                          `(helm-ff-executable ((t (:foreground ,articblush-green :background ,articblush-bg :weight normal))))
                          `(helm-ff-invalid-symlink ((t (:foreground ,articblush-red :background ,articblush-bg :weight bold))))
                          `(helm-ff-symlink ((t (:foreground ,articblush-yellow :background ,articblush-bg :weight bold))))
                          `(helm-ff-prefix ((t (:foreground ,articblush-bg :background ,articblush-yellow :weight normal))))
                          `(helm-grep-cmd-line ((t (:foreground ,articblush-cyan :background ,articblush-bg))))
                          `(helm-grep-file ((t (:foreground ,articblush-fg :background ,articblush-bg))))
                          `(helm-grep-finish ((t (:foreground ,articblush-green :background ,articblush-bg))))
                          `(helm-grep-lineno ((t (:foreground ,articblush-white :background ,articblush-bg))))
                          `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
                          `(helm-grep-running ((t (:foreground ,articblush-red :background ,articblush-bg))))
                          `(helm-match ((t (:foreground ,articblush-yellow :background ,articblush-black :weight bold))))
                          `(helm-match-item ((t (:foreground ,articblush-yellow :background ,articblush-black :weight bold))))
                          `(helm-moccur-buffer ((t (:foreground ,articblush-cyan :background ,articblush-bg))))
                          `(helm-mu-contacts-address-face ((t (:foreground ,articblush-white :background ,articblush-bg))))
                          `(helm-mu-contacts-name-face ((t (:foreground ,articblush-fg :background ,articblush-bg))))
                          ;; ivy
                          `(ivy-confirm-face ((t (:foreground ,articblush-green :background ,articblush-bg))))
                          `(ivy-current-match ((t (:foreground ,articblush-yellow :background ,articblush-black :weight bold))))
                          `(ivy-cursor ((t (:foreground ,articblush-bg :background ,articblush-fg))))
                          `(ivy-match-required-face ((t (:foreground ,articblush-red :background ,articblush-bg :weight bold))))
                          `(ivy-minibuffer-match-face-1 ((t (:foreground ,articblush-magenta :weight bold ))))
                          `(ivy-minibuffer-match-face-2 ((t (:foreground ,articblush-blue :weight bold))))
                          `(ivy-minibuffer-match-face-3 ((t (:foreground ,articblush-green :weight bold))))
                          `(ivy-minibuffer-match-face-4 ((t (:foreground ,articblush-cyan :weight bold))))
                          `(ivy-remote ((t (:foreground ,articblush-blue :background ,articblush-bg))))
                          `(ivy-subdir ((t (:foreground ,articblush-yellow :background ,articblush-bg))))
                          ;; swiper
                          `(swiper-line-face ((t (:background ,articblush-highlight))))
                          ;; helpful
                          `(helpful-heading ((t (:foreground ,articblush-bright-green :height 1.2))))
                          ;; which function
                          `(which-func ((t (:foreground ,articblush-blue))))
                          ;; rainbow-delimiters
                          `(rainbow-delimiters-depth-1-face ((t (:foreground ,articblush-bright-blue))))
                          `(rainbow-delimiters-depth-2-face ((t (:foreground ,articblush-bright-green))))
                          `(rainbow-delimiters-depth-3-face ((t (:foreground ,articblush-bright-magenta))))
                          `(rainbow-delimiters-depth-4-face ((t (:foreground ,articblush-bright-yellow))))
                          `(rainbow-delimiters-depth-5-face ((t (:foreground ,articblush-bright-red))))
                          `(rainbow-delimiters-depth-6-face ((t (:foreground ,articblush-bright-cyan))))
                          `(rainbow-delimiters-depth-7-face ((t (:foreground ,articblush-blue))))
                          `(rainbow-delimiters-depth-8-face ((t (:foreground ,articblush-green))))
                          `(rainbow-delimiters-depth-9-face ((t (:foreground ,articblush-magenta))))
                          `(rainbow-delimiters-depth-10-face ((t (:foreground ,articblush-yellow))))
                          `(rainbow-delimiters-depth-11-face ((t (:foreground ,articblush-red))))
                          `(rainbow-delimiters-depth-12-face ((t (:foreground ,articblush-cyan))))
                          ;; gnus
                          `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
                          `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
                          `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
                          `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
                          `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
                          `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
                          `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
                          `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
                          `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
                          `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
                          `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
                          `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
                          `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
                          `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
                          `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
                          `(gnus-header-content ((t (:inherit message-header-other))))
                          `(gnus-header-from ((t (:inherit message-header-other))))
                          `(gnus-header-name ((t (:inherit message-header-name))))
                          `(gnus-header-newsgroups ((t (:inherit message-header-other))))
                          `(gnus-header-subject ((t (:inherit message-header-subject))))
                          `(gnus-summary-cancelled ((t (:foreground ,articblush-yellow))))
                          `(gnus-summary-high-ancient ((t (:foreground ,articblush-blue :weight bold))))
                          `(gnus-summary-high-read ((t (:foreground ,articblush-green :weight bold))))
                          `(gnus-summary-high-ticked ((t (:foreground ,articblush-yellow :weight bold))))
                          `(gnus-summary-high-unread ((t (:foreground ,articblush-fg :weight bold))))
                          `(gnus-summary-low-ancient ((t (:foreground ,articblush-blue))))
                          `(gnus-summary-low-read ((t (:foreground ,articblush-green))))
                          `(gnus-summary-low-ticked ((t (:foreground ,articblush-yellow))))
                          `(gnus-summary-low-unread ((t (:foreground ,articblush-fg))))
                          `(gnus-summary-normal-ancient ((t (:foreground ,articblush-blue))))
                          `(gnus-summary-normal-read ((t (:foreground ,articblush-green))))
                          `(gnus-summary-normal-ticked ((t (:foreground ,articblush-yellow))))
                          `(gnus-summary-normal-unread ((t (:foreground ,articblush-fg))))
                          `(gnus-summary-selected ((t (:foreground ,articblush-yellow :weight bold))))
                          `(gnus-cite-1 ((t (:foreground ,articblush-blue))))
                          `(gnus-cite-2 ((t (:foreground ,articblush-blue))))
                          `(gnus-cite-3 ((t (:foreground ,articblush-blue))))
                          `(gnus-cite-4 ((t (:foreground ,articblush-green))))
                          `(gnus-cite-5 ((t (:foreground ,articblush-green))))
                          `(gnus-cite-6 ((t (:foreground ,articblush-green))))
                          `(gnus-cite-7 ((t (:foreground ,articblush-red))))
                          `(gnus-cite-8 ((t (:foreground ,articblush-red))))
                          `(gnus-cite-9 ((t (:foreground ,articblush-red))))
                          `(gnus-cite-10 ((t (:foreground ,articblush-yellow))))
                          `(gnus-cite-11 ((t (:foreground ,articblush-yellow))))
                          `(gnus-group-news-1-empty ((t (:foreground ,articblush-yellow))))
                          `(gnus-group-news-2-empty ((t (:foreground ,articblush-green))))
                          `(gnus-group-news-3-empty ((t (:foreground ,articblush-green))))
                          `(gnus-group-news-4-empty ((t (:foreground ,articblush-blue))))
                          `(gnus-group-news-5-empty ((t (:foreground ,articblush-blue))))
                          `(gnus-group-news-6-empty ((t (:foreground ,articblush-bright-blue))))
                          `(gnus-group-news-low-empty ((t (:foreground ,articblush-comment))))
                          `(gnus-signature ((t (:foreground ,articblush-yellow))))
                          `(gnus-x-face ((t (:background ,articblush-bg :foreground ,articblush-comment))))
                          ;; shr
                          `(shr-h1 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-blue
                                                 ,@(when articblush-scale-shr-headlines
                                                     (list :height articblush-height-plus-6))))))
                          `(shr-h2 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-green
                                                 ,@(when articblush-scale-shr-headlines
                                                     (list :height articblush-height-plus-5))))))
                          `(shr-h3 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-magenta
                                                 ,@(when articblush-scale-shr-headlines
                                                     (list :height articblush-height-plus-4))))))
                          `(shr-h4 ((t (:inherit ,z-variable-pitch :foreground ,articblush-bright-red
                                                 ,@(when articblush-scale-shr-headlines
                                                     (list :height articblush-height-plus-3))))))
                          `(shr-h5 ((t (:inherit ,z-variable-pitch :foreground ,articblush-blue
                                                 ,@(when articblush-scale-shr-headlines
                                                     (list :height articblush-height-plus-2))))))
                          `(shr-h6 ((t (:inherit ,z-variable-pitch :foreground ,articblush-green
                                                 ,@(when articblush-scale-shr-headlines
                                                     (list :height articblush-height-plus-1))))))
                          `(shr-code ((t (:foreground ,articblush-bright-yellow ))))
                          `(shr-link ((t (:inherit link))))
                          `(shr-selected-link ((t (:inherit link-visited))))
                          ;; message
                          `(message-cited-text ((t (:inherit font-lock-comment-face))))
                          `(message-header-name ((t (:foreground ,articblush-comment))))
                          `(message-header-other ((t (:foreground ,articblush-magenta))))
                          `(message-header-to ((t (:foreground ,articblush-yellow :weight bold))))
                          `(message-header-cc ((t (:foreground ,articblush-yellow :weight bold))))
                          `(message-header-newsgroups ((t (:foreground ,articblush-yellow :weight bold))))
                          `(message-header-subject ((t (:foreground ,articblush-bright-blue :weight bold))))
                          `(message-header-xheader ((t (:foreground ,articblush-magenta))))
                          `(message-mml ((t (:foreground ,articblush-yellow :weight bold))))
                          `(message-separator ((t (:inherit font-lock-comment-face))))
                          `(message-cited-text-1 ((t (:foreground ,articblush-blue))))
                          `(message-cited-text-2 ((t (:foreground ,articblush-green))))
                          `(message-cited-text-3 ((t (:foreground ,articblush-yellow))))
                          `(message-cited-text-4 ((t (:foreground ,articblush-red))))
                          `(mm-uu-extract ((t (:background ,articblush-black :foreground ,articblush-bright-green))))
                          ;; notmuch
                          `(notmuch-crypto-decryption ((t (:foreground ,articblush-bg :background ,articblush-magenta))))
                          `(notmuch-crypto-part-header ((t (:foreground ,articblush-bright-blue))))
                          `(notmuch-crypto-signature-bad ((t (:foreground ,articblush-bg :background ,articblush-error))))
                          `(notmuch-crypto-signature-good ((t (:foreground ,articblush-bg :background ,articblush-green))))
                          `(notmuch-crypto-signature-good-key ((t (:foreground ,articblush-bg :background ,articblush-yellow))))
                          `(notmuch-crypto-signature-unknown ((t (:foreground ,articblush-bg :background ,articblush-error))))
                          `(notmuch-hello-logo-background ((t (:background ,articblush-black))))
                          `(notmuch-wash-cited-text ((t (:foreground ,articblush-cyan))))
                          `(notmuch-tag-face ((t (:foreground ,articblush-yellow))))
                          `(notmuch-tag-unread ((t (:foreground ,articblush-magenta))))
                          `(notmuch-tag-added ((t (:underline ,articblush-green))))
                          `(notmuch-tag-deleted ((t (:strike-through ,articblush-red))))
                          `(notmuch-tag-flagged ((t (:foreground ,articblush-blue))));
                          `(notmuch-message-summary-face ((t (:inherit highlight))))
                          `(notmuch-search-date ((t (:inherit default))))
                          `(notmuch-search-count ((t (:inherit default))))
                          `(notmuch-search-subject ((t (:inherit default))))
                          `(notmuch-search-matching-authors ((t (:inherit default))))
                          `(notmuch-search-non-matching-authors ((t (:inherit shadow))))
                          `(notmuch-search-flagged-face ((t (:foreground ,articblush-blue))))
                          `(notmuch-search-unread-face ((t (:weight bold))))
                          `(notmuch-tree-match-author-face ((t (:foreground ,articblush-blue))))
                          `(notmuch-tree-match-date-face ((t (:foreground ,articblush-yellow))))
                          `(notmuch-tree-match-tag-face ((t (:foreground ,articblush-cyan))))
                          `(notmuch-tree-no-match-face ((t (:inherit font-lock-comment-face))))
                          ;; mu4e
                          `(mu4e-unread-face ((t (:foreground ,articblush-green :weight normal))))
                          `(mu4e-replied-face ((t (:foreground ,articblush-comment))))
                          `(mu4e-flagged-face ((t (:foreground ,articblush-blue :weight normal))))
                          `(mu4e-warning-face ((t (:foreground ,articblush-red :slant normal :weight bold))))
                          `(mu4e-trashed-face ((t (:foreground ,articblush-comment :strike-through t))))
                          `(mu4e-cited-1-face ((t (:foreground ,articblush-bright-blue :slant italic :weight normal))))
                          `(mu4e-cited-2-face ((t (:foreground ,articblush-bright-green :slant italic :weight normal))))
                          `(mu4e-cited-3-face ((t (:foreground ,articblush-bright-magenta :slant italic :weight normal))))
                          `(mu4e-cited-4-face ((t (:foreground ,articblush-bright-red :slant italic :weight normal))))
                          `(mu4e-cited-5-face ((t (:foreground ,articblush-blue :slant italic :weight normal))))
                          `(mu4e-cited-6-face ((t (:foreground ,articblush-green :slant italic :weight normal))))
                          `(mu4e-cited-7-face ((t (:foreground ,articblush-magenta :slant italic :weight normal))))
                          `(mu4e-view-url-number-face ((t (:foreground ,articblush-yellow :weight normal))))
                          `(mu4e-header-highlight-face
                            ((t (,@(and (>= emacs-major-version 27) '(:extend t))
                                 :inherit unspecified
                                 :foreground unspecified :background ,articblush-bg
                                 :underline unspecified  :weight unspecified))))
                          `(mu4e-view-contact-face ((t (:foreground ,articblush-fg  :weight normal))))
                          `(mu4e-view-header-key-face ((t (:inherit message-header-name :weight normal))))
                          `(mu4e-view-header-value-face ((t (:foreground ,articblush-cyan :weight normal :slant normal))))
                          `(mu4e-view-link-face ((t (:inherit link))))
                          `(mu4e-view-special-header-value-face ((t (:foreground ,articblush-blue :weight normal :underline nil))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'articblush)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; articblush-theme.el ends here
