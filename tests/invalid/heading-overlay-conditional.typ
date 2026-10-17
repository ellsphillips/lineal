// expect-error: overlay headings must form a cumulative prefix
#import "../../lib.typ": lineal-theme, config-common
#import "../../src/navigation/heading-model.typ": get-heading-model
#import "@preview/touying:0.5.3": only, pause

#let inspect(self) = context {
  let model = get-heading-model()
  assert(model.entries.len() > 0)
}
#show: lineal-theme.with(footer-progress: false, config-common(page-preamble: inspect))
= Section
== Slide
#only("1")[
=== First
]
#pause
#only("2")[
=== Second
]
