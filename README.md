# Shimmering Focus ❖
A minimalistic Obsidian theme focused on readability, condensed information display, and providing some useful functionalities.

![](https://img.shields.io/github/v/release/chrisgrieser/shimmering-focus?label=Latest%20Release&style=plastic)

<img src="https://raw.githubusercontent.com/chrisgrieser/shimmering-focus/main/dual-theme-screenshot.png" alt="Screenshot" width=75% height=75%>

## Features & Design Principles
**Minimalistic**
- removes as much clutter as possible — intended for use with keyboard shortcuts and/or the command palette (access the settings via `cmd + ,`).
- statusbar and headerbar are visible when hovering
- You can permanently re-enable the title bar, header bar, and ribbons (the thin vertical bars to the far left/right) by using the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).

<img src="https://user-images.githubusercontent.com/73286100/131692972-e523f2d4-40c7-452c-83ac-a7f2fbd546ae.gif" alt="headerbar visible on hover" width=50% height=50%>


**Functional**
- Pseudo-Admonition: `h6` blocks will become a pseudo-admonition box (only works with one-liners though)
- Multi-Color-Highlighting: surround highlights with `*` or `**` for alternative highlight colors (thanks to @Atlas for this!)
- Relationship lines in unordered lists & file explorer
- Wrapping of text in the file explorer
- Active line highlighting
- Material Icons to indicate folder and file types
- Display of the language of a code block in Preview Mode

<img width=25% height=25% alt="Screenshot 2021-09-03 21 46 20" src="https://user-images.githubusercontent.com/73286100/132058563-94672224-ed07-473d-9403-8a770984b3d2.png">


**Suited for Academic Writing**
- [Pandoc citations](https://pandoc.org/MANUAL.html#citations-in-note-styles) (`[@citekey]`) and footnotes are visually emphasized
- [the alt-text of images is used as caption text](https://gist.github.com/chrisgrieser/4f64b0fc656480ea707d2b45a03acdc0), in line with Pandoc's conversion behavior
- CSS Styling for the [Longform Plugin](https://github.com/kevboh/longform): serif font, justified & hyphenated text

**Condensed**
- uses screen real estate more efficiently to display more information (useful for smaller screens)
- smaller images in Preview Mode (in Editor Mode, too, when using [Ozan's Image Plugin](https://github.com/ozntel/oz-image-in-editor-obsidian))
<img src="https://user-images.githubusercontent.com/73286100/131182567-104f85dd-0f99-488d-b511-e45fe8b0486f.png" alt="Screenshot 2021-08-27 22 02 02" width=40% height=40%>  

**Accessible & Readable**
- increased contrast throughout, especially with the [annoying grey font on light-grey background](https://forum.obsidian.md/t/enhance-default-color-contrast-of-the-icons/23045/3)
- decreased font size variation to achieve readability and condonsed information at the same time
- at the same time increased distinguishability of different classes through (subtle) variation in typeface, font style, or backgrounds
- uses [Input Mono](https://input.djr.com/) as default monospace font, because of its increased readability
- make [Templater](https://github.com/SilentVoid13/Templater) code more readable
- minor coloring of bold in dark mode to make it more readable, since bold in dark mode is harder to distinguish form normal text than  in light mode

**Subtle Design**  
- Stylistically, the theme pretty much follows Obsidian's default theme, with [iA Writer Quattro](https://github.com/iaolo/iA-Fonts/tree/master/iA%20Writer%20Quattro) as main font and some shimmering green as secondary accent.

**Style Settings Plugin**
- This themes supports the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/) for customization.
- Other then re-enabling the title bar, header bar, and ribbons, you can also change basic features like font-families and header sizes. 

<img width=40% height=40% alt="Screenshot 2021-09-10 22 38 50" src="https://user-images.githubusercontent.com/73286100/132916198-9a1f164b-1f8d-4d65-ba80-bee1d0c41bf3.png">


## Installation
You can find *Shimmering Focus* in Obsidian's community themes browser under `Settings ➞ Appearance ➞ Themes`.

Alternatively, you can also install the theme manually by downloading the CSS file and moving it into the folder `.obsidian/themes/` located in your vault. Then, go to `Settings ➞ Appearance ➞ Themes`, reload themes, and select `Shimmering Focus`.

## Credits
For help and/or CSS snippets, thanks to:
- @kepano
- @Mara
- @Chetachie
- @Eleanor Konik
- @Atlas
- @Grimdewaldt
- @jdaniel
- @só erick mesmo
- @NothingIsLost
- @javalent
- @SlRvb

This theme has been created by @pseudometa ([Discord](https://discord.gg/veuWUTm)) aka [@pseudo_meta (Twitter)](https://twitter.com/pseudo_meta) aka Chris Grieser (rl). If you find this theme to be useful, feel free to donate [via PayPal](https://www.paypal.com/paypalme/ChrisGrieser). In my day job, I am a PhD student in sociology, studying the governance of the app economy. If you are interested in this subject, check out [my academic homepage](https://chris-grieser.de/) and get in touch.
