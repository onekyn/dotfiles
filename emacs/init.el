;;; -*- lexical-binding: t; -*-

;; My sources of inspiration for this setup are:
;;   - https://gitlab.com/slotThe/dotfiles
;;   - https://github.com/protesilaos/dotfiles
;;   - https://codeberg.org/ashton314/emacs-bedrock
;;   - https://github.com/rexim/dotfiles

;; Store all of the *~ backup files in a specific directory
(setq backup-dir (locate-user-emacs-file "backup"))
(setopt backup-directory-alist `(("." . ,backup-dir)))

;; Store the Emacs-generated code in another file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;; Initialize the package manager with reasonable settings
(setopt package-install-upgrade-built-in t)
(setopt package-native-compile t)
(require 'package)

;; Add the MELPA package repository
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") :append)

;; Configure `use-package' with some good default
(setopt use-package-enable-imenu-support t)
(setopt use-package-always-defer t)
(setopt use-package-vc-prefer-newest t)
(require 'use-package)

;; Load all the other elisp files
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(require 'kyn-sensible-defaults)
(require 'kyn-startup-screen)
(require 'kyn-theming)
(require 'kyn-completion)
(require 'kyn-window-management)
(require 'kyn-general-packages)
(require 'kyn-development)

;; Restore normal garbage collection
(setq gc-cons-threshold (or kyn--initial-gc-threshold 800000))
