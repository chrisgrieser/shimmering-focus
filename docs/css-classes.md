---
nav_order: 6
---

# 📜 CSS Classes
Add a cssclass to your yaml front matter to activate specific styling of the note in Preview Mode. 

```yaml
---
cssclass: name
---
```

The following CSS classes are built in with this theme:

- `cssclass: clean-top`: Removes Metadata Information, YAML frontmatter, and Breadcrumbs trail from the top of the note.
- `cssclass: clean-embeds`: Embeds in that note are fully embedded, looking like one document.
- `cssclass: list-2-col-cards`: Lists will become cards separated into two columns.
- `cssclass: writing`: (Obsidian 0.13.20+): Uses a serif font and a tinted background the note.

## Dataview
- `cssclass: dataview-list-in-table`: If you are using a dataview query where some table cells contain lists, use this CSS class to remove the vertical table lines that are off.
- `cssclass: dataview-no-task-links`: If you are using a dataview task query, removes the links to tasks appended to every note.
