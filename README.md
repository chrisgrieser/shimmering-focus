# Shimmering Focus ❖
A minimalistic Obsidian theme focused on readability and condensed information display.

![](https://img.shields.io/github/downloads/chrisgrieser/shimmering-focus/total?label=Downloads&style=plastic)  ![](https://img.shields.io/github/v/release/chrisgrieser/shimmering-focus?label=Latest%20Release&style=plastic)

![Screenshot](https://raw.githubusercontent.com/chrisgrieser/shimmering-focus/main/dual-theme-screenshot.png)


## Features & Design Principles
**minimalistic**
- removes as much clutter as possible, similar to the [hider plugin](https://github.com/kepano/obsidian-hider)
- the statusbar is displayed on hover and less space-consuming
- intended for use with keyboard shortcuts and/or the command palette. (access the settings via `cmd + ,`)
- optional: add the [Hide URLs snippet](https://raw.githubusercontent.com/chrisgrieser/shimmering-focus/main/Hide%20URLs.css) to hide URLs in edit mode
- tip: The [Filename-Heading-Sync Plugin](https://github.com/dvcrn/obsidian-filename-heading-sync) can be used to remove the need for renaming notes (and therefore removes the need for the header bar)
- if you want to keep the titlebar, add search & delete the following snippet from the CSS file:
```css
.view-header {
    display: none;
}
.view-content {
    height: 100%;
}
```

**functional**
- Pseudo-Admonition: `h6` blocks will become a pseudo-admonition box (only works with one-liners though)
- Multi-Color-Highlighting: surround highlights with `*` or `**` for alternative highlight colors (shoutout to @Atlas).
  - `==green highlight==`
  - `*==yellow highlight==*`
  - `**==cyan highlight==**`
- relationship lines in lists & file explorer
- wrapping of text in the file explorer
- active line highlighting
- Material Icons to indicate folder and file types

**suited for academic writing**
- [Pandoc citations](https://pandoc.org/MANUAL.html#citations-in-note-styles) (`[@citekey]`) and footnotes are visually emphasized
- [the alt-text of images is used as caption text](https://gist.github.com/chrisgrieser/4f64b0fc656480ea707d2b45a03acdc0), in line with Pandoc's conversion behavior
- CSS Styling for the [Longform Plugin](https://github.com/kevboh/longform): serif font, justified & hyphenated text

**condensed**
- uses screen real estate more efficiently to display more information (useful for smaller screens)
- smaller images in Preview Mode (in Editor Mode, too, when using [Ozan's Image Plugin](https://github.com/ozntel/oz-image-in-editor-obsidian))
<img src="https://user-images.githubusercontent.com/73286100/131182567-104f85dd-0f99-488d-b511-e45fe8b0486f.png" alt="Screenshot 2021-08-27 22 02 02" width=35% height=35%>  

**accessible**
- increased contrast throughout, especially with the [annoying grey font on light-grey background](https://forum.obsidian.md/t/enhance-default-color-contrast-of-the-icons/23045/3)
- make [Templater](https://github.com/SilentVoid13/Templater) code more readable
- minor coloring of bold in dark mode to make it more readable, since bold in dark mode is harder to distinguish form normal text than  in light mode

**subtle design**  
- apart from the points mentioned, the theme pretty much follows Obsidian's default theme, with [iA Writer Quattro](https://github.com/iaolo/iA-Fonts/tree/master/iA%20Writer%20Quattro) as main font and some shimmering green as secondary accent

## Installation
You can find *Shimmering Focus* in Obsidian's community themes browser under `Settings ➞ Appearance ➞ Themes`.

You can also install *Shimmering Focus* manually by downloading the CSS file and moving it into the folder `.obsidian/themes/` located in your vault. Then, go to `Settings ➞ Appearance ➞ Themes`, reload themes, and select `Shimmering Focus`.

## Credits
Thanks to @kepano, @Mara, @Chetachie, @Eleanor Konik, @SlRvB, @Atlas ,and @Grimdewaldt for some CSS snippets, and thanks to @NothingIsLost, @só erick mesmo, @javalent, and many others from the #css-themes Discord, Channel who helped me figure out CSS in this very first CSS project of mine. **Special Thanks** to @SlRvb who solved so many problems I encountered.

This workflow has been created by @pseudometa ([Discord](https://discord.gg/veuWUTm)) aka [@pseudo_meta (Twitter)](https://twitter.com/pseudo_meta). If you find this theme to be useful, feel free to donate [via PayPal](https://www.paypal.com/paypalme/ChrisGrieser). In my day job, I am a PhD student in sociology, studying the governance of the app economy. If you are interested in this subject, check out [my academic homepage](https://chris-grieser.de/) and get in touch.
