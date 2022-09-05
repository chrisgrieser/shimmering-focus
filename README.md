# Shimmering Focus ⟡
![](https://img.shields.io/badge/downloads-36383-6E4E9B?style=plastic) ![](https://img.shields.io/github/last-commit/chrisgrieser/shimmering-focus?style=plastic) [![](https://img.shields.io/badge/changelog-click%20here-FFE800?style=plastic)](https://chrisgrieser.github.io/shimmering-focus/changelog/)

A minimalistic Obsidian theme for keyboard-centric users.

> "The most *aggressively* minimalistic theme I'm aware of."  
> *– [Eleanor Konik, The Obsidian Roundup](https://www.obsidianroundup.org/2022-01-29/)*

## Table of Contents
<!-- MarkdownTOC -->

- [Key Features](#key-features)
- [More Features](#more-features)
- [CSS Classes](#css-classes)
- [Recommended Plugins](#recommended-plugins)
- [Obsidian 0.16](#obsidian-016)
- [Credits](#credits)
	- [About Me](#about-me)
	- [Profiles](#profiles)
	- [Thanks & Credits](#thanks--credits)
- [Buy me a Coffee](#buy-me-a-coffee)

<!-- /MarkdownTOC -->

## Key Features
- __Radical Minimalism:__ UI elements that require the mouse are still accessible on hover. All hidden UI elements can be permanently re-enabled with the [Style Settings Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).
- __Condensed Display of Information:__ Unnecessary padding and white-space is removed, which is beneficial for small screens or higher zoom levels.
- __High Customizability:__ Dozens of customization options available via [Style Settings Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).

## More Features
- Options for __native macOS look__ using the [Style Settings Plugin](https://obsidian.md/plugins?id=obsidian-style-settings).
- Emphasis of __Pandoc Citations__ and __Footnotes__. (Install the [Pandoc Reference List](https://obsidian.md/plugins?id=obsidian-pandoc-reference-list) Plugin for improved styling.)
- Alt-text of __images__ is used as caption, images can be zoomed in by clicking and holding.
- Language Display, Disabled Wrapping, and Line Numbers in __Code Blocks__.
- Extensive Styling for the [Longform Plugin](https://obsidian.md/plugins?id=longform), including alternative background color and serif-fonts for notes in longform projects.
- The only theme (I am aware of) where __Vim Mode__ has been explicitly styled.
- __Annotation Tags__: Tags that are emphasized when used inline (not in the YAML Frontmatter). They are meant as visual guides for reading and literature notes. They include: `#definition`, `#question`, `#goal`, `#todo`, `#summary`, `#important`, `#main`, `#critique`, `#gap`, `#litreview`, `#quote`, `#agree`, `#disagree`, `#example`, `#data`, `#method`, `#idea`, `#epistemic-break`, and `#sidenote`.
- …

## CSS Classes

Add a cssclass to your yaml front matter to enable styling only for this particular note.

```yaml
---
cssclass: name
---
```

Available CSS classes are:
- `full-width`: Disables "Readable Line Length" for the note.
- `writing`: Uses writing-related styling like serif fonts in the note.
- `bibliography-list`: Displays lists in the style of academic bibliographies (Reading Mode).
- `list-2-col-cards`: Turns list items into cards (Reading Mode).
- `remove-dataview-title`: Removes the header from Dataview results.

## Recommended Plugins
- [Style Settings Plugin](https://obsidian.md/plugins?id=obsidian-style-settings): Unlocks dozens of customization options.
- [Supercharged Links](https://obsidian.md/plugins?id=supercharged-links-obsidian): The theme includes various built-in styling for the Supercharged Links plugin, e.g. appending a "🌱" to notes with the `#seedling` tag.
- for macOS: [Electron Window Tweaker](https://obsidian.md/plugins?id=obsidian-electron-window-tweaker): Position the traffic lights for even more native macOS look (same position as in Safari: X = 20, Y = 18). You can even completely hide the traffic lights by using negative values, e.g. X = -60.
- While using the theme, you can disable the Hider Plugin, since *Shimmering Focus* already hides everything it does hide.

## Obsidian 0.16
*Due to Obsidian update 0.16, I had to start a full rewrite of the theme. Since the theme has more than 15,000 lines of CSS, it will unfortunately take quite a bit of time until all previous features are restored. The documentation, to, will be rewritten.*

__Technical Roadmap for 0.16__
- [ ] new Promo Screenshot (16:9, 512 x 288 px)
- [ ] 🎯 PR to `obsidian-releases`, removing `legacy` label and updating screenshot link.

## Credits

### About Me
In my day job, I am a sociologist studying the social mechanisms underlying the digital economy. For my PhD project, I investigate the governance of the app economy and how software ecosystems manage the tension between innovation and compatibility. If you are interested in this subject, feel free to get in touch!

### Profiles
- [Academic Website](https://chris-grieser.de/)
- [ResearchGate](https://www.researchgate.net/profile/Christopher-Grieser)
- [Discord](https://discordapp.com/users/462774483044794368/)
- [GitHub](https://github.com/chrisgrieser/)
- [Twitter](https://twitter.com/pseudo_meta)
- [LinkedIn](https://www.linkedin.com/in/christopher-grieser-ba693b17a/)

*Note that for questions, bug reports, or feature requests for this workflow, it's better if you open an [GitHub issue](https://github.com/chrisgrieser/shimmering-focus/issues), since it is better suited for technical support.*

### Thanks & Credits
- This theme includes snippets or by: [@SlRvb](https://github.com/SlRvb), [@Atlas](https://github.com/zcysxy), [@CecilaMay](https://github.com/ceciliamay), [@DamianKorcz](https://github.com/damiankorcz), [@Mara-Li](https://github.com/Mara-Li), [@kepano](https://github.com/kepano), [@jdanielmourao](https://github.com/jdanielmourao), [@deathau](https://github.com/deathau/), [@MelvinTing](https://github.com/tingmelvin/), [@EmrieCandera](https://github.com/Emrie-Candera), @lkadre, [@Chetachie](https://github.com/chetachiezikeuzor), [@pryley](https://github.com/pryley), and [@chuckharmston](https://gist.github.com/chuckharmston).
- A lot of the theme's features are only possible thanks to the [Style Settings Plugin](https://obsidian.md/plugins?id=obsidian-style-settings) by [@mgmeyers](https://github.com/mgmeyers).
- Many thanks for helping me out in learning CSS in the beginning: [@SlRvb](https://github.com/SlRvb), [@javalent](https://github.com/valentine195), and [@NothingIsLost](https://github.com/nothingislost).

## Buy me a Coffee
<a href='https://ko-fi.com/Y8Y86SQ91' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
