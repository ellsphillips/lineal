#import "../../lib.typ": layouts, callout, steps, colour

= Layouts

== Columns with useful proportions

#layouts.columns(
  [
    #text(size: 24pt, weight: "bold", fill: colour.primary)[Keep the main point in view]

    A wider column carries the explanation. A narrower column holds the supporting detail.

    Change `widths` to fit the content rather than shortening every sentence to fit equal cards.
  ],
  callout(title: [The next decision], size: 14pt)[
    Which example will help this audience understand the idea fastest?
  ],
  widths: (1.6fr, 1fr), gutter: 26pt,
)

#v(26pt)
#layouts.columns(
  layouts.panel([*Equal columns*

  Omit `widths` for a balanced split.], inset: 14pt),
  layouts.panel([*Independent content*

  Use any Typst component in either column.], inset: 14pt),
  gutter: 18pt,
)

== Panels and measured frames

#layouts.columns(
  layouts.panel([
    *A natural-height panel*

    A surface groups related content. It grows with its text and inherits the surrounding typography.

    Change the fill, stroke, inset or radius at the call site.
  ], inset: 20pt),
  layouts.frame([
    #text(weight: "bold")[A fixed frame]
    #v(14pt)
    #steps(([Draft], [Review], [Publish]), size: 13pt)
  ], height: 180pt, inset: 20pt, stroke: .8pt + colour.primary, radius: 6pt),
  gutter: 22pt,
)

#v(24pt)
#callout(title: [Catch layout mistakes while compiling], size: 13pt)[
  A frame reports vertical overflow. It does not crop the content or make the text smaller.
]
