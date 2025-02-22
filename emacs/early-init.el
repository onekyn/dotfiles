;;; -*- lexical-binding: t; -*-

;; Emacs runs this file before `init.el'.
;; Use it for things you want to be configured before
;; proper package and UI initialization happens.

;; Prevent garbage collection during startup
(setq kyn--initial-gc-threshold gc-cons-threshold)
(setq gc-cons-threshold 10000000)

;; Don't show to the user all the annoying compilation infos
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;; Silence useless startup message
(setq inhibit-startup-echo-area-message 'user-login-name)

;; The tool bar is cool for new users but I don't need it
(tool-bar-mode -1)

;; Every new window should be maximized and have these opinionated settings
(setq frame-resize-pixelwise t)
(setq default-frame-alist '((fullscreen . maximized)

                            ;; Turn off all the scroll bars
                            (vertical-scroll-bars . nil)
                            (horizontal-scroll-bars . nil)

                            ;; Prevent the bright flashes while the theme is not loaded yet
                            (background-color . "#000000")
                            (foreground-color . "#ffffff")))
