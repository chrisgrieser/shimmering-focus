# Shimmering Focus ⟡
![Download count](https://img.shields.io/badge/downloads-199075-6E4E9B?style=plastic&logo=obsidian&color=%23483699)
![Last commit](https://img.shields.io/github/last-commit/chrisgrieser/shimmering-focus?style=plastic)

A minimalistic and opinionated Obsidian theme for the keyboard-centric user.  
[🏆 Winner Obsidian October 2022](https://obsidian.md/blog/2022-obsidian-october-winners/).

![Promo Screenshot](https://github.com/user-attachments/assets/d2b8d0cb-dc16-4967-9046-1b68a518f1ba)

---

<!-- toc -->

- [Design philosophy](#design-philosophy)
- [Features](#features)
- [Commands](#commands)
- [Customize colors](#customize-colors)
- [Standalone snippets](#standalone-snippets)
- [Contribute](#contribute)
- [Licenses](#licenses)
- [Credits](#credits)

<!-- tocstop -->

## Design philosophy
- __Radical minimalism:__ As opposed to a minimalism of *colors*, this theme
  focuses on a minimalistic *user interface*: UI elements not relevant for
  keyboard users are hidden, or only shown when needed. All hidden UI elements
  can be permanently re-enabled with the [Style Settings
  Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).
- __Condensed display of information:__ Unnecessary padding and white-space is
  removed, which is beneficial for small screens or higher zoom levels.
- __High customizability:__ Dozens of customization options available via the
  [Style Settings Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).

## Features
- __Smart hiding of UI elements__: The tab bar is only shown when there is more
  than one tab open, and the sidebar tab buttons are only shown on hover.
- __Images__: Alt-text of images used as __caption__, images can be zoomed in
  via click-and-hold or toggled between reduced and original size via Style
  Settings.
- __Tables__: Highlighting of active cells, alternating row colors
- __Vim mode__: Explicit styling of Obsidian's Vim Mode and various
  settings such as relative line numbers.
- __Writing__: Emphasis of __Pandoc citations__ and __footnotes__, extensive
  styling for the [Longform Plugin](https://obsidian.md/plugins?id=longform).
- __Headings__: Distinctive styling and various options for differentiating
  heading levels.
- __Many customization options__ available via [Style
  Settings Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).

## Commands
When the [Style Settings
Plugin](https://obsidian.md/plugins?id=obsidian-style-settings) is installed,
*Shimmering Focus* adds commands for toggling theme features:
- Toggle folding of URLs (Source Mode)
- Toggle between reduced and original image size (reduced size can be set in the
  respective style setting)

## Customize colors
With *Shimmering Focus*, you can create your own color scheme with this CSS
snippet. You are welcome to [share your color
scheme](https://github.com/chrisgrieser/shimmering-focus/discussions/new?category=share-your-custom-color-schemes).

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

/* Hide the background color settings since they are overwritten by the custom colors above */ 
.style-settings-container .setting-item:is([data-id="bg-hue-light"],[data-id="bg-hue-dark"]) {
	display: none;
}
```

## Standalone snippets
Some features of this theme are available as standalone snippets. These can be
found in the [snippets directory](./snippets).

<!-- vale Google.Will = NO -->
## Contribute
Bug fixes, support for more plugins, or improvements for mobile are welcome.
However, please ask before contributing entirely new features by creating a
Draft PR or an issue.

All relevant source files are located in the [source](./source) directory, and
will be compiled via GitHub action when pushed to GitHub.

The theme uses `lightning-css` for
[syntax-lowering](https://lightningcss.dev/transpilation.html#syntax-lowering)
in its build. That means you can use modern CSS features like
[CSS-nesting](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_nesting), as
the resulting `theme.css` will still be compatible with older Obsidian Installer
versions that do not support nesting yet. Furthermore, this theme targets
Obsidian installer version 1.1.9, so feel free to use `:has()`.

The theme is written completely dependency-free in vanilla CSS.

## Licenses
- This theme is licensed under the [MIT
  License](https://github.com/chrisgrieser/shimmering-focus/blob/main/LICENSE).
- The two embedded fonts *iA Writer Quattro* and *Recursive* are licensed under
  the [SIL Open Font License](https://www.wikiwand.com/en/SIL_Open_Font_License).
- The embedded *Material Icon* font is licensed under the [Apache License](https://developers.google.com/fonts/docs/material_icons#licensing).

<!-- vale Google.FirstPerson = NO -->
## Credits
__Thanks__  
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
- Colorschemes
	+ `Gamma` created in collaboration with `@lkadre`.
	+ `Everforest` by
	  [@neuromancer](https://github.com/chrisgrieser/shimmering-focus/discussions/291).
	+ `Coffee` by
	  [@keara](https://github.com/chrisgrieser/shimmering-focus/discussions/274)
	  and inspired by the [Primary
	  theme](https://github.com/primary-theme/obsidian).

__About the developer__  
In my day job, I am a sociologist studying the social mechanisms underlying the
digital economy. For my PhD project, I investigate the governance of the app
economy and how software ecosystems manage the tension between innovation and
compatibility. If you are interested in this subject, feel free to get in touch.

- [Academic Website](https://chris-grieser.de/)
- [ResearchGate](https://www.researchgate.net/profile/Christopher-Grieser)
- [Mastodon](https://pkm.social/@pseudometa)
- [LinkedIn](https://www.linkedin.com/in/christopher-grieser-ba693b17a/)

> [!IMPORTANT]
> For questions, feature requests, or bug reports, please file an issue via
> [GitHub](https://github.com/chrisgrieser/shimmering-focus/issues/new/choose).
> Due to the number of messages I receive, I am not able to respond to inquiries
> made elsewhere.

<a href='https://ko-fi.com/Y8Y86SQ91' target='_blank'>
<img height='36' style='border:0px;height:36px;'
src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3' border='0' alt='Buy Me a Coffee at
ko-fi.com' /></a>
