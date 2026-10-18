#import "../lib.typ": lineal-theme, config-info, config-common
#import "../src/navigation/heading-model.typ": get-heading-model
#import "@preview/touying:0.7.4": pause

#let inspect(self) = context {
  let model = get-heading-model()
  assert.eq(model.entries.len(), 4)
  assert.eq(model.entries.map(entry => entry.level), (1, 2, 3, 3))
  assert.eq(model.entries.map(entry => entry.path), ((1,), (1, 1), (1, 1, 1), (1, 1, 2)))
}

#show: lineal-theme.with(footer-progress: false, config-info(title: [Handout headings]), config-common(handout: true, page-preamble: inspect))
= Repeated
Section reveal.
#pause
Second reveal.
== Repeated
=== Detail
First detail.
#pause
=== Detail
Second detail.
