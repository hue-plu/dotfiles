# README #

## OSX: mouse acceleration curve off
https://downloads.steelseriescdn.com/drivers/tools/steelseries-exactmouse-tool.dmg
SmoothMouseはKarabinerと競合するため使わない(使うとPointingButton::XX系が封印されてしまう)

## spacemacs
https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Btags/gtags

## iterm2 color scheme
Spacegray

## Settings
https://gist.github.com/hue-plu/e7e303feb2a16de3a944#file-arch-linux

### for haskell
.vim/ftplugin/haskell.vim
setlocal omnifunc=necoghc#omnifunc
$cabal install happy

### 参考
[ウィンドウ、タブのキーマップ](http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca)


## SublimeText3 with vim key binding

### Install Plugins
  * Package Control
  * Mavensmate(Salesforce integration)

  * use like Vim
    * https://github.com/guillermooo/Vintageous
    * https://github.com/SublimeText/Origami
    * https://github.com/rodcloutier/Vintageous-Origami

### Preferences
    ```json
    {
    	"color_scheme": "Packages/Color Scheme - Default/Twilight.tmTheme",
    	"ignored_packages":
    	[
    		"Vintage"
    	],
    	"vintageous_autoindent": true,
    	"vintageous_enable_cmdline_mode": true,
    	"vintageous_hlsearch": true,
    	"vintageous_ignorecase": true,
    	"vintageous_incsearch": true,
    	"vintageous_log_level": "error",
    	"vintageous_magic": true,
    	"vintageous_reset_mode_when_switching_tabs": true,
    	"vintageous_use_ctrl_keys": true,
    	"vintageous_use_sys_clipboard": true,
    	"vintageous_verbose": false
    }

### Key Bindings
```
```json
    {
        "keys": ["ctrl+["],
        "command": "_enter_normal_mode",
        "args": {
            "mode": "mode_insert"
        },
        "context": [{"key": "vi_insert_mode_aware"}]
    },
    {
    	"keys": ["ctrl+]"],
        "command": "goto_definition"
    }

```
### Vivaldi Custom
cp vivaldi_custom_css/custom.css /Applications/Vivaldi.app/Contents/Versions/1.12.955.36/Vivaldi\ Framework.framework/Resources/vivaldi/style/custom.css

write common.css to import custom.css
```common.css
@import "custom.css";
```

* debug
 * open -a /Applications/Vivaldi.app  --args --debug-packed-apps --silent-debugger-extension-api
