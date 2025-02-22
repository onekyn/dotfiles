;; Magit: a feature-rich git client
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; Better syntax support
(use-package emacs
  ;; Automatically match parenthesis
  :hook ((prog-mode . electric-pair-mode))

  ;; Use the tree-sitter modes when possible
  :config
  (setq major-mode-remap-alist
        '((c-mode      . c-ts-mode)
          (rust-mode   . rust-ts-mode)
          (python-mode . python-ts-mode)
          (js-mode     . js-ts-mode)
          (json-mode   . json-ts-mode)
          (yaml-mode   . yaml-ts-mode))))

;; Add support for markdown files
(use-package markdown-mode
  :ensure t
  :hook ((markdown-mode . visual-line-mode)))

;; Packages for other common file types
(use-package yaml-mode :ensure t)
(use-package json-mode :ensure t)
(use-package nix-mode  :ensure t :mode "\\.nix\\'")
(use-package rust-mode :ensure t :mode "\\.rs\\'")

;; LSP support
;; See https://www.masteringemacs.org/article/seamlessly-merge-multiple-documentation-sources-eldoc
(use-package eglot
  ;; Automatically start eglot for these modes
  :hook (((c-mode rust-mode nix-mode python-mode) . eglot))

  ;; Miscellaneous settings
  :custom
  (eglot-send-changes-idle-time 0.1)
  (eglot-extend-to-xref t)

  ;; Don't log every event for performace reasons
  :config (fset #'jsonrpc--log-event #'ignore))
