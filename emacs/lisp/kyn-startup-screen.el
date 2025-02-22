;;; -*- lexical-binding: t; -*-

;; Replace the welcome screen with an empty scratch buffer
(setopt inhibit-splash-screen t)
(setopt initial-major-mode 'fundamental-mode)
(setopt initial-scratch-message nil)

(provide 'kyn-startup-screen)
