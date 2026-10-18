#import "../src/progress.typ": get-progress-state

// Expected tuples are (actual logical counter, main-deck total, start, end).
#let check-progress(self, expected) = context {
  let page = here().position().page
  assert(page <= expected.len(), message: "progress fixture produced an unexpected physical page")
  let reference = expected.at(page - 1)
  let state = get-progress-state()
  assert.eq((state.actual-current, state.total, state.start, state.end), reference)
  assert.eq(state.current, calc.min(state.actual-current, state.total))
  for variant in ("broad", "near", "exact") {
    let values = get-progress-state(variant: variant).values
    assert.eq(values.len(), (broad: 2, near: 3, exact: 4).at(variant))
    assert(values.all(value => value >= 0 and value <= 1 and value < calc.inf))
    assert(calc.abs(values.sum() - 1) < 1e-12)
  }
  [#metadata(state) <progress-state>]
}
