#import "../lib.typ": lineal-theme, config-info, config-common
#import "../src/navigation/heading-model.typ": get-heading-model
#import "@preview/touying:0.5.3": pause

#let inspect(self) = context {
  let model = get-heading-model()
  assert.eq(model.entries.len(), 4)
  assert.eq(model.entries.map(entry => entry.level), (1, 2, 1, 2))
  assert.eq(model.entries.map(entry => entry.path), ((1,), (1, 1), (2,), (2, 1)))
}

#show: lineal-theme.with(footer-progress: false, config-info(title: [Section overlays]), config-common(page-preamble: inspect))
= Repeated
First section reveal.
#pause
Second section reveal.
== Repeated
First authored slide.
= Repeated
Another section reveal.
#pause
Its second reveal.
== Repeated
Another authored slide.
