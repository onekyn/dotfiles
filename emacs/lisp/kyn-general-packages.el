;;; -*- lexical-binding: t; -*-

;; A feature-rich git client
(use-package magit :ensure t
  :bind (("C-x g" . magit-status)))

;; A simple LLM client
(use-package gptel :ensure t
  :custom
  (gptel-track-media t)
  (gptel-model 'llama-3.2-1b-instruct)
  (gptel-backend
   (gptel-make-openai "LM Studio"
     :stream t :protocol "http" :host "localhost:1234"
     :models '(llama-3.2-1b-instruct hermes-3-llama-3.2-3b)))

  :bind (("C-c SPC" . gptel-menu)
	 ("C-c TAB" . gptel-send)
	 ("C-c C-g" . gptel-abort)
	 ("C-c r"   . gptel-rewrite)
	 ("C-c t"   . gptel-org-set-topic)
	 ("C-c p"   . gptel-org-set-properties)))

;; Show a popup of possible keybindings when entering a long key combo
(use-package which-key :ensure nil :demand t
  :config (which-key-mode))

;; Open URLs with web browser
(use-package browse-url :ensure nil
  :custom
  (browse-url-browser-function eww-browse-url)
  (browse-url-secondary-browser-function browse-url-default-browser))

;; Custom HTML rendering inside Emacs
(use-package shr :ensure nil
  :custom
  (shr-use-colors nil)
  (shr-use-fonts nil)
  (shr-max-image-proportion 0.5)
  (shr-width fill-column)
  (shr-max-width fill-column)
  (shr-discard-aria-hidden t)
  (shr-cookie-policy nil))

;; Reject all the cookies when using `eww'
(use-package url-cookie :ensure nil
  :custom (url-cookie-untrusted-urls '(".*")))

;; A builtin web browser (only for HTML)
(use-package eww :ensure nil
  :custom
  (eww-auto-rename-buffer 'title)
  (eww-header-line-format nil)
  (eww-history-limit 150))

(provide 'kyn-general-packages)
