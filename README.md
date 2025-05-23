# Shimmering Focus ⟡
![Downloads in Obsidian](https://img.shields.io/badge/downloads-239673-6E4E9B?style=plastic&logo=obsidian&color=%23483699)
![GitHub stars](https://img.shields.io/github/stars/chrisgrieser/shimmering-focus?style=plastic&label=%E2%98%85%20Stars)
![Last commit](https://img.shields.io/github/last-commit/chrisgrieser/shimmering-focus?style=plastic)

A minimalistic and opinionated Obsidian theme for the keyboard-centric user.

[🏆 Winner Obsidian October
2022](https://obsidian.md/blog/2022-obsidian-october-winners/) and 10th most
downloaded theme in the Obsidian theme store.

![Promo screenshot](https://github.com/user-attachments/assets/d2b8d0cb-dc16-4967-9046-1b68a518f1ba)

## Table of contents

<!-- toc -->

- [General information](#general-information)
	* [Design philosophy](#design-philosophy)
	* [Features](#features)
	* [Commands](#commands)
- [Advanced customization](#advanced-customization)
	* [Create your own color scheme](#create-your-own-color-scheme)
	* [Standalone snippets](#standalone-snippets)
	* [Contribute to the theme](#contribute-to-the-theme)
- [Credits](#credits)
	* [Licenses](#licenses)
	* [Thanks](#thanks)
	* [About the creator](#about-the-creator)

<!-- tocstop -->

## General information

### Design philosophy
- **Radical minimalism:** As opposed to a minimalism of *colors*, this theme
  focuses on a minimalistic *user interface*: UI elements not relevant for
  keyboard users are hidden, or only shown when needed. All hidden UI elements
  can be permanently re-enabled with the [Style Settings
  Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).
- **Condensed display of information:** Unnecessary padding and white-space is
  removed, which is beneficial for small screens or higher zoom levels.
- **High customizability:** Over a hundred customization options available
  via the [Style Settings
  Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).

### Features
- **Smart hiding of UI elements**: The tab bar is only shown when there is more
  than one tab open, and the sidebar tab buttons are only shown on hover.
- **Images**: Alt-text of images used as **caption**, images can be zoomed in
  via click-and-hold or toggled between reduced and original size via Style
  Settings.
- **Headings**: Distinctive styling and various options for differentiating
  heading levels.
- **Tables**: Highlighting of active cells, alternating row colors
- **Alternative color schemes** submitted by the community are available by
  using the Style Settings Plugin.
- **For writers**: Emphasis of **Pandoc citations** and **footnotes**, extensive
  styling for the [Longform Plugin](https://obsidian.md/plugins?id=longform).
- **For vim users**: Explicit styling of Obsidian's Vim Mode, including various
  settings such as relative line numbers or cursorline highlights.
- **High customizability:** There are over a hundred customization options
  available via the [Style Settings
  Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).

### Commands
When the [Style Settings
Plugin](https://obsidian.md/plugins?id=obsidian-style-settings) is installed,
*Shimmering Focus* adds commands for toggling theme features:
- Toggle folding of URLs (Source Mode)
- Toggle between reduced and original image size (reduced size can be set in the
  respective style setting)
- Toggle readable line length (requires the `Readable line length` setting in
  Obsidian to be enabled.)

### Settings for writers
- Add `cssclasses: writing` to your frontmatter to enable writing-specific
  styling for that note, such as a serif font and justified text. The same
  styling is also applied to all scenes from the [longform plugin](http://github.com/kevboh/longform).
- You can customize the styling with the [Style Settings
  Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).

## Advanced customization

### Create your own color scheme
With *Shimmering Focus*, you can create your own color scheme with this CSS
snippet.

```css
.theme-light.theme-light {
    --bg-hue: 230;
    --bg-sat: 25%;

    /* `--color-accent-hsl` should have the same values as `--color-accent` */
    --color-accent: hsl(184 79% 35%);
    --color-accent-hsl: 184, 79%, 35%;
    --interactive-accent: hsl(184 79% 30%);

    --alt-heading-color: hsl(232 34% 50%);
    --secondary-accent: hsl(28 54% 51%);
    --hover-accent: hsl(328 100% 54%);
    --link-unresolved-color: hsl(101 42% 51%);
}

.theme-dark.theme-dark {
    --bg-hue: 230;
    --bg-sat: 15%;

    /* Note that `--color-accent-hsl` should have the same values as `--color-accent` */
    --color-accent: hsl(184 79% 45%);
    --color-accent-hsl: 184, 79%, 35%;
    --interactive-accent: hsl(184 79% 30%);

    --alt-heading-color: hsl(232 50% 70%);
    --secondary-accent: hsl(28 63% 61%);
    --hover-accent: hsl(328 100% 64%);
	--link-unresolved-color: hsl(101 42% 51%);
}
```

You can [suggest your color scheme for inclusion in Shimmering
Focus](https://github.com/chrisgrieser/shimmering-focus/discussions/categories/suggest-your-color-scheme-for-inclusion-in-shimmering-focus).
Especially submissions of classic, well-known color schemes are welcome.

### Standalone snippets
Some features of this theme are available as standalone snippets. These can be
found in the [snippets directory](./snippets).

### Contribute to the theme
Bug fixes, support for more plugins, or improvements for mobile are welcome.
However, please ask before contributing entirely new features by creating a
Draft PR or an issue.

All relevant source files are located in the [source](./source) directory, and
will be compiled via GitHub action when pushed to GitHub.

The theme uses `lightning-css` for
[syntax-lowering](https://lightningcss.dev/transpilation.html#syntax-lowering)
in its build. That means you can use modern CSS features like
[CSS-nesting](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_nesting),
as the resulting `theme.css` will still be compatible with older Obsidian
installer versions. Furthermore, this theme targets Obsidian installer version
1.1.9, so you can use `:has()`.

The theme is written completely dependency-free in vanilla CSS.

## Credits

### Licenses
- This theme is licensed under the [MIT
  License](https://github.com/chrisgrieser/shimmering-focus/blob/main/LICENSE).
- The two embedded fonts `iA Writer Quattro` and `Recursive` are licensed under
  the [SIL Open Font License](https://www.wikiwand.com/en/SIL_Open_Font_License).
- The embedded `Material Icon` font is licensed under the [Apache
  License](https://developers.google.com/fonts/docs/material_icons#licensing).

### Thanks
- This theme includes snippets and/or ideas from:
  [@SlRvb](https://github.com/SlRvb), [@Atlas](https://github.com/zcysxy),
  [@CecilaMay](https://github.com/ceciliamay),
  [@DamianKorcz](https://github.com/damiankorcz),
  [@Mara-Li](https://github.com/Mara-Li), [@kepano](https://github.com/kepano),
  [@jdanielmourao](https://github.com/jdanielmourao),
  [@deathau](https://github.com/deathau/),
  [@MelvinTing](https://github.com/tingmelvin/),
  [@EmrieCandera](https://github.com/Emrie-Candera),
  [@Chetachie](https://github.com/chetachiezikeuzor),
  [@pryley](https://github.com/pryley), and
  [@joelatschool](https://github.com/joelatschool).
- Many theme features are only possible thanks to the [Style Settings
  Plugin](https://obsidian.md/plugins?id=obsidian-style-settings) by
  [@mgmeyers](https://github.com/mgmeyers).
- Thanks for helping me out in my early days of learning CSS:
  [@SlRvb](https://github.com/SlRvb),
  [@javalent](https://github.com/valentine195), and
  [@NothingIsLost](https://github.com/nothingislost).
- Community-made color schemes:
	* `Gamma` created in collaboration with `@lkadre`.
	* `Everforest` by
	  [@neuromancer](https://github.com/chrisgrieser/shimmering-focus/discussions/291).
	* `Coffee` by
	  [@keara](https://github.com/chrisgrieser/shimmering-focus/discussions/274)
	  and inspired by the [Primary
	  theme](https://github.com/primary-theme/obsidian).
	* `Gruvbox` dark variant by
	  [@jasht1](https://github.com/chrisgrieser/shimmering-focus/discussions/311),
	  light variant by
	  [robrecord](https://github.com/chrisgrieser/shimmering-focus/discussions/257).

### About the creator
In my day job, I am a sociologist studying the social mechanisms underlying the
digital economy. For my PhD project, I investigate the governance of the app
economy and how software ecosystems manage the tension between innovation and
compatibility. If you are interested in this subject, feel free to get in touch.

- [Website](https://chris-grieser.de/)
- [Mastodon](https://pkm.social/@pseudometa)
- [ResearchGate](https://www.researchgate.net/profile/Christopher-Grieser)
- [LinkedIn](https://www.linkedin.com/in/christopher-grieser-ba693b17a/)

> [!IMPORTANT]
> For questions, feature requests, or bug reports, please file an issue via
> [GitHub](https://github.com/chrisgrieser/shimmering-focus/issues/new/choose).
> Due to the number of messages I receive, I am not able to respond to inquiries
> made elsewhere.

<a href='https://ko-fi.com/Y8Y86SQ91' target='_blank'> <img height='36'
style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3'
border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
