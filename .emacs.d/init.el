;;; emacs 初期設定 rubikitch
;;; http://rubikitch.com/tag/emacs-%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB/

;;; パッケージの設定
(require 'package)

(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

;;; splash screenを無効にする
(setq inhibit-splash-screen t)

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;; C-u C-SPC C-SPC ...でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)

;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;;; ファイルを開いた位置を保存する
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;;; 釣合う括弧をハイライトする
(show-paren-mode 1)

;;; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)

;;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)

;;; CTRL + H で１文字削除
(keyboard-translate ?\C-h ?\C-?)

;;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)

;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ログの記録行数を増やす
(setq message-log-max 10000)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;;; メニューバーとツールバーとスクロールバーを消す
(menu-bar-mode -1)

;;; package.el settings
;;; color theme
(load-theme 'spacegray t t)

;;; 現在行に色をつける
(global-hl-line-mode 1)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択

;;; undo-tree
(when (require 'undo-tree nil t)
(global-undo-tree-mode))

;;; helm
(unless (package-installed-p 'helm)
  (package-refresh-contents) (package-install 'helm))

(require 'helm-config)
(helm-mode 1)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

;;; helm-ls-git - file finder
(unless (package-installed-p 'helm-ls-git)
  (package-refresh-contents) (package-install 'helm-ls-git))
(global-set-key (kbd "C-c C-p") 'helm-ls-git-ls)
(setq helm-ls-git-fuzzy-match t)

;;; helm-ag     - search words in project
(unless (package-installed-p 'helm-ag)
  (package-refresh-contents) (package-install 'helm-ag))
(custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
  '(helm-ag-insert-at-point 'symbol))
(global-set-key (kbd "C-c C-s") 'helm-ag-project-root)

;;; magit       - git client
(unless (package-installed-p 'magit)
  (package-refresh-contents) (package-install 'magit))
(global-set-key (kbd "C-x C-g") 'magit-status)

;;; for haskell
(require 'ghc)
(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

(setq haskell-program-name "~/local/bin/ghci")

(add-hook 'haskell-mode-hook 'inf-haskell-mode)

(defadvice inferior-haskell-load-file (after change-focus-after-load)
  "Change focus to GHCi window after C-c C-l command"
  (other-window 1))
(ad-activate 'inferior-haskell-load-file)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(require 'ac-haskell-process) ; if not installed via package.el
(add-hook 'interactive-haskell-mode-hook 'ac-haskell-process-setup)
(add-hook 'haskell-interactive-mode-hook 'ac-haskell-process-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'haskell-interactive-mode))


