#import "../lib.typ": lineal-theme, title-slide, config-info
#import "../src/theme.typ": slide, focus-slide
#import "@preview/touying:0.7.4": utils
#show: lineal-theme.with(
  config-info(title: [Counter semantics]),
  section-numbered: false,
)
#title-slide()
= First section
== One
First content slide.
== Two
Second content slide.
= Second section
== Three
Third content slide.
== Four
Fourth content slide.
#slide(title: [A manual title])[
  Manual slides increment the logical counter.
  #context assert.eq(utils.slide-counter.get().first(), 5)
]
#focus-slide[
  Focus slides retain the current counter.
  #context assert.eq(utils.last-slide-counter.final().first(), 5)
]
