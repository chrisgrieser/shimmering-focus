# Shimmering Focus ⟡

A minimalistic [Obsidian](https://obsidian.md/) theme focused on readability and condensed information display.

<!-- manually updated-->
![](https://img.shields.io/badge/downloads-3672-6E4E9B?style=plastic)

<img src="https://raw.githubusercontent.com/chrisgrieser/shimmering-focus/main/dual-theme-screenshot.png" alt="Promo Screenshot">

## Table of Content
<!-- MarkdownTOC -->

- [Features](#features)
  - [Minimalism](#minimalism)
  - [Annotation Tags](#annotation-tags)
  - [Max View](#max-view)
  - [Image-related Features](#image-related-features)
  - [Fine-tuned Spellcheck](#fine-tuned-spellcheck)
  - [Multi-Color-Highlighting](#multi-color-highlighting)
  - [Features for Academic Work](#features-for-academic-work)
  - [Further Features](#further-features)
- [Design Principles](#design-principles)
  - [Extreme Minimalism](#extreme-minimalism)
  - [Condensed Information Display](#condensed-information-display)
  - [Maximum Readability](#maximum-readability)
  - [Subtle Design](#subtle-design)
- [Customization](#customization)
- [Compatible Plugins](#compatible-plugins)
  - [Information for specific Plugins](#information-for-specific-plugins)
- [Installation](#installation)
- [Credits & Donations](#credits--donations)

<!-- /MarkdownTOC -->

## Features

### Minimalism
- Status bar, header bar, and collapse arrows become visible upon hovering.
- You can re-enable all hidden elements by using the [Style Settings Plugin](#Customization).
- 💡 The settings can still be accessed via `cmd + ,` or `ctrl + ,`.

<img src="https://user-images.githubusercontent.com/73286100/131692972-e523f2d4-40c7-452c-83ac-a7f2fbd546ae.gif" alt="headerbar visible on hover" width=50%>

### Annotation Tags
Type of of the following eight tags (e.g. `#definition`) to get a colored annotation tag. Also works in Edit Mode. Intended for Annotations when reading academic papers.

<img width=12% alt="Screenshot 2021-10-23 16 18 49" src="https://user-images.githubusercontent.com/73286100/138560326-c1bd22c4-dda9-4f92-8edc-ba736524ea75.png">

💡 You can add your own Annotation Tags via adding a snippet [using this template](https://github.com/chrisgrieser/shimmering-focus/blob/main/annotation-tag-template.css).

### Max View
Readable line length and smaller images when left sidebar is shown, full length and full-size images when sidebar is hidden. Useful when dealing with big tables. (Requires `Readable line length` editor setting to be *enabled*.)

<img src="https://user-images.githubusercontent.com/73286100/138562271-2f7d3589-d580-49e4-bea6-ca3e3004ab78.gif" alt="Promo Max View" width=60%>

### Image-related Features
- Click & hold on an image to zoom.
- Alt Text is automatically used as image caption.
- Set default Image Size via Style Settings Plugin.

### Fine-tuned Spellcheck
Using the [Style Settings Plugin](#Customization), you can deactivate the spellcheck in specific areas like YAML or blockquotes.

<img src="https://i.imgur.com/9XPEUQq.png" alt="Spellcheck settings" width=60%>

### Multi-Color-Highlighting
- Surround highlights with `*` or `**` for alternative highlight colors (e.g. `*==cyan==*`).[^2]
- You can use the [Extra Markdown Commands Plugin](https://github.com/chrisgrieser/obsidian-extra-md-commands) to get hotkeys for them.

### Features for Academic Work
- [Pandoc Citations](https://pandoc.org/MANUAL.html#citations-in-note-styles) (`[@citekey]`) and footnotes are visually emphasized
- The alt-text of images is used as caption text, in line with Pandoc's conversion behavior
- Extensive Styling specifically for the [Longform Plugin](https://github.com/kevboh/longform), among other things justified & hyphenated text, and [Crimson Pro](https://fonts.google.com/specimen/Crimson+Pro) as an easy-to-read serif font

### Further Features
- **Pseudo-Admonition**: `h6` blocks will become a pseudo-admonition box (only works with one-liners though)
- **Pseudo-Spoiler-Tags**: Emphasized Strikethroughs (`*~~spoiler~~*`) will selectively hide text, except when hovered or the active line.
- Relationship lines in unordered lists & file explorer
- Active line highlighting
- Dark Mode for PDFs[^3] (when using the theme in dark mode)
- Styled [progress bars (`<progress>`)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress)
- Resizable Graph View Controls[^1] ([See this explanation image.](https://media.discordapp.net/attachments/855181471643861002/909861241055481857/lmao.gif))

## Design Principles

### Extreme Minimalism
- This theme is mainly intended for experienced users using mainly the keyboard for navigation.
- As much clutter as possible is removed, letting you focus on content & information that matters.
- You can re-enable all hidden elements by using the [Style Settings Plugin](#Customization).
- 💡 The settings can still be accessed via `cmd + ,` or `ctrl + ,`.

### Condensed Information Display
- Uses screen real estate more efficiently to display more information.
- Useful for smaller screens, Split Screens, bigger font sizes or simply if want to see more information without having to scroll.
- Smaller images/PDFs. Click-and-Hold or use the [Max View Feature](#Max-View) to enlarge them again.
- Wider input boxes

<img width=40% alt="Screenshot 2021-10-23 17 06 22" src="https://user-images.githubusercontent.com/73286100/138561771-1067d041-eeb2-4dfe-8d79-f7fa754ca419.png">

### Maximum Readability
- increased contrast throughout, especially with the [annoying grey font on light grey background](https://forum.obsidian.md/t/enhance-default-color-contrast-of-the-icons/23045/3)
- decreased font size variation to increase readability & information density
- at the same time increased distinctiveness of different classes through subtle variation in typeface, font style, or backgrounds
- alternating row colors in tables, Command Palette, and Quick Switchers
- easy-to-read fonts for every use case
  - [iA Writer Quattro](https://github.com/iaolo/iA-Fonts/tree/master/iA%20Writer%20Quattro) for regular text.
  - [Input Mono](https://input.djr.com/) as monospace font for code
  - [Optima](https://en.wikipedia.org/wiki/Optima) as humanist heading font
  - [Crimson Pro](https://fonts.google.com/specimen/Crimson+Pro) as serif font for Longform projects
- minor coloring of bold in dark mode to make it more readable, since bold in dark mode is harder to distinguish form normal text than  in light mode
- slightly thicker lines (icons, hr, tables, etc.)

### Subtle Design
Stylistically, the theme pretty much follows Obsidian's default theme, with mostly subtle changes – like the eponymous shimmering green as secondary accent.

## Customization
- This themes supports dozens of customization options via the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).
- [Preview of available style settings.](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Shimmering+Focus#Customization+Options+Style+Settings+Plugin)
- You can add your own Annotation Tags via adding a snippet [using this template](https://github.com/chrisgrieser/shimmering-focus/blob/main/annotation-tag-template.css).

## Compatible Plugins
Shimmering Focus is compatible with and has includes styling for all core plugins, the most common community plugins, as well as a dozen additional community plugins.

➡️ [Full list of compatible plugins.](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Shimmering+Focus#Plugin+Compatibility+1)

### Information for specific Plugins
- Sliding Panes: Enable `Swap Rotated Header Direction` in the Sliding pane Settings.
- Kanban: Right-click cards to edit them.
- Ozan's Image in Editor: Image Sizes are affected by the Image Settings & the Max View Feature.
- Quick Explorer: Re-enable the title bar with the Style Settings Plugin for the breadcrumbs

## Installation
You can find *Shimmering Focus* in Obsidian's community themes browser under ` Obsidian Settings ➞ Appearance ➞ Themes - Manage`.

## Credits & Donations
**Donations** are welcome via [PayPal](https://www.paypal.com/paypalme/ChrisGrieser) or [Ko-Fi](https://ko-fi.com/pseudometa). 🙏

This theme has been created by @pseudometa#9546 ([Discord](https://discord.gg/veuWUTm)) aka [@pseudo_meta (Twitter)](https://twitter.com/pseudo_meta) aka Chris Grieser (rl). In my day job, I am a PhD student in sociology, studying the governance of the app economy. If you are interested in this subject, check out [my academic homepage](https://chris-grieser.de/) and get in touch.

Thanks for help and/or CSS snippets:
- **@SlRvb**
- **@javalent**
- @kepano
- @Mara
- @Chetachie
- @Atlas
- @jdaniel
- @NothingIsLost

[^1]: Thanks to @Manedblackwolf for this.
[^2]: Thanks to @Atlas for this.
[^3]: Thanks to @phibr0 for this.
