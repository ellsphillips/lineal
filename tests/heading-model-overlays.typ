#import "../lib.typ": lineal-theme, config-info, config-common
#import "../src/navigation/heading-model.typ": get-heading-model
#import "@preview/touying:0.5.3": pause

#let inspect(self) = context {
  let model = get-heading-model()
  assert.eq(model.entries.len(), 5)
  assert.eq(model.entries.map(entry => entry.id).dedup().len(), 5)
  assert.eq(model.entries.map(entry => entry.level), (1, 2, 3, 3, 2))
  assert.eq(model.entries.map(entry => entry.path), ((1,), (1, 1), (1, 1, 1), (1, 1, 2), (1, 2)))
  assert.eq(get-heading-model(target: heading.where(level: 3)).visible.len(), 2)
}

#show: lineal-theme.with(footer-progress: false, config-info(title: [Overlay model]), config-common(page-preamble: inspect))
= Repeated
== Repeated
=== Detail
#context assert.eq(get-heading-model().current.id, get-heading-model().entries.at(2).id)
First detail.
#pause
=== Detail
#context assert.eq(get-heading-model().current.id, get-heading-model().entries.at(3).id)
Second detail.
== Repeated
A second authored slide with the same title remains distinct.
