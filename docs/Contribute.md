---
nav_order: 103
---

# Contribute

## Contribute CSS Snippets
The following types of CSS snippets are self-contained and relatively easy to contribute:
- [CSS Classes](#css-classes), e.g. for tables.
- More built-in styling for the [Supercharged Links Plugin](#built-in-styling-for-supercharged-links).
- Support or fixes for [plugins that are not supported yet](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Shimmering+Focus#Plugin+Compatibility+1).
- [Most open feature requests](https://github.com/chrisgrieser/shimmering-focus/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement) are also relatively easy to implement, I simply haven't gotten the time to get to them.
- Color Schemes which can be selected via Style Settings. Simply use the following template. (Note that these will change, once I added options to customize other colors like accent colors.)

```css
/* template for adding a preset color scheme to Shimmering Focus */
.theme-dark.theme-dark,
.theme-light.theme-light {
	--light-hue: 220;
	--dark-hue: 0;
	--dark-sat: 0%;
	--light-sat: 0%;
	--brightness-light: 15%;
	--brightness-dark: 5%;
}
```

If you have any of those working in a CSS snippet, [please open an issue](https://github.com/chrisgrieser/shimmering-focus/issues/new?assignees=&labels=contribution&template=contribute_css.yml&title=Contribution%3A+) and I'll add them to the theme. 🙂

## Translation of the Theme's Style Settings
Very welcome are [localizations of Style Settings Plugins](https://github.com/mgmeyers/obsidian-style-settings#localization-support), so the theme is more accessible to non-English speakers. This requires no knowledge of CSS. Please [get in touch with me](#about-the-theme-designer) first if you are interested in translating, since this one requires a bit of explanation.