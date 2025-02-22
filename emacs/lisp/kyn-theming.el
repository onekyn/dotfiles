;;; -*- lexical-binding: t; -*-

;; Highlight the current line when programming or editing text
(let ((hl-line-hooks '(text-mode-hook prog-mode-hook)))
  (mapc (lambda (hook) (add-hook hook 'hl-line-mode)) hl-line-hooks))

(provide 'kyn-theming)
