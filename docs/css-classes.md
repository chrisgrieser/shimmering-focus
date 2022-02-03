---
nav_order: 6
---

# 📜 CSS Classes

<!-- MarkdownTOC -->

- [How to use CSS classes](#how-to-use-css-classes)
- [General Purpose](#general-purpose)
- [Writing & Academic](#writing--academic)
- [Dataview](#dataview)

<!-- /MarkdownTOC -->

## How to use CSS classes
Add a cssclass to your yaml front matter to activate specific styling of the note in Preview Mode.

```yaml
---
cssclass: name
---
```

The following CSS classes are built in with this theme:

## General Purpose

- `cssclass: clean-top`: Removes Metadata Information, YAML frontmatter, and Breadcrumbs trail from the top of the note.
- `cssclass: clean-embeds`: Embeds in that note are fully embedded, looking like one document.
- `cssclass: list-2-col-cards`: Lists will become cards separated into two columns.

## Writing & Academic
- `cssclass: writing`: Applies alternate note styling for writers. [See here for more information](/shimmering-focus/academics-and-writers) (requires Obsidian 0.13.23).
- `cssclass: bibliography-list`: In preview mode, list items are formatted like an academic bibliography.

![writing cssclass](images/writing-cssclass.gif)

![bibliography cssclass](images/bibliography-list-cssclass.png)

## Dataview
- `cssclass: dataview-list-in-table`: If you are using a dataview query where some table cells contain lists, use this CSS class to remove the vertical table lines that are off.
