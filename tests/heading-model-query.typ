#import "../src/navigation/heading-model.typ": get-heading-model, current-heading, headings-context

#context {
  let model = get-heading-model()
  assert.eq(model.current, none)
  assert.eq(model.section, none)
  assert.eq(model.active, none)
  assert.eq(current-heading(), none)
}

#set heading(numbering: "1.1")
= Repeated
== Repeated
#heading(level: 3, outlined: false, numbering: none)[Repeated]
#context {
  let model = get-heading-model()
  assert.eq(model.entries.len(), 5)
  assert.eq(model.visible.len(), 3)
  assert.eq(model.current.level, 3)
  assert.eq(model.active.level, 2)
  assert.eq(model.current.root-id, model.entries.first().id)
  assert.eq(current-heading(level: 1).level, 1)
  assert.eq(current-heading(outlined: false).level, 3)
  let roots = get-heading-model(target: heading.where(level: 1))
  assert.eq(roots.current.level, 3)
  assert.eq(roots.active.level, 1)
  assert.eq(roots.visible.len(), 2)
  let hidden = get-heading-model(target: heading.where(outlined: false))
  assert.eq(hidden.active.level, 3)
  let compatibility = headings-context(target: heading.where(level: 1))
  assert.eq(compatibility.current-heading.level, 1)
  assert.eq(compatibility.current-heading-idx, 0)
}

#heading(level: 1, outlined: false)[Hidden section]
== Visible child
#context {
  let model = get-heading-model()
  assert.eq(model.section.heading.body, [Hidden section])
  assert.eq(model.current.root-id, model.section.id)
  assert(not model.visible.any(entry => entry.id == model.section.id))
  assert.eq(model.current.depth, 2)
}
