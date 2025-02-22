;;; -*- lexical-binding: t; -*-

;; A feature-rich git client
(use-package magit :ensure t
  :bind (("C-x g" . magit-status)))

;; Show a popup of possible keybindings when entering a long key combo
(use-package which-key :ensure t
  :config (which-key-mode))

(provide 'kyn-general-packages)
