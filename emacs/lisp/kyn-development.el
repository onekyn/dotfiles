;;; -*- lexical-binding: t; -*-

(use-package prog-mode :ensure nil
  :config
  ;; Display line numbers in programming mode
  (display-line-numbers-mode)
  (setq-local display-line-numbers-width 3)

  ;; Use spaces over tabs
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq-local standard-indent 4)

  ;; Highlight trailing spaces
  (setq-local show-trailing-whitespace t)

  ;; Automatically match parenthesis
  (electric-pair-mode))

(use-package compile :ensure nil
  ;; Add support for ansi colors
  :hook (compilation-filter . ansi-color-compilation-filter)

  ;; Easily close the compilation buffer
  :bind (:map compilation-mode-map ("q" . delete-window))

  ;; Stop scrolling after the first error
  :custom
  (compilation-scroll-output 'first-error)
  (compilation-auto-jump-to-first-error t))

;; Rust
(use-package rustic-mode :ensure t
  :vc (:url "https://github.com/emacs-rustic/rustic")
  :custom (rust-mode-treesitter-derive t)
  :bind (:map rustic-mode-map
              ("C-c m" . lsp-rust-analyzer-expand-macro)
              ([f5]    . rustic-cargo-build)))

;; Emacs Lisp
(use-package emacs
  :bind (:map emacs-lisp-mode-map
              ("C-c <return>"   . pp-macroexpand-last-sexp)
              ("C-c C-<return>" . emacs-lisp-macroexpand)))

;; Nix
(use-package nix-mode  :ensure t
  :mode "\\.nix\\'")

;; Markdown
(use-package markdown-mode :ensure t
  :hook ((markdown-mode . visual-line-mode)))

;; Packages for other common file types
(use-package yaml-mode :ensure t)
(use-package json-mode :ensure t)

;; LSP support
(use-package eglot :ensure nil
  :custom
  (eglot-send-changes-idle-time 0.1)
  (eglot-extend-to-xref t)

  ;; Don't log every event for performace reasons
  :config (fset #'jsonrpc--log-event #'ignore))

(provide 'kyn-development)
