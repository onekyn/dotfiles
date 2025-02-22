;;; -*- lexical-binding: t; -*-

;; Make the right-click useful when using the GUI
(when (display-graphic-p)
  (context-menu-mode))

;; Stop making the cursor blink when idle
(blink-cursor-mode -1)

;; Show the cursor only in the selected window
(setopt cursor-in-non-selected-windows nil)

;; Draw the cursor as wide as the glyph underneath
(setopt x-stretch-cursor t)

;; Nobody uses typewriters anymore...
(setopt sentence-end-double-space nil)

;; Delete trailing spaces when saving a file
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Better line wrapping experience when working with text
(add-hook 'text-mode-hook 'visual-line-mode)

;; Show the current column number in modeline
(setopt column-number-mode t)

;; Set the ideal length of a line
(setopt fill-column 70)
(add-hook 'prog-mode-hook (lambda () (setq-local fill-column 80)))

;; Show buffer scrolling limits in the left margins
(setopt indicate-buffer-boundaries 'left)

;; Delete the selected text upon insertion
(delete-selection-mode)

;; Automatically revert a buffer if its associated file changes
(setopt auto-revert-avoid-polling t)
(setopt auto-revert-check-vc-info t)
(global-auto-revert-mode)

;; Open minibuffer while using another minibuffer
(setopt enable-recursive-minibuffers t)

;; Don't save duplicates to the kill ring
(setopt kill-do-not-save-duplicates t)

;; `kill-line' at the start of the line, without arguments, kills the whole line
(setopt kill-whole-line t)

;; Disable annoying audio bell
(setopt visible-bell t)

;; Enable all the commands
(setopt disabled-command-function nil)

;; Avoid excessive fontification while scrolling fast
(setopt fast-but-imprecise-scrolling t)
(setopt redisplay-skip-fontification-on-input t)

;; A better `yer-or-no-p' experience
(setopt use-short-answers t)
(setopt y-or-n-p-use-read-key t)

;; Make the backup system more robust
(setopt backup-by-copying t)
(setopt version-control t)
(setopt delete-old-versions t)
(setopt kept-old-versions 5)
(setopt kept-new-versions 10)

(provide 'kyn-sensible-defaults)
