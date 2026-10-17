#import "../../lib.typ": layouts, callout, metric, steps, data-table, comparison, quote, repository

= Components

== Callouts

#callout(title: [A decision needs a little context])[
  Put the important qualification beside the point it explains.
]

#v(14pt)
#layouts.columns(
  callout(title: [Ready for review], tone: "success", size: 14pt)[
    The draft includes the agenda, supporting data and next steps.
  ],
  callout(title: [One dependency remains], tone: "warning", size: 14pt)[
    Confirm the venue before sending the invitation.
  ],
  gutter: 16pt,
)

#v(14pt)
#text(size: 13pt)[Set `title`, choose a `tone`, then write ordinary Typst content.]

== Metrics

Give the value a clear label and enough context to interpret it.

#v(18pt)
#layouts.columns(
  metric(24, label: [Workshops planned], detail: [Across six locations], fill: rgb("#f0f4f6"), value-size: 2.7em),
  metric("86%", label: [Places reserved], change: [+12 percentage points], detail: [Compared with last month], value-size: 2.7em),
  metric([4 weeks], label: [Until launch], detail: [Planning window], value-size: 2.7em),
  gutter: 16pt,
)

#v(20pt)
#callout(tone: "neutral", size: 12pt)[These figures are fictional examples, not measured results.]

== Steps

#steps((
  (title: [Prepare], description: [Collect the source material and agree the audience.]),
  (title: [Review], description: [Check the claims, examples and reading order.]),
  (title: [Share], description: [Publish the PDF and keep the editable source.]),
), direction: "horizontal", size: 15pt, gap: 22pt)

#v(26pt)
#layouts.columns(
  [*For a detailed handover*

  A vertical list leaves room for longer descriptions. Start numbering from any positive integer.],
  steps((
    (title: [Run the rehearsal], description: [Check the timing and links.]),
    (title: [Send the materials], description: [Include the source and final PDF.]),
  ), start: 4, size: 13pt),
  widths: (1fr, 1fr), gutter: 30pt,
)

== Data tables

#data-table(
  ([Session], [Places], [Reserved], [Status]),
  (
    ([Getting started], 30, 24, [Open]),
    ([Working with data], 24, 24, [Full]),
    ([Practical workshop], 20, 17, [Open]),
    ([Questions and feedback], 40, 28, [Open]),
  ),
  columns: (2fr, .8fr, .9fr, 1fr), align: (left, right, right, left),
  highlight: (1,), size: 14pt,
)

#v(18pt)
#layouts.columns(
  [*Keep the useful structure*

  Numeric columns align to the right. A highlighted row draws attention without adding a second legend.],
  [*Stay editable*

  Cells accept text, numbers and rich content. Headers repeat automatically in longer documents.],
  gutter: 26pt,
)

#v(12pt)
#text(size: 12pt)[Fictional workshop schedule.]

== Comparisons

#comparison(
  [
    *Independent sessions*

    People choose the topic that fits their work.

    - Flexible attendance
    - More scheduling choices
    - Each session stands alone
  ],
  [
    *A guided programme*

    A cohort follows the same sequence together.

    - Shared starting point
    - Time for practice between sessions
    - Easier follow-up
  ],
  labels: ([Option A], [Option B]), gap: 20pt, size: 14pt, fill: white,
)

#v(18pt)
Choose the labels, column widths and content. Both panels can hold prose, lists, figures or code.

== Quotes and repositories

#quote(author: [Editorial guideline], size: 17pt, inset: 20pt)[
  Give the audience one clear point to carry into the next conversation.
]

#v(24pt)
#layouts.columns(
  [*Connect the slides to the source*

  Repository links keep examples and implementation close together. Language bars accept any positive weights.],
  repository(name: "ellsphillips/lineal", languages: (Typst: 100), size: 14pt),
  widths: (1.1fr, 1fr), gutter: 32pt,
)
