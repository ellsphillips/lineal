#import "../src/navigation/heading-model.typ": build-heading-model

#let records(levels) = levels.enumerate().map(((index, level)) => (id: str(index), level: level))
#let model = build-heading-model(records((1, 3, 2, 3)), current: "3")
#assert.eq(model.entries.map(entry => entry.path), ((1,), (1, 1), (1, 2), (1, 2, 1)))
#assert.eq(model.entries.map(entry => entry.depth), (1, 2, 2, 3))
#assert.eq(model.entries.map(entry => entry.level), (1, 3, 2, 3))
#assert.eq(model.entries.map(entry => entry.parent-id), (none, "0", "0", "2"))
#assert.eq(model.entries.map(entry => entry.root-id), ("0", "0", "0", "0"))
#assert.eq(model.entries.map(entry => entry.subtree-end), (4, 2, 4, 4))
#assert.eq(model.current.id, "3")
#assert.eq(model.section.id, "0")
#assert.eq(model.active.id, "3")

#let flat = build-heading-model(records((2, 3, 2)), current: "2")
#assert.eq(flat.entries.map(entry => entry.path), ((1,), (1, 1), (2,)))
#assert.eq(flat.entries.map(entry => entry.root-id), ("0", "0", "2"))

#let deep = build-heading-model(records((1, 6, 7, 2)))
#assert.eq(deep.entries.map(entry => entry.depth), (1, 2, 3, 2))
#assert.eq(deep.entries.map(entry => entry.path), ((1,), (1, 1), (1, 1, 1), (1, 2)))
#assert.eq(deep.current, none)
#assert.eq(deep.section, none)
#assert.eq(deep.active, none)
#assert(deep.entries.all(entry => entry.relation == none))

#let empty = build-heading-model(())
#assert.eq(empty.entries, ())
#assert.eq(empty.visible, ())
#assert.eq(empty.current, none)

#let hidden-root = build-heading-model(records((1, 2, 2, 1, 2)), current: "2", selected: ("1", "2", "4"))
#assert.eq(hidden-root.visible.map(entry => entry.id), ("1", "2", "4"))
#assert.eq(hidden-root.section.id, "0")
#assert.eq(hidden-root.visible.map(entry => entry.root-id), ("0", "0", "3"))
#assert.eq(hidden-root.visible.map(entry => entry.depth), (2, 2, 2))

#let selected = build-heading-model(records((1, 2, 3)), current: "2", selected: ("0",))
#assert.eq(selected.current.id, "2")
#assert.eq(selected.active.id, "0")
#assert.eq(selected.visible.first().is-active, true)
#assert.eq(selected.visible.first().relation.parent, true)

#let filtered = build-heading-model(records((1, 2, 3)), current: "2", filter: entry => entry.level < 3)
#assert.eq(filtered.active.id, "1")
#assert.eq(filtered.entries.last().path, (1, 1, 1))
#assert.eq(filtered.current.id, "2")
#assert.eq(build-heading-model(records((2, 3)), depth: 1).visible, ())

Canonical heading paths and visibility projections are asserted above.
