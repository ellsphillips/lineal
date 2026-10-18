#import "@preview/lineal:0.2.0": (
  code-block, file-icon, file-label, repository, quote,
  callout, metric, steps, data-table, comparison, layouts,
)

#set page(width: 800pt, height: 650pt, margin: 35pt)
#set text(size: 14pt)

#file-label("src/state.svelte.ts")
#v(10pt)
#code-block("let count = $state(0);", filename: "counter.svelte.ts", size: 14pt)
#v(10pt)
#callout(title: [Ready to use])[Components imported through the published package API.]
#v(10pt)
#grid(columns: (1fr, 1fr), gutter: 15pt,
  metric([42], label: [Responses], detail: [From the latest survey]),
  steps(([Write], [Review], [Share]), size: 12pt),
)
#v(10pt)
#data-table(([Name], [Count]), (([Reports], 12), ([Drafts], 3)))
#v(10pt)
#comparison([Original], [Revised], labels: ([Before], [After]), size: 12pt)

#pagebreak()
#repository(name: "ellsphillips/lineal", languages: (Typst: 2, Python: 1))
#v(20pt)
#quote(author: "A reader")[A useful component should be straightforward to adapt.]
#v(20pt)
#layouts.two-boxes([Left], [Right])
