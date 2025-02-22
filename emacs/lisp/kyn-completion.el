;;; -*- lexical-binding: t; -*-

;; We attempt to get the most out of the built-in completion system.
;; This means that the number of third-party packages is kept minimal.
;; See https://www.masteringemacs.org/article/understanding-minibuffer-completion

;; Always show the completion buffer
(setopt completion-auto-help 'always)

;; TAB cycles candidates
(setopt completion-cycle-threshold 1)

;; Use TAB to either complete or indent
(setopt tab-always-indent 'complete)

;; Hit TAB again to select candidates
(setopt completion-auto-select 'second-tab)

;; List candidates in a vertical column
(setopt completions-format 'one-column)

;; Set the height of the completion buffer
(setopt completions-max-height 15)

;; Show help annotations
(setopt completions-detailed t)

;; How to match input to candidates
(setopt completion-styles '(basic initials substring))

;; Save the minibuffer history
(savehist-mode)

(provide 'kyn-completion)
