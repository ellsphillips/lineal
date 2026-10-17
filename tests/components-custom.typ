#import "../src/components/callout.typ": callout
#import "../src/components/metric.typ": metric
#import "../src/components/steps.typ": steps
#import "../src/components/data-table.typ": data-table
#import "../src/components/comparison.typ": comparison

#set page(width: 800pt, height: 600pt, margin: 35pt, fill: rgb("#18202c"))
#set text(size: 16pt, fill: white)
#let accent = rgb("#b5d9ff")
#let surface = rgb("#263449")
#let muted = rgb("#c2ccd8")

#callout(title: [Local styling], tone: "neutral", accent: accent, fill: surface, ink: white)[
  Styled content stays selectable. *Emphasis*, #link("https://typst.app")[links] and $x^2$ work as usual.
]

#v(18pt)
#grid(columns: (1fr, 1fr), gutter: 18pt,
  metric([24/7], label: [Coverage], detail: [Across every time zone], accent: accent, ink: white, muted: muted, fill: surface, align: center),
  steps(((title: [Choose a surface], description: [Keep text contrast high.]), [Set the accent]), accent: accent, marker-ink: rgb("#18202c"), ink: white, muted: muted, size: 14pt),
)

#v(18pt)
#data-table(
  ([Item], [Count], [Ready]), (([Reports], 12, true), ([Drafts], 3, false), ([Next batch], none, none)),
  columns: (2fr, 1fr, 1fr), align: (left, right, center), striped: false,
  header-fill: accent, header-ink: rgb("#18202c"), fill: surface, ink: white, rule: rgb("#3f4c60"),
)

#v(18pt)
#comparison(
  [#strong[One paragraph] followed by a short list:
  - First item
  - Second item],
  [#rect(width: 100%, height: 45pt, fill: accent, stroke: none)
  #v(.5em)
  Ordinary Typst figures work too.],
  labels: ([Text], [Graphic]), columns: (1fr, 1fr),
  accent: accent, fill: surface, ink: white, size: 13pt,
)
