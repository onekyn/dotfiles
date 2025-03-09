;;; -*- lexical-binding: t; -*-

;; Highlight the current line when programming or editing text
(let ((hl-line-hooks '(text-mode-hook prog-mode-hook)))
  (mapc (lambda (hook) (add-hook hook 'hl-line-mode)) hl-line-hooks))

;; Set a custom font
(set-face-attribute 'default nil :height 130 :weight 'light :family "Roboto Mono")
(set-face-attribute 'bold nil :weight 'regular)
(set-face-attribute 'bold-italic nil :weight 'regular)

;; Better glyphs for line truncation and wrapping
(set-display-table-slot standard-display-table 'truncation (make-glyph-code ?…))
(set-display-table-slot standard-display-table 'wrap (make-glyph-code ?–))

;; Use the builtin modus themes
(use-package emacs
  :config (load-theme 'modus-vivendi)
  :bind (([f6] . modus-themes-toggle))
  :custom
  (modus-themes-bold-constructs t)
  (modus-themes-italic-constructs t))

(provide 'kyn-theming)
