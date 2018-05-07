Sublime Text 3 Package 
==========================================================

> ***Updated on 2018-03-25 by Alex***

----------------------------------------------------------

## 1. Sublime Text 3 Installation

apt - Ubuntu, Debian Install Usage. [Official Installation Link](http://www.sublimetext.com/docs/3/linux_repositories.html)

  > 1. wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  > 2. sudo apt-get install apt-transport-https
  > 3. echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  > 4. echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  > 5. sudo apt-get update
  > 6. sudo apt-get install sublime-text

## 2. Sublime Package List

  > Menu: Preferences -> Package Control: Install Package
  > HotKey: Ctrl+Shift+P -> Open Command Paletter -> Package Control: Install Package

  * C Improved
  * SideBarEnhancements
  * Terminal
  * HexViewer
  * Git
  * TortoiseSVN
  * CTags
  * Evernote
  * Markdown Editing
  * Markdown Preview
  * MarkdownLivePreview
  * Compare Side-By-Side
  * BracketHighlighter
  * Alignment: Ctrl+Alt+A
  * CoolFormat: Ctrl+Alt+Shift+Q, Ctrl+Alt+Shift+S
  * AllAutocomplete
  * EncodingHelper
  * ConvertToUTF8

### 2.1 Markdown Editing

> Menu: Preferences -> Package Settings -> Markdown Editing -> Markdown GFM Settings - User
> HotKey: Ctrl+Shift+P -> Open Command Paletter -> Preference: Markdown GFM Settings - User

```c
{
    "color_scheme": "Packages/Theme - Brogrammer/brogrammer.tmTheme",

    // Layout
    "draw_centered": false,
    "word_wrap": false,
    "wrap_width": 300,

    // Line
    "line_numbers": true,
    "highlight_line": true,
}
```

### 2.2 Markdown Preview

> Menu: Preferences -> Package Settings -> Markdown Preview -> Settings - Default
> HotKey: Ctrl+Shift+P -> Open Command Paletter -> Preference: Markdown Preview

**Markdown Preview Settings**
`"markdown_filetypes": [".md", ".markdown", ".mdown"],`
`"enable_mathjax": true,`
`"enable_highlight": true,`

**Markdown Preview Keymap**  
`{"keys": ["ctrl+alt+m"], "command": "markdown_preview", "args": {"target": "browser", "parser": "markdown"} },`

### 2.3 MarkdownLivePreview

> Menu: Preferences -> Package Settings -> MarkdownLivePreview -> Settings
> HotKey: Ctrl+Shift+P -> Open Command Paletter -> Preference: MarkdownLivePreview Settings

**MarkdownLivePreview Settings**
`"keep_open_when_opening_preview": true,`

**MarkdownLivePreview Keymap**  
`Ctrl+Shift+P -> Open Command Paletter -> MarkdownLivePreview: Edit Current File`

## 3.0 Sublime Package Theme List 

### 3.1 Theme

  * Predawn
  * Spacegray
  * Material Theme 
  * Soda
  * Boxy
  * Kronuz
  * Monokai (Best)
  * Flatland (Best)
  * A File Icon (Best)
  * Brogrammer (Best)

### 3.2 Color Scheme

  * ColorSublime   " This allows to effictive the color in Sublime

### 3.3 A File Icon

> Menu: Preference -> Package Setting -> A File Icon
> HotKey: Ctrl+Shift+P -> Open Command Paletter -> A File Icon: Settings

**A File Icon Preferences – User**
```c
{
    "color": "#FF8C00",
    //"color": "#EE4000",
    "size": 6,
    "force_mode": true,
}
```

### 3.3 Settings - User

```c
{
    "theme": "Flatland Dark.sublime-theme",
    "color_scheme": "Packages/Theme - Brogrammer/brogrammer.tmTheme"
}
```

## 4.0 Sublime Vintage Mode

Vintage是Sublime Text的vi模式编辑包. [Vintage](http://feliving.github.io/Sublime-Text-3-Documentation/vintage.html)

```
Vintage包含大部分的基本命令：d (delete), y (copy), c (change), gu (lower case), gU (upper case), g~ (swap case), g? (rot13), < (unindent), and > (indent)。
同时也包含许多移动操作，包括l, h, j, k, W, w, e, E, b, B, alt+w (move by sub-words), alt+W (move backwards by sub-words), $, ^, %, 0, G, gg, f, F, t, T, ^f, ^b, H, M, and L.
文本对象的支持，包括词，引号，括号和标签。
重复点号('.')也是支持的， 用于重复指定次数的命令和移动。寄存器也是支持的，有宏命令和书签。许多其它混合命令也支持，比如*, /, n, N, s, S 等等。
哪些没有插入模式时常规的Sublime Text编辑模式，绑定的是Sublime Text常用的快捷键：并没有模仿vi 插入模式的键盘绑定。
通过via命令面板执行的Ex commands没有实现，除了:w和:e。 
```

## 5.0 Sublime Settings User

> Menu: Preference -> Setting - User
> HotKey: Ctrl+Shift+P -> Open Command Paletter -> Preference: Settings

```c
{
	//"font_face": "courier new",            //Windows
	"font_face": "DejaVu Sans Mono",         //Linux
	//"font_face": "DejaVu Sans Mono Book",
	//"font_face": "Consolas",
	//"font_face": "microsoft yahei",
	//"font_face": "microsoft yahei UI",
	//"font_face": "Comic Sans MS",
	//"font_face": "Cambria",
	//"font_face": "Lucida Console",
	//"font_face": "Estrangelo Edessa",
	"font_size": 9,
	"highlight_line": true,
	"scroll_past_end": false,
	"tab_size": 4,
	"translate_tabs_to_spaces": true
	"word_wrap": false,
    "folder_exclude_patterns": [".svn", ".git", ".hg", "CVS"],
    "file_exclude_patterns": 
    [
    	"*.doc", "*.docx", "*.xls", "*.xlsx", "*.graphml",
    	"*.exe", "*.dll", "*.obj","*.o", "*.a", "*.l",
    	"*.zip", "*.rar", 
    ],

    //Sublime Theme
    //"theme": "Soda Dark.sublime-theme",
    //"theme": "Soda Dark 3.sublime-theme",
    "theme": "Flatland Dark.sublime-theme",
    "color_scheme": "Packages/Theme - Brogrammer/brogrammer.tmTheme",

    //Vim Mode, http://feliving.github.io/Sublime-Text-3-Documentation/vintage.html
    //"ignored_packages": ["Vintage"],
    "ignored_packages": [],
    "vintage_ctrl_keys": true,
    "vintage_start_in_command_mode": true,
}
```

## 6.0 Sublime Keymap User

> Menu: Preference -> Key Bindings - User

```c
[
    //Sublime
    { "keys": ["ctrl+shift+u"], "command": "upper_case" },
    { "keys": ["ctrl+shift+l"], "command": "lower_case" },

    { "keys": ["ctrl+shift+t"], "command": "reindent" },
    { "keys": ["ctrl+shift+]"], "command": "indent" },
    { "keys": ["ctrl+shift+["], "command": "unindent" },

    { "keys": ["ctrl+p"], "command": "show_overlay", "args": {"overlay": "goto", "show_files": true} },
    { "keys": ["ctrl+shift+p"], "command": "show_overlay", "args": {"overlay": "command_palette"} },

    { "keys": ["ctrl+j"], "command": "goto_definition" },
    { "keys": ["ctrl+k"], "command": "show_overlay", "args": {"overlay": "goto", "text": ":"} },
    { "keys": ["ctrl+l"], "command": "goto_symbol_in_project" },
    { "keys": ["ctrl+'"], "command": "show_overlay", "args": {"overlay": "goto", "text": "@"} },
    { "keys": ["ctrl+;"], "command": "show_overlay", "args": {"overlay": "goto", "text": "#"} },

    { "keys": ["ctrl+o"], "command": "jump_back" },
    { "keys": ["ctrl+i"], "command": "jump_forward" },
        
    //CTags
    { "keys": ["ctrl+f9"], "command": "rebuild_tags" },
    { "keys": ["ctrl+period"], "command": "navigate_to_definition" },
    { "keys": ["ctrl+comma"], "command": "jump_prev" },
    { "keys": ["ctrl+m"], "command": "search_for_definition" },

    //Markdown Preview
    { "keys": ["ctrl+alt+m"], "command": "markdown_preview", "args": {"target": "browser", "parser": "markdown"} },
]
```   



