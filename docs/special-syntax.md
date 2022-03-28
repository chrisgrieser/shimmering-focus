---
nav_order: 4
---

# #️⃣ Special Syntax

## Annotation Tags
Type one of the following tags (e.g. `#definition`) to get a colored annotation tag. Also works in Edit Mode. Intended for Annotations when reading academic papers.

![list-of-all-annotation-tags](images/all-annotation-tags.png){: width="250" }

💡 To add your own annotation tags, [use this template](https://github.com/chrisgrieser/shimmering-focus/blob/main/CSS%20Snippets/annotation-tag-template.css).

## Progress Bars
Obsidian does render the [HTML-progress-element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress), and this theme does style the progress bars depending on the degree of completion, if the max value is `10` or `100`.

```html
<progress max="10" value="5"></progress>
```

## Citation Syntax
Using a double-blockquote (`>>`) after a normal blockquote (`>`) will result in text formatted like a citation.

![](https://user-images.githubusercontent.com/73286100/148688725-f0c3e0a6-0712-4ead-b787-cf56dafc8e40.gif)

## Multi-Color-Highlighting
- Surround highlights with `*` or `**` for alternative highlight colors (`*==cyan==*` and `**==yellow==**`).

## Spoiler Syntax
Emphasized Strikethroughs (`*~~spoiler~~*`) will selectively hide text, except when hovered or the active line.
