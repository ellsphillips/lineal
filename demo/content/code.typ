#import "../../lib.typ": layouts, code-block, file-label

= Code

== Syntax in light and dark

#let counter = ```svelte
<script lang="ts">
  let count = $state(0);
  const label = $derived(`Count: ${count}`);
</script>

<button onclick={() => count++}>
  {label}
</button>
```.text

#layouts.columns(
  code-block(counter, filename: "components/counter.svelte", size: 12pt, padding: 10pt, height: 220pt, emphasize: ((2, 3),)),
  code-block("export class Counter {\n  value = $state(0);\n\n  label = $derived(\n    `Count: ${this.value}`\n  );\n}", filename: "state/counter.svelte.ts", style: "light", size: 12pt, padding: 10pt, height: 220pt, emphasize: (2, (4, 6))),
  gutter: 18pt,
)

#v(14pt)
Selectable source, filename-aware syntax and emphasis on the lines that matter.

== Compact code comparisons

#layouts.columns(
  [*An explicit transformation*
  #v(10pt)
  #code-block("const names = people\n  .filter(person => person.active)\n  .map(person => person.name);", filename: "active-people.ts", show-header: false, size: 12pt, height: 80pt, emphasize: ((2, 3)))],
  [*A reusable helper*
  #v(10pt)
  #code-block("const names = activeNames(people);", filename: "active-people.ts", show-header: false, style: "light", size: 12pt, height: 80pt, emphasize: (1,))],
  gutter: 18pt,
)

#v(22pt)
#code-block("const description = \"Long descriptions wrap at natural text breakpoints while keeping the original source line number.\";", filename: "description.ts", size: 12pt, start-line: 40, emphasize: (40,), caption: [One logical line keeps one number, even when it wraps.], caption-size: 12pt)

== File labels and custom colours

#grid(columns: (1fr, 1fr), column-gutter: 22pt, row-gutter: 15pt,
  file-label("components/counter.svelte", size: 14pt),
  file-label("state/counter.svelte.ts", size: 14pt),
  file-label("components/counter.tsx", size: 14pt),
  file-label("lib/format-date.ts", size: 14pt),
  file-label("content/workshop.typ", size: 14pt),
  file-label("scripts/export.py", size: 14pt),
)

#v(26pt)
#let surface = (
  ground: rgb("#eaf2ee"), raised: rgb("#f7fbf9"),
  ink: rgb("#173f34"), muted: rgb("#527365"),
  wire: rgb("#b9d2c7"), accent: rgb("#006b4b"),
  "accent-text": rgb("#00543b"),
)
#code-block("export const ready = true;\nexport const title = \"Workshop notes\";", filename: "settings.ts", style: surface, size: 12pt, emphasize: (2,))

#v(15pt)
Set a surface palette, inherit the document font and add a custom syntax theme when needed.
