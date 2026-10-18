#import "../src/navigation/heading-model.typ": collapse-heading-overlays

#let item(id, signature: "same") = (kind: "heading", entry: (id: id, level: 3, signature: signature))
#let events = (
  (kind: "slide"), item("section", signature: "section"),
  (kind: "subslide"), item("a"), item("b"),
  (kind: "subslide"), item("a-copy"), item("b-copy"),
  (kind: "slide"), item("next", signature: "section"), (kind: "subslide"),
)
#let model = collapse-heading-overlays(events)
#assert.eq(model.entries.map(entry => entry.id), ("section", "a", "b", "next"))
#assert.eq(model.aliases.map(alias => alias.canonical), ("section", "a", "b", "a", "b", "next"))

#let plain = collapse-heading-overlays((item("one"), item("two")))
#assert.eq(plain.entries.map(entry => entry.id), ("one", "two"))

#let prefix = collapse-heading-overlays((
  (kind: "slide"), (kind: "subslide"), item("one"),
  (kind: "subslide"), item("one-copy"), item("two"),
))
#assert.eq(prefix.entries.map(entry => entry.id), ("one", "two"))

Overlay ordinals preserve repeated authored headings and collapse replicas.
