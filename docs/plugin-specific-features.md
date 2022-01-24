---
nav_order: 102
---

# ⚙️ Plugin-Specific Features

<!-- MarkdownTOC -->

- [List of Compatible Plugins](#list-of-compatible-plugins)
- [Instructions for specific Plugins](#instructions-for-specific-plugins)
- [Built-in Styling for Supercharged Links](#built-in-styling-for-supercharged-links)
	- [Setup](#setup)

<!-- /MarkdownTOC -->

## List of Compatible Plugins
*Shimmering Focus* is compatible with and has includes styling for all core plugins, the most common community plugins, as well as about a dozen more community plugins.

➡️ [Full list of compatible plugins.](https://publish.obsidian.md/hub/02+-+Community+Expansions/02.05+All+Community+Expansions/Themes/Shimmering+Focus#Plugin+Compatibility+1)

## Instructions for specific Plugins
In accordance with the minimalistic philosophy of the theme, unnecessary UI elements of some plugins have also been removed. However, you can still access the full plugin functionality.

- __Longform__: Prepend a `_` to file names of longform scenes to create sub-scenes.
- __Kanban__: Right-click cards to edit them.
- __Supercharged Links__: The theme includes [various built-in styling](#built-in-styling-for-supercharged-links). You can turn those of with the Style Settings plugin.
- __Breadcrumbs__: Even with buttons removed, you can still refresh the index via Command Palette. When Supercharged Links is installed, [hovering over a link with the `up` yaml field](#built-in-styling-for-supercharged-links) displays the content of that field.
- __Quick Explorer__: Re-enable the title bar with the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/) for the breadcrumbs
- __Dataview__: Check out the [dataview-specific CSS classes](css-classes#dataview).
- __Ozan's Image in Editor__: Image Sizes are affected by the Image Settings & by the Max View Feature.
- __Sliding Panes__: As long as you are using `rotated headers`, the header is permanently shown.
- __Starred (Core Plugin)__: To be able to star searches, re-enable the Starred pane buttons with the [Style Settings Plugin](https://github.com/mgmeyers/obsidian-style-settings/)

## Built-in Styling for Supercharged Links
This theme includes built-in styling for the [Supercharged Links Plugin](https://github.com/mdelobelle/obsidian_supercharged_links). This means you can make use of the plugin's features without the need write your own CSS! (If you already have your own Supercharged Links setup, you can turn those of with the Style Settings Plugin.) For now the theme includes the following styling:
- Links to _Kanban Boards_ get `🎆` prepended
- Links to notes with the tag `#seedling` get `🌱` prepended
- Notes with `#evergreen` get `🌲` prepended
- Notes with `#moc` get `🗺` prepended
- Notes with `#person` get `👤` prepended
- Notes with `#checklist` get `☑️` prepended
- Links to _Literature Notes_ get a tooltip with the content of the `title` yaml key when hovering and get `📖` prepended. (Actually, this applies to any note with a `title` yaml frontmatter key.)
- Breadcrumbs users: Links to notes with the `up` yaml key get a tooltip with the content of that yaml key, and get `🥖` prepended.

![Demo tooltips](https://publish-01.obsidian.md/access/e25082da1bfe16d54e36618cd5bfee68/00%20-%20Contribute%20to%20the%20Obsidian%20Hub/02%20Attachments/Tooltips-for-Literature-Notes-with-Supercharged-Links.gif)

### Setup
- Install [the plugin](https://github.com/mdelobelle/obsidian_supercharged_links).
- Make sure you have `Parse all tags in the file` enabled in the plugin's settings.
- If you are using the "Page Preview" Core Plugin, configure it to not display previews for the cases where you want the tooltips to show up.
- Paste the following text into the field `Target Attributes for styling`:

```text
kanban-plugin, title, up
```
