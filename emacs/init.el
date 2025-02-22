;; Store all of the *~ backup files in a specific directory
(setq backup-dir (locate-user-emacs-file "backup"))
(setopt backup-directory-alist `(("." . ,backup-dir)))

;; Store the Emacs-generated code in another file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;; Add the MELPA package repository
(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

;; Replace the welcome screen with an empty scratch buffer
(setopt inhibit-splash-screen t)
(setopt initial-major-mode 'fundamental-mode)
(setopt initial-scratch-message nil)

;; Automatically revert a buffer if its associated file changes
(setopt auto-revert-avoid-polling t)
(setopt auto-revert-check-vc-info t)
(global-auto-revert-mode)

;; Save the minibuffer history
(savehist-mode)

;; Use Ctrl-<arrow keys> to move through windows
(windmove-default-keybindings 'control)

;; Nobody uses typewriters anymore...
(setopt sentence-end-double-space nil)

;; Delete the selected text upon insertion
(delete-selection-mode)

;; Make the right-click useful when using the GUI
(when (display-graphic-p)
  (context-menu-mode))

;; Show a popup of possible keybindings when entering a long key combo
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Improve the minibuffer and the completion system
;; See https://www.masteringemacs.org/article/understanding-minibuffer-completion
(setopt completion-auto-help 'always)                  ; Always show the completion buffer
(setopt completion-cycle-threshold 1)                  ; TAB cycles candidates
(setopt tab-always-indent 'complete)                   ; Use TAB to either complete or indent
(setopt completion-auto-select 'second-tab)            ; Hit TAB again to select candidates
(setopt completions-format 'one-column)                ; List candidates in a vertical column
(setopt completions-max-height 15)                     ; Set the height of the completion buffer
(setopt enable-recursive-minibuffers t)                ; Open minibuffer while using another minibuffer
(setopt completions-detailed t)                        ; Show help annotations
(setopt completion-styles '(basic initials substring)) ; How to match input to candidates

;; Show the current column number in modeline
(setopt column-number-mode t)

;; Highlight trailing spaces
(setopt show-trailing-whitespace t)

;; Show buffer scrolling limits in the left margins
(setopt indicate-buffer-boundaries 'left)

;; Use spaces over tabs by default
(setopt indent-tabs-mode nil)
(setopt tab-width 4)

;; Stop making the cursor blink when idle
(blink-cursor-mode -1)

;; Display line numbers in programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setopt display-line-numbers-width 3)

;; Better line wrapping experience when working with text
(add-hook 'text-mode-hook 'visual-line-mode)

;; Highlight the current line when programming or editing text
(let ((hl-line-hooks '(text-mode-hook prog-mode-hook)))
  (mapc (lambda (hook) (add-hook hook 'hl-line-mode)) hl-line-hooks))

;; Packages needed for software development
(load-file (expand-file-name "lisp/dev.el" user-emacs-directory))

;; Restore normal garbage collection
(setq gc-cons-threshold (or kyn--initial-gc-threshold 800000))
