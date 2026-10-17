// Heading structure is independent of outline visibility and printed numbering.
#let validate-headings(entries) = {
  assert(type(entries) == array, message: "heading-model: entries must be an array")
  assert(entries.all(entry => type(entry) == dictionary and "id" in entry and "level" in entry),
    message: "heading-model: entries require id and level")
  assert(entries.all(entry => entry.id != none), message: "heading-model: ids must not be none")
  assert(entries.all(entry => type(entry.level) == int and entry.level > 0),
    message: "heading-model: levels must be positive integers")
  let ids = entries.map(entry => entry.id)
  assert(ids.dedup().len() == ids.len(), message: "heading-model: ids must be unique")
}

#let heading-tree(entries) = {
  validate-headings(entries)
  let nodes = ()
  let ancestors = ()
  let sibling-counts = (:)
  for (index, entry) in entries.enumerate() {
    while ancestors.len() > 0 and nodes.at(ancestors.last()).level >= entry.level {
      let closed = ancestors.pop()
      nodes.at(closed).subtree-end = index
    }
    let parent = ancestors.at(-1, default: none)
    let key = if parent == none { "root" } else { str(parent) }
    let ordinal = sibling-counts.at(key, default: 0) + 1
    sibling-counts.insert(key, ordinal)
    let parent-path = if parent == none { () } else { nodes.at(parent).path }
    let root = if parent == none { index } else { nodes.at(parent).root-index }
    nodes.push((
      ..entry, index: index, loc: entry.at("loc", default: entry.id),
      depth: ancestors.len() + 1, path: parent-path + (ordinal,),
      parent-index: parent,
      parent-id: if parent != none { nodes.at(parent).id },
      root-index: root, root-id: entries.at(root).id,
      subtree-end: entries.len(),
    ))
    ancestors.push(index)
  }
  nodes
}

#let heading-relation(entry, current) = {
  if current == none { return none }
  let same = entry.index == current.index
  let parent = entry.index < current.index and current.index < entry.subtree-end
  let child = current.index < entry.index and entry.index < current.subtree-end
  let sibling = not same and entry.parent-index == current.parent-index
  (
    same: same, parent: parent, child: child, sibling: sibling,
    unrelated: not same and not parent and not child and not sibling,
  )
}

#let heading-annotations(entries, current) = entries.map(entry => (
  ..entry, relation: heading-relation(entry, current),
  here-path: if current != none { current.path },
  here-level: if current != none { current.level },
  here-depth: if current != none { current.depth },
  is-current: current != none and entry.id == current.id,
  is-active: false,
))

#let visible-headings(entries, selected, depth, filter) = {
  assert(selected == auto or type(selected) == array,
    message: "heading-model: selected must be auto or an array of ids")
  assert(depth == none or (type(depth) == int and depth > 0),
    message: "heading-model: depth must be none or a positive integer")
  let ids = entries.map(entry => entry.id)
  assert(selected == auto or selected.all(id => id in ids),
    message: "heading-model: selected ids must exist in the structural model")
  entries.filter(entry => {
    if selected != auto and entry.id not in selected { return false }
    if depth != none and entry.level > depth { return false }
    let visible = filter(entry)
    assert(type(visible) == bool, message: "heading-model: filter must return a boolean")
    visible
  })
}

#let build-heading-model(entries, current: none, selected: auto, depth: none, filter: entry => true) = {
  let tree = heading-tree(entries)
  let current-index = tree.position(entry => entry.id == current)
  assert(current == none or current-index != none,
    message: "heading-model: current id must exist in the structural model")
  let current = if current-index != none { tree.at(current-index) }
  let annotated = heading-annotations(tree, current)
  let visible = visible-headings(annotated, selected, depth, filter)
  let ancestors = visible.filter(entry => entry.is-current or (entry.relation != none and entry.relation.parent))
  let active-id = if ancestors.len() > 0 { ancestors.last().id }
  let entries = annotated.map(entry => (..entry, is-active: entry.id == active-id))
  let visible-ids = visible.map(entry => entry.id)
  (
    entries: entries,
    visible: entries.filter(entry => entry.id in visible-ids),
    current: if current-index != none { entries.at(current-index) },
    section: if current != none { entries.at(current.root-index) },
    active: if active-id != none { entries.find(entry => entry.id == active-id) },
  )
}

// Call query adapters inside a context; pure model functions need no context.
#let get-heading-model(target: heading.where(outlined: true), depth: none, filter: entry => true) = {
  let actual = query(heading)
  let selected = query(target)
  assert(selected.all(entry => entry.func() == heading),
    message: "heading-model: target must select headings only")
  let previous = query(selector(heading).before(here(), inclusive: false))
  let current = if previous.len() > 0 { previous.last().location() }
  let entries = actual.map(entry => (
    id: entry.location(), loc: entry.location(), level: entry.level,
    heading: entry, outlined: entry.outlined,
  ))
  build-heading-model(entries, current: current,
    selected: selected.map(entry => entry.location()), depth: depth, filter: filter)
}

#let current-heading(level: auto, outlined: true) = {
  assert(level == auto or (type(level) == int and level > 0),
    message: "heading-model: level must be auto or a positive integer")
  let target = heading.where(outlined: outlined)
  if level != auto { target = target.and(heading.where(level: level)) }
  query(target.before(here(), inclusive: false)).at(-1, default: none)
}

#let headings-context(target: heading.where(outlined: true)) = {
  let model = get-heading-model(target: target)
  (
    headings: model.visible,
    current-heading: if model.active != none { model.active.heading },
    current-heading-idx: if model.active != none {
      model.visible.position(entry => entry.id == model.active.id)
    },
  )
}
