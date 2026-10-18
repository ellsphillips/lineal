#import "../src/navigation/heading-model.typ": build-heading-model

#let cases = ((),)
#let frontier = ((),)
#for _ in range(4) {
  let next = ()
  for prefix in frontier {
    for level in (1, 2, 4) { next.push(prefix + (level,)) }
  }
  frontier = next
  cases += frontier
}
#let cases = cases + ((3, 3, 1, 2), (1, 6, 7, 2), (1, 2, 3, 2, 1, 4, 5, 3))
#for levels in cases {
  let input = levels.enumerate().map(((index, level)) => (id: index, level: level, title: [Repeated]))
  let structural = build-heading-model(input)
  assert.eq(structural.entries.len(), levels.len())
  for node in structural.entries {
    assert.eq(node.path.len(), node.depth)
    assert(node.index < node.subtree-end and node.subtree-end <= levels.len())
    let following = structural.entries.slice(node.index + 1).filter(entry => entry.level <= node.level)
    assert.eq(node.subtree-end, if following.len() > 0 { following.first().index } else { levels.len() })
    let siblings = structural.entries.filter(entry => entry.parent-index == node.parent-index)
    assert.eq(siblings.map(entry => entry.path.last()), range(1, siblings.len() + 1))
    if node.parent-index == none {
      assert.eq(node.depth, 1)
      assert.eq(node.root-id, node.id)
    } else {
      let parent = structural.entries.at(node.parent-index)
      assert(parent.index < node.index and parent.level < node.level)
      assert.eq(node.depth, parent.depth + 1)
      assert.eq(node.root-id, parent.root-id)
      assert.eq(node.path.slice(0, -1), parent.path)
      assert(node.subtree-end <= parent.subtree-end)
      let previous-lower = structural.entries.slice(0, node.index).filter(entry => entry.level < node.level)
      assert.eq(previous-lower.last().id, parent.id)
    }
  }
  for current in input {
    let model = build-heading-model(input, current: current.id)
    assert.eq(model.current.id, current.id)
    assert.eq(model.entries.filter(entry => entry.is-current).len(), 1)
    assert.eq(model.entries.filter(entry => entry.is-active).len(), 1)
    for node in model.entries {
      let flags = node.relation
      assert.eq((flags.same, flags.parent, flags.child, flags.sibling, flags.unrelated).filter(value => value).len(), 1)
    }
    let projected = build-heading-model(input, current: current.id, filter: entry => calc.rem(entry.index, 2) == 0)
    assert.eq(projected.entries.map(entry => entry.path), model.entries.map(entry => entry.path))
    assert.eq(projected.entries.map(entry => entry.root-id), model.entries.map(entry => entry.root-id))
  }
}

Heading forests preserve parent, subtree, identity and relation invariants.
