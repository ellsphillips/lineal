#import "../src/navigation/progress-model.typ": progress-ratios, normalize-progress, section-bounds

#let close(actual, expected) = {
  assert(actual.len() == expected.len())
  for (value, reference) in actual.zip(expected) {
    assert(calc.abs(value - reference) < 1e-12)
  }
}

#assert.eq(progress-ratios(1, 1), (0, 1, 0, 0))
#assert.eq(progress-ratios(2, 4, start: 2, end: 3), (.25, .25, .25, .25))
#assert.eq(progress-ratios(2, 4, variant: "broad"), (.5, .5))
#assert.eq(progress-ratios(2, 4, start: 2, end: 3, variant: "near"), (.25, .5, .25))
#assert.eq(progress-ratios(0, 0), (0, 0, 1, 0))
#assert.eq(progress-ratios(0, 0, variant: "near"), (0, 1, 0))
#assert.eq(progress-ratios(0, 0, variant: "broad"), (0, 1))
#assert.eq(progress-ratios(0, 4, start: 1, end: 0), (0, 0, 0, 1))
#assert.eq(progress-ratios(2, 4, start: 3, end: 2), (.5, 0, 0, .5))
#assert.eq(normalize-progress((1e308, 1e308), variant: "broad"), (.5, .5))
#assert.eq(normalize-progress((5e-324, 5e-324), variant: "broad"), (.5, .5))
#close(normalize-progress((1e308, 1, 0, 1e308)), (.5, 5e-309, 0, .5))

#let sections = ((page: 3, before: 1), (page: 6, before: 3))
#assert.eq(section-bounds(sections, 1, 5), (start: 1, end: 1))
#assert.eq(section-bounds(sections, 3, 5), (start: 2, end: 3))
#assert.eq(section-bounds(sections, 6, 5), (start: 4, end: 5))
#assert.eq(section-bounds((), 2, 5), (start: 1, end: 5))

// 31,878 valid boundary/variant combinations cover B <= C <= E <= N.
#for total in range(0, 21) {
  for before in range(0, total + 1) {
    for current in range(before, total + 1) {
      for end in range(current, total + 1) {
        for variant in ("broad", "near", "exact") {
          let values = progress-ratios(current, total, start: before + 1, end: end, variant: variant)
          assert(values.all(value => value >= 0 and value <= 1 and value < calc.inf))
          assert(calc.abs(values.sum() - 1) < 1e-12)
          assert(values.len() == (broad: 2, near: 3, exact: 4).at(variant))
          if total > 0 and variant == "exact" {
            close(values, (before / total, (current - before) / total, (end - current) / total, (total - end) / total))
          }
        }
      }
    }
  }
}
Progress proportions preserve every segment's mathematical meaning.
