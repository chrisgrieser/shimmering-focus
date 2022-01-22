---
nav_order: 2
---

# 🌟 Core Features

<!-- MarkdownTOC -->

- [Hiding/Showing UI Elements](#hidingshowing-ui-elements)
- [Max View & Focus View](#max-view--focus-view)
- [Image-related Features](#image-related-features)

<!-- /MarkdownTOC -->

## Hiding/Showing UI Elements
- By default, many UI elements are hidden, directing your focus to what matters: your notes.
- The sidebar tabs, status bar, header bar, graph controls, resize handles, and collapse arrows are hidden but become visible upon hovering or being active.
- In Source Mode, URLs on non-active lines are folded.
- You can re-enable individual hidden UI elements by using the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).
- The YAML frontmatter in Preview Mode is not removed by this theme, since you can already disable it with the native Obsidian settings under `Settings ➞ Editor ➞ Show Frontmatter`.

![header bar visible on hover](https://user-images.githubusercontent.com/73286100/131692972-e523f2d4-40c7-452c-83ac-a7f2fbd546ae.gif)

![sidebar tabs visible on hover](hidden-tab-sidebars.gif)

## Max View & Focus View
- __Max View__ *(disabled by default)*: When the *left* sidebar is hidden, line length is extended to full length, and images & PDFs are expanded to full width. Readable line length and smaller image & PDF size are re-applied when the left sidebar is shown again. This is useful when dealing with big tables or many images. To enable *Max View* or adjust the size of images & PDFs, use the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).
	- Max View requires the `Readable line length` editor setting to be enabled.
- __Focus View__ *(disabled by default)*: Hiding the *left* side bar will also hide the *right* sidebar, with the right side bar staying hidden until the left one is shown again. This synergizes with *Max View*, but also works independently. To enable *Focus View*, use the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/).

💡  For both features, it is useful to set a hotkey for the built-in command `Toggle left sidebar`.

![Promo Max View](https://user-images.githubusercontent.com/73286100/138562271-2f7d3589-d580-49e4-bea6-ca3e3004ab78.gif)

## Image-related Features
- Click & hold an image to zoom (Preview Mode).
- Alt-text is automatically used as image caption (Preview Mode).
- Set a default image size with the Style Settings Plugin.
- You can also use [Max View](#max-view--focus-view) to toggle between reduced and full image sizes.
