;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 12))
;; (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12))


(setq doom-font (font-spec :family "JetBrains Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 12)
      doom-big-font (font-spec :family "JetBrains Mono" :size 18))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))



;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one) -- disable desfault theme
;;(load-theme 'doom-dracula t)
;; (load-theme 'doom-solarized-dark-high-contrast t)
(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'catppuccin)
;; (load-theme 'doom-ayu-dark t)
(add-to-list 'default-frame-alist '(alpha . 96))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Org/")

(after! org
  (setq org-agenda-files '("~/Documents/Org/Agenda.org")))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

(let ((load-suffixes (delete ".elc" load-suffixes)))
  (setq toplib (locate-library "magit")))
(add-to-list 'load-path (expand-file-name "C:/msys64/mingw64/lib/aspell-0.60"))
(add-to-list 'load-path (expand-file-name "C:/msys64/mingw64/bin"))
;;(add-to-list 'load-path (expand-file-name "C:/Users/Tsotetsi/AppData/Roaming/npm/astro-ls"))
;;"C:\Users\Tsotetsi\.doom.d\astro-ts-mode"


(use-package all-the-icons)
(use-package all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(setq
 projectile-project-search-path '("~/Desktop/" ("~/Documents/Projects/Dev/" . 1))
 org-roam-directory "~/Documents/Roam"
 org-journal-dir "~/Documents/Roam/journal/"
 org-roam-dailies-directory "diary/"
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-css-indent-offset 2
 mac-command-modifier 'meta
 js-indent-level 2
 typescript-indent-level 2
 json-reformat:indent-width 2
 org-tags-column -80
 org-log-done 'time
 css-indent-offset 2
 )


;;----------------------------------------------------------------------------- ;;

(add-hook 'org-mode-hook
          (lambda ()
            (org-superstar-mode 1)))
(after! org-roam

  (setq org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-item-bullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        org-table-convert-region-max-lines 20000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
        '((sequence
           "TODO(t)"           ; A task that is ready to be tackled
           "BLOG(b)"           ; Blog writing assignments
           "GYM(g)"            ; Things to accomplish at the gym
           "PROJ(p)"           ; A project that contains other tasks
           "VIDEO(v)"          ; Video assignments
           "WAIT(w)"           ; Something is holding up this task
           "|"                 ; The pipe necessary to separate "active" states and "inactive" states
           "DONE(d)"           ; Task has been completed
           "CANCELLED(c)" )))) ; Task has been cancelled

;; (custom-set-faces
;;  '(org-level-1 ((t (:inherit outline-1 :height 1.75))))
;;  '(org-level-2 ((t (:inherit outline-2 :height 1.50))))
;;  '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
;;  '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
;;  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
;; )

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))

(setq minimap-window-location 'right)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "m" #'minimap-mode))

(use-package org-roam
  :custom
  (org-roam-complete-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain (file "~/Documents/Roam/Templates/Default.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("p" "projects" plain (file "~/Documents/Roam/Templates/Projects.org")
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
      :unnarrowed t)
     ))
  (org-roam-dailies-capture-templates
   '(("d" "default" entry "** %<%I:%M %p>: %?"
      :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-$d>\n"))))
  (org-roam-db-autosync-mode))

;;---------------------------------------------------------------------------;;

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-inser args)))


(defun tm/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))


(defun tm/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (tm/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun tm/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (tm/org-roam-list-notes-by-tag "Project")))

(tm/org-roam-refresh-agenda-list)

;;TEMPORARRILY SWITCH OFF
;; (defun tm/org-roam-project-finalize-hook ()
;;   "Adds the captured project file to `org-agenda-files' if the capture was not aborted"
;;   (remove-hook 'org-capture-after-finalize-hook #'tm/org-roam-project-finalize-hook)
;;   (unless org-note-abort
;;     (with-current-buffer (org-capture-get :buffer)
;;       (add-to-list 'org-agenda-files (buffer-file-name)))))


(defun tm/org-roam-find-project ()
  (interactive)
  (add-hook 'org-capture-after-finalize-hook #'tm/org-roam-project-finalize-hook))

;;----------------------------------------------------------------------------- ;;



(defun dt/org-colors-doom-one ()
  "Enable Doom One colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.4 "#51afef" ultra-bold) ;; was 1.7
         (org-level-2 1.4 "#c678dd" extra-bold) ;; was 1.6
         (org-level-3 1.5 "#98be65" bold)
         (org-level-4 1.4 "#da8548" semi-bold)
         (org-level-5 1.3 "#5699af" normal)
         (org-level-6 1.2 "#a9a1e1" normal)
         (org-level-7 1.1 "#46d9ff" normal)
         (org-level-8 1.0 "#ff6c6b" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-dracula ()
  "Enable Dracula colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#8be9fd" ultra-bold)
         (org-level-2 1.6 "#bd93f9" extra-bold)
         (org-level-3 1.5 "#50fa7b" bold)
         (org-level-4 1.4 "#ff79c6" semi-bold)
         (org-level-5 1.3 "#9aedfe" normal)
         (org-level-6 1.2 "#caa9fa" normal)
         (org-level-7 1.1 "#5af78e" normal)
         (org-level-8 1.0 "#ff92d0" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-gruvbox-dark ()
  "Enable Gruvbox Dark colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#458588" ultra-bold)
         (org-level-2 1.6 "#b16286" extra-bold)
         (org-level-3 1.5 "#98971a" bold)
         (org-level-4 1.4 "#fb4934" semi-bold)
         (org-level-5 1.3 "#83a598" normal)
         (org-level-6 1.2 "#d3869b" normal)
         (org-level-7 1.1 "#d79921" normal)
         (org-level-8 1.0 "#8ec07c" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-monokai-pro ()
  "Enable Monokai Pro colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#78dce8" ultra-bold)
         (org-level-2 1.6 "#ab9df2" extra-bold)
         (org-level-3 1.5 "#a9dc76" bold)
         (org-level-4 1.4 "#fc9867" semi-bold)
         (org-level-5 1.3 "#ff6188" normal)
         (org-level-6 1.2 "#ffd866" normal)
         (org-level-7 1.1 "#78dce8" normal)
         (org-level-8 1.0 "#ab9df2" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-nord ()
  "Enable Nord colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#81a1c1" ultra-bold)
         (org-level-2 1.6 "#b48ead" extra-bold)
         (org-level-3 1.5 "#a3be8c" bold)
         (org-level-4 1.4 "#ebcb8b" semi-bold)
         (org-level-5 1.3 "#bf616a" normal)
         (org-level-6 1.2 "#88c0d0" normal)
         (org-level-7 1.1 "#81a1c1" normal)
         (org-level-8 1.0 "#b48ead" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-oceanic-next ()
  "Enable Oceanic Next colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#6699cc" ultra-bold)
         (org-level-2 1.6 "#c594c5" extra-bold)
         (org-level-3 1.5 "#99c794" bold)
         (org-level-4 1.4 "#fac863" semi-bold)
         (org-level-5 1.3 "#5fb3b3" normal)
         (org-level-6 1.2 "#ec5f67" normal)
         (org-level-7 1.1 "#6699cc" normal)
         (org-level-8 1.0 "#c594c5" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-palenight ()
  "Enable Palenight colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#82aaff" ultra-bold)
         (org-level-2 1.6 "#c792ea" extra-bold)
         (org-level-3 1.5 "#c3e88d" bold)
         (org-level-4 1.4 "#ffcb6b" semi-bold)
         (org-level-5 1.3 "#a3f7ff" normal)
         (org-level-6 1.2 "#e1acff" normal)
         (org-level-7 1.1 "#f07178" normal)
         (org-level-8 1.0 "#ddffa7" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-solarized-dark ()
  "Enable Solarized Dark colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#268bd2" ultra-bold)
         (org-level-2 1.6 "#d33682" extra-bold)
         (org-level-3 1.5 "#859900" bold)
         (org-level-4 1.4 "#b58900" semi-bold)
         (org-level-5 1.3 "#cb4b16" normal)
         (org-level-6 1.2 "#6c71c4" normal)
         (org-level-7 1.1 "#2aa198" normal)
         (org-level-8 1.0 "#657b83" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-solarized-light ()
  "Enable Solarized Light colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#268bd2" ultra-bold)
         (org-level-2 1.6 "#d33682" extra-bold)
         (org-level-3 1.5 "#859900" bold)
         (org-level-4 1.4 "#b58900" semi-bold)
         (org-level-5 1.3 "#cb4b16" normal)
         (org-level-6 1.2 "#6c71c4" normal)
         (org-level-7 1.1 "#2aa198" normal)
         (org-level-8 1.0 "#657b83" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(defun dt/org-colors-tomorrow-night ()
  "Enable Tomorrow Night colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#81a2be" ultra-bold)
         (org-level-2 1.6 "#b294bb" extra-bold)
         (org-level-3 1.5 "#b5bd68" bold)
         (org-level-4 1.4 "#e6c547" semi-bold)
         (org-level-5 1.3 "#cc6666" normal)
         (org-level-6 1.2 "#70c0ba" normal)
         (org-level-7 1.1 "#b77ee0" normal)
         (org-level-8 1.0 "#9ec400" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
  (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

;; Load our desired dt/org-colors-* theme on startup
(dt/org-colors-doom-one)


;;------------------------------------------------------------------------------------------------------------------------------------------------------------;;
(setq treesit-language-source-alist
      '((tsx        "https://github.com/tree-sitter/tree-sitter-typescript"
         "v0.20.3"
         "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript"
                    "v0.20.3"
                    "typescript/src")))




;; OR, keeping YASnippet defaults try out ~/Downloads/interesting-snippets
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.doom.d/plugins/yasnippet")))

(use-package doom-snippets
  :load-path "~/.doom.d/plugins/snippets"
  :after yasnippet)


(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("app\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("pages\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("components\\/.*\\.jsx\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("pages\\/.*\\.jsx\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("app\\/.*\\.jsx\\'" . rjsx-mode))
  )


;; WEB MODE
(use-package web-mode
  :ensure t)



(setq find-program "C:/msys64/usr/bin/find.exe")

(add-to-list 'exec-path "C:/msys64/etc")
(setenv "PATH" (mapconcat #'identity exec-path path-separator))


;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (astro-ts-mode . lsp-deferred)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands (lsp lsp-deferred))


;;----------------------------------------------------------------------------------------------------------------------------------------------------------;;
;; EGLOT
;; (use-package eglot
;;   :config
;;   (progn
;;     (add-hook 'astro-ts-mode-hook 'lsp)
;;     )
;;   (add-to-list 'eglot-server-programs
;;                '(astro-mode web-mode . ("astro-ls" "--stdio"
;;                                         :initializationOptions
;;                                         (:typescript (:tsdk "C:/msys64/mingw64/lib/node_modules/typescript/lib")))))
;;   :init
;;   ;; auto start eglot for astro-mode
;;   (add-hook 'astro-mode-hook 'eglot-ensure))
;; (setq eglot-ignored-server-capabilities '(:workspaceSymbolProvider))

;; (add-hook 'after-init-hook 'global-company-mode)


;; (add-to-list 'load-path (expand-file-name "C:/Users/Tsotetsi/.doom.d/astro-ts-mode"))
;; (require 'astro-ts-mode)

;; ;; (use-package astro-ts-mode
;; ;;   ;; this uses texlab
;; ;;   :ensure t
;; ;;   :config
;; ;;   (progn
;; ;;     (add-hook 'astro-ts-mode-hook 'lsp)
;; ;;     )
;; ;;   )


;; (setq auto-mode-alist
;;       (append '((".*\\.astro\\'" . astro-ts-mode))
;;               auto-mode-alist))

;; (set-formatter! 'prettier-astro
;;   '("npx" "prettier" "--parser=astro"
;;     (apheleia-formatters-indent "--use-tabs" "--tab-width" 'astro-ts-mode-indent-offset))
;;   :modes '(astro-ts-mode))
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------;;



(use-package! lsp-tailwindcss
  :when (modulep! +lsp)
  :init
  (setq! lsp-tailwindcss-add-on-mode t)
  :config
  (add-to-list 'lsp-tailwindcss-major-modes 'astro-ts-mode))

;; MDX Support
(add-to-list 'auto-mode-alist '("\\.\\(mdx\\)$" . markdown-mode))
(when (modulep! +lsp)
  (add-hook 'markdown-mode-local-vars-hook #'lsp! 'append))



(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'scss-mode-hook 'prettier-js-mode)


(use-package lsp-mode
  :hook
  (web-mode . lsp))


(add-to-list 'load-path (expand-file-name "~/.doom.d/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(use-package lsp-mode
  :hook
  (scss-mode . lsp))

(use-package scss-mode
  :hook
  ('scss-mode-hook 'lsp))


(use-package lsp-mode
  :hook
  (json-mode . lsp))


;; MDX Support
(add-to-list 'auto-mode-alist '("\\.\\(mdx\\)$" . markdown-mode))
(when (modulep! +lsp)
  (add-hook 'markdown-mode-local-vars-hook #'lsp! 'append))




(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package astro-ts-mode
  :init
  (when (modulep! +lsp)
    (add-hook 'astro-ts-mode-hook #'lsp! 'append))
  :config
  (let ((astro-recipe (make-treesit-auto-recipe
                       :lang 'astro
                       :ts-mode 'astro-ts-mode
                       :url "https://github.com/virchau13/tree-sitter-astro"
                       :revision "master"
                       :source-dir "src")))
    (add-to-list 'treesit-auto-recipe-list astro-recipe)))

;;(set-formatter! 'prettier-astro
;; '("npx" "prettier" "--parser=astro"
;;   (apheleia-formatters-indent "--use-tabs" "--tab-width" 'astro-ts-mode-indent-offset))
;;  :modes '(astro-ts-mode))



(use-package org-roam-ui
  ;; :straight
  ;; (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package deft
  :after org
  ;; :bind
  ;; ("C-c n d" . deft)
  :custom
  (deft-directory "~/Documents/Roam")
  ;; (deft-use-filter-string-for-filename t)
  (deft-default-extension '("txt" "org"))
  (deft-recursive t))


(require 'koopa-mode)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . koopa-mode))
;; (add-to-list 'koopa-powershell-cli-arguments "-NoLogo")
(setq koopa-is-running-on-windows t)
