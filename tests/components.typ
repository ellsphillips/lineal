#import "../src/components/callout.typ": callout
#import "../src/components/metric.typ": metric
#import "../src/components/steps.typ": steps
#import "../src/components/data-table.typ": data-table
#import "../src/components/comparison.typ": comparison

#set page(width: 960pt, height: 540pt, margin: 40pt)
#set text(size: 18pt)
#set par(leading: .5em)

= Components for everyday presentations

#grid(columns: (1fr, 1fr), gutter: 20pt,
  callout(title: [A useful detail])[
    Add context without competing with the main argument.
  ],
  callout(title: [Ready to share], tone: "success")[
    Titles, colours and spacing remain ordinary Typst content.
  ],
)

#v(18pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 14pt,
  metric("82%", label: [Less JavaScript], detail: [Median browser transfer], change: [Lower is better], fill: rgb("#f4f6f7")),
  metric(12, label: [Teams onboarded], detail: [This quarter], align: center),
  metric([1.4 s], label: [Page ready], detail: [Measured over 20 runs]),
)

#pagebreak()
= Processes and comparisons

#steps((
  (title: [Prepare], description: [Gather the source material.]),
  (title: [Review], description: [Check the measurements and examples.]),
  (title: [Publish], description: [Share the finished presentation.]),
), direction: "horizontal")

#v(28pt)
#comparison(
  [Find settings across several configuration files.],
  [Set a named option at the call site.],
  labels: ([Current workflow], [Simpler workflow]),
)

#v(20pt)
#steps(([Draft], [Review]), start: 4, size: 12pt, gap: .5em)

#pagebreak()
= Data with a clear hierarchy

#data-table(
  ([Route], [Before], [After]),
  (([Home], [1.8 MB], [320 KB]), ([Calendar], [1.8 MB], [310 KB]), ([Reader], [3.9 MB], [690 KB])),
  columns: (2fr, 1fr, 1fr), align: (left, right, right), highlight: (2,),
)

#v(20pt)
#data-table(([Empty], [Still valid]), (), striped: false)

#v(20pt)
#callout(tone: "warning", title: [Check the denominator], size: 14pt)[
  Comparisons need the same dataset and measurement conditions.
]
