#import "../src/navigation/heading-model.typ": get-heading-model

== Repeated
=== Repeated
== Repeated
#context {
  let model = get-heading-model()
  assert.eq(model.entries.map(entry => entry.level), (2, 3, 2))
  assert.eq(model.entries.map(entry => entry.depth), (1, 2, 1))
  assert.eq(model.entries.map(entry => entry.path), ((1,), (1, 1), (2,)))
  assert.eq(model.entries.map(entry => entry.id).dedup().len(), 3)
  assert.eq(model.current.id, model.entries.last().id)
  assert.eq(model.section.id, model.current.id)
}
