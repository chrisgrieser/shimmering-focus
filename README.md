# Shimmering Focus ⟡

A minimalistic [Obsidian](https://obsidian.md/) theme focused on readability and condensed information display.

<!-- manually updated-->
![](https://img.shields.io/badge/downloads-8813-6E4E9B?style=plastic) ![](https://img.shields.io/github/last-commit/chrisgrieser/shimmering-focus?style=plastic) [![](https://img.shields.io/badge/changelog-click%20here-FFE800?style=plastic)](Changelog.md)

<img src="https://raw.githubusercontent.com/chrisgrieser/shimmering-focus/main/dual-theme-screenshot.png" alt="Promo Screenshot">

## Table of Contents
<!-- MarkdownTOC -->

- [Features](#features)
	- [Hiding/Showing UI Elements](#hidingshowing-ui-elements)
	- [Annotation Tags](#annotation-tags)
	- [Max View & Focus View](#max-view--focus-view)
	- [Image-related Features](#image-related-features)
	- [Multi-Color-Highlighting & Spoiler Syntax](#multi-color-highlighting--spoiler-syntax)
	- [Academic Work](#well-suited-for-academic-work)
	- [Fine-tuned Spellcheck \(deprecated\)](#fine-tuned-spellcheck-deprecated)
	- [CSS Classes](#css-classes)
	- [Focus Line Highlight](#focus-line-highlight)
	- [Further Features](#further-features)
- [Design Principles](#design-principles)
	- [Extreme Minimalism](#extreme-minimalism)
	- [Condensed Display of Information](#condensed-display-of-information)
	- [High Readability](#high-readability)
- [Customization](#customization)
	- [Style Settings](#style-settings)
	- [Further Customization Options](#further-customization-options)
- [Compatibility](#compatibility)
	- [List of Compatible Plugins](#list-of-compatible-plugins)
	- [Custom Checkboxes](#custom-checkboxes)
	- [Instructions for specific Plugins](#instructions-for-specific-plugins)
- [Installation](#installation)
- [Contribute](#contribute)
	- [Translation of Style Settings](#translation-of-style-settings)
	- [Plugins & Features](#plugins--features)
- [Related Work](#related-work)
- [Credits](#credits)
	- [About the Developer](#about-the-developer)
	- [Donations](#donations)
	- [Thanks](#thanks)

<!-- /MarkdownTOC -->

## Features

### Hiding/Showing UI Elements
- By default, many UI elements are hidden, directing your focus to what matters – your notes.
- You can re-enable individual hidden UI elements by using the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).
- The status bar, header bar, graph controls, resize handles, and collapse arrows but become visible upon hovering or being active.
- Obsidian 0.13+: in Source Mode, URLs on non-active lines are folded.

💡 The YAML frontmatter in Preview Mode is not removed by this theme, since you can already disable it with the native Obsidian settings under `Settings ➞ Editor ➞ Show Frontmatter`.

<img src="https://user-images.githubusercontent.com/73286100/131692972-e523f2d4-40c7-452c-83ac-a7f2fbd546ae.gif" alt="headerbar visible on hover" width=50%>

### Annotation Tags
Type one of the following eight tags (e.g. `#definition`) to get a colored annotation tag. Also works in Edit Mode. Intended for Annotations when reading academic papers.

<img width=25% alt="Annotation Tags" src="https://user-images.githubusercontent.com/73286100/146721469-c453a9ed-0e28-4923-a171-f1e196c2e6e1.png">

💡 You can add your own Annotation Tags by adding a snippet [using this template](CSS%20Snippets/annotation-tag-template.css).

### Max View & Focus View
- __Max View__ *(disabled by default)*: When the *left* sidebar is hidden, line length is extended to full length, and images & PDFs are expanded to full width. Readable line length and smaller image & PDF size are re-applied when the left sidebar is shown again.[^1] This is useful when dealing with big tables or many images. To enable *Max View* or adjust the size of images & PDFs, use the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).
- __Focus View__ *(disabled by default)*: Hiding the *left* side bar will also hide the *right* sidebar, with the right side bar staying hidden until the left one is shown again. This synergizes with *Max View*, but also works independently. To enable *Focus View*, use the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).

💡  For both features, it is useful to set a hotkey for the built-in command `Toggle left sidebar`.

<img src="https://user-images.githubusercontent.com/73286100/138562271-2f7d3589-d580-49e4-bea6-ca3e3004ab78.gif" alt="Promo Max View" width=60%>

### Image-related Features
- Click & hold an image to zoom (Preview Mode).
- Alt-text is automatically used as image caption (Preview Mode).
- Set a default image size with the Style Settings Plugin.
- You can also use [Max View](#max-view--focus-view) to toggle between reduced and full image sizes.

### Multi-Color-Highlighting & Spoiler Syntax
- Surround highlights with `*` or `**` for alternative highlight colors (`*==cyan==*` and `**==yellow==**`).
- You can use the [Extra Markdown Commands Plugin](https://github.com/chrisgrieser/obsidian-extra-md-commands) to get hotkeys for them.
- Spoiler Syntax: Emphasized Strikethroughs (`*~~spoiler~~*`) will selectively hide text, except when hovered or the active line.

### Academic Work
- Footnote Indicator added to the gutter
- [Pandoc Citations](https://pandoc.org/MANUAL.html#citations-in-note-styles) (`[@citekey]`) and footnotes are visually emphasized
- The alt-text of images is used as caption text, in line with Pandoc's conversion behavior
- Extensive Styling and settings specifically for the [Longform Plugin](https://github.com/kevboh/longform) (see image below). (Prepend a `_` to file names of longform scenes to create sub-scenes.)
- The [Max View](#max-view--focus-view) is useful for displaying wide markdown tables.
- You can also [fine-tune the spell checking](#fine-tuned-spellcheck), e.g. to turn it off in blockquotes when you are regularly citing material where spellcheck creates false positives (e.g. historical sources with old language).
- [Multi-Color-Highlighting](#multi-color-highlighting--spoiler-syntax) and [Annotation Tags](#annotation-tags) have specifically been developed for academic reading.

<img width=70% alt="Screenshot 2022-01-02 17 52 04" src="https://user-images.githubusercontent.com/73286100/147883093-df4e4e9e-2a7d-4dff-bf58-0964ca49ecf6.png">


### Fine-tuned Spellcheck (deprecated)
Using the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/), you can deactivate the spellcheck in specific areas like for example YAML or blockquotes.

*⚠️ Note that this feature only works with the Legacy Editor of Obsidian 0.13+, so it will unfortunately be discontinued.*

### CSS Classes
Add `cssclass: {name}` to your yaml front matter to activate specific styling of the note in Preview Mode. The following CSS classes are built in with this theme (more coming in the future):
- `cssclass: clean-top`: Removes Metadata Information, YAML frontmatter, and Breadcrumbs trail from the top of the note.
- `cssclass: dataview-list-in-table`: If you are using a dataview query where some table cells contain lists, use this CSS class to remove the vertical table lines that are off.

### Focus Line Highlight
![Focused Line Highlight](https://user-images.githubusercontent.com/73286100/147863593-a50fbeb0-04c2-4faf-8253-62abf8efca2d.gif)

In contrast to typical active line highlights, the *focused* line highlight will only highlight the direct line where the cursor is located. However, this feature disables the ability to scroll horizontally, so it is disabled by default and must be enabled in the Style Settings. 

### Further Features
- Relationship lines in various side bar tabs
- File Explorer Icons
- Indicates trailing white spaces when there is more than one space. This is useful for the Markdown [Two Space Rule](https://daringfireball.net/projects/markdown/syntax#p). (Obsidian 0.13+ / new Editor only).
- Active line highlighting
- Customizable Brightness of the Theme
- Dark Mode for PDFs (when using the theme in dark mode)
- Styled [progress bars (`<progress>`)](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress)
- Resizable Graph View Controls (resize at the bottom-right)
- Compatible with [SlRvb's Checkboxes](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/CSS+Snippets/Alternate+Checkboxes+(SlRvb)).

[⬆️ Go Back to Top](#Table-of-Contents)

## Design Principles

### Extreme Minimalism
- This theme is mainly intended for experienced users using mainly the keyboard for navigation.
- As much clutter as possible is removed, letting you focus on content & information that matters.
- You can re-enable all hidden elements by using the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).
- 💡 The settings can still be accessed via `cmd + ,` or `ctrl + ,`.

### Condensed Display of Information
- Screen real estate is used much more efficiently to display more information at the same time.
- Useful for smaller screens, split screens, bigger font sizes, or simply to see more information without having to scroll.
- Images and PDFs are displayed at a smaller sized. (Size can be configured with the Style Settings Plugin,) Click and hold an image to enlarge it again, or use the [Max View Feature](#Max-View).
- Option to trim filenames in the sidebar for even more compactness.

<img width=60% alt="Screenshot 2021-10-23 17 06 22" src="https://user-images.githubusercontent.com/73286100/138561771-1067d041-eeb2-4dfe-8d79-f7fa754ca419.png">

### High Readability
- Theme Brightness is adjustable via [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).
- Wider Input boxes, clearer icons, increased size of small UI elements (e.g. collapse indicators), thicker lines for tables & hr.
- Increased contrast throughout, especially with the [annoying gray font on light-gray background](https://forum.obsidian.md/t/enhance-default-color-contrast-of-the-icons/23045/3).
- Decreased font size variation to increase readability & information density
- At the same time increased distinctiveness of different classes through subtle variation in typeface, font style, or backgrounds.
- Alternating row colors in tables, Command Palette, and Quick Switchers, ...
- Increased readability of bold in dark mode by applying subtle text shadow.
- Plugin names in the Command Palette are moved to the right and more visually distinct.
- Overscroll at the bottom of the editor and settings tabs.
- Easy-to-read fonts for every use case:
	- [iA Writer Quattro](https://github.com/iaolo/iA-Fonts/tree/master/iA%20Writer%20Quattro) as clear sans font for the editor
	- [Recursive](https://www.recursive.design/) for as a clear menu font
	- [Input Mono](https://input.djr.com/) as monospace font for code
	- [Optima](https://en.wikipedia.org/wiki/Optima) as humanist font for headings
	- [Crimson Pro](https://fonts.google.com/specimen/Crimson+Pro) as serif font for Longform notes

<img src="https://user-images.githubusercontent.com/73286100/144147616-59ba2513-78cc-4143-91e5-c222bc307bd9.gif" alt="Screen Recording 2021-12-01 at 00 51 21a" width=60%>

[⬆️ Go Back to Top](#Table-of-Contents)

## Customization

### Style Settings
This themes supports dozens of customization options via the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/). 

<img width=50% alt="Screenshot 2021-12-19 21 12 59" src="https://user-images.githubusercontent.com/73286100/146689428-e29af1e7-92f8-4dce-afda-ef3545743d96.png">

### Further Customization Options
- To add your own annotation tags, [use this template](CSS%20Snippets/annotation-tag-template.css).
- To switch to Outlined [Material Icons](https://fonts.google.com/icons?selected=Material+Icons), add [this CSS snippet](CSS%20Snippets/outlined-material-icons.css).

## Compatibility

### List of Compatible Plugins
*Shimmering Focus* is compatible with and has includes styling for all core plugins, the most common community plugins, as well as about a dozen more community plugins.

➡️ [Full list of compatible plugins.](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Shimmering+Focus#Plugin+Compatibility+1)

### Custom Checkboxes
This theme has been adjusted to be compatible with [SlRvb's Checkboxes](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/CSS+Snippets/Alternate+Checkboxes+(SlRvb)).

### Instructions for specific Plugins
In accordance with the minimalistic philosophy of the theme, unnecessary UI elements of some plugins have also been removed. However, you can still access the full plugin functionality.

- Longform: - Prepend a `_` to file names of longform scenes to create sub-scenes. 
- Kanban: Right-click cards to edit them.
- Sliding Panes: Enable `Swap Rotated Header Direction` in the Sliding Pane Settings.
- Breadcrumbs: Even with buttons removed, you can refresh the index via Command Palette
- Quick Explorer: Re-enable the title bar with the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/) for the breadcrumbs
- Dataview: If the table lines are off, use the [`dataview-list-in-table` CSS Classes](#css-classes)
- Ozan's Image in Editor: Image Sizes are affected by the Image Settings & by the Max View Feature.
- Starred (Core Plugin): To be able to star searches, re-enable the Starred pane buttons with the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/)

## Installation
You can find *Shimmering Focus* in Obsidian's community themes browser under `Obsidian Settings ➞ Appearance ➞ Themes ➞ Manage`.

## Contribute

### Translation of Style Settings
Very welcome are [localizations of Style Settings Plugins](https://github.com/mgmeyers/obsidian-style-settings#localization-support), so the theme is more accessible to non-English speakers. This requires no knowledge of CSS. Please get in touch if you are interested in translating!

### Plugins & Features
Pull requests for plugins or features I haven't implemented are also welcome. If they are bigger changes, be sure to check with me before.

- Try to follow the [design philosophy](#design-principles) of the theme.
- All sections have a `< ` as prefix for quicker navigation. This means you can for example search for `< font` to navigate to the font section.
- For consistency and code quality, use [stylelint](https://stylelint.io/) with the provided configuration (the `.stylelintrc.json` file). If you are not familiar with stylelint, check out [my guide in the Obsidian Hub](https://publish.obsidian.md/hub/04+-+Guides,+Workflows,+&+Courses/Guides/Why+and+How+to+use+Stylelint+for+your+Obsidian+Theme.md).

```shell
git clone git@github.com:chrisgrieser/shimmering-focus.git
cd ./shimmering-focus
npm install stylelint postcss stylelint-config-recommended stylelint-order stylelint-declaration-block-no-ignored-properties
```

## Related Work
If you use Alfred, be sure to check out [my themes for Alfred](https://github.com/chrisgrieser/alfred-themes).

## Credits

### About the Developer
In my day job, I am a researcher in Sociology who also codes some small utilities in his free time. In my PhD project, I investigate the governance of the app economy and how the tension between innovation and compatibility is managed in software ecosystems. If you are interested in this subject, feel free to visit [my academic homepage](https://chris-grieser.de/) and get in touch!

- [Discord](https://discord.gg/veuWUTm): `@pseudometa#9546`
- Twitter: [@pseudo_meta](https://twitter.com/pseudo_meta)

### Donations
Donations are welcome via [PayPal](https://www.paypal.com/paypalme/ChrisGrieser) or [Ko-Fi](https://ko-fi.com/pseudometa). 🙏

### Thanks
Thanks for help and/or CSS snippets:
- **@SlRvb**
- **@javalent**
- @kepano
- @Mara
- @Chetachie
- @Atlas
- @jdaniel
- @NothingIsLost

[⬆️ Go Back to Top](#Table-of-Contents)

[^1]: Requires the `Readable line length` editor setting to be *enabled*.
