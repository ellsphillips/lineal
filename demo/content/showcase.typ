#import "../../lib.typ": layouts, callout, metric, steps, data-table

== A complete team update

#layouts.columns(
  metric(6, label: [Sessions ready], detail: [Fictional programme update], fill: rgb("#f0f4f6"), size: 14pt, value-size: 2.6em),
  callout(title: [On track], tone: "success", size: 14pt)[
    Materials are ready. The final review focuses on accessibility and timing.
  ],
  widths: (1fr, 2fr), gutter: 20pt,
)

#v(20pt)
#layouts.columns(
  [
    #text(weight: "bold")[Next steps]
    #v(12pt)
    #steps((
      (title: [Rehearse], description: [Check timing with the facilitators.]),
      (title: [Publish], description: [Send the slides and source files.]),
    ), size: 12pt)
  ],
  data-table(
    ([Review], [Owner]),
    (([Accessibility], [Morgan]), ([Timing], [Sam]), ([Publishing], [Alex])),
    columns: (1.3fr, 1fr), size: 12pt, highlight: (0,),
  ),
  widths: (1.15fr, 1fr), gutter: 30pt,
)
