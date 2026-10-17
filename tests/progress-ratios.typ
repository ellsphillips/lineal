#import "../src/progress.typ": progress-ratios
#assert.eq(progress-ratios(1, 1), (0, 1, 0, 0))
#assert.eq(progress-ratios(2, 4, start: 2, end: 3), (.25, .25, .25, .25))
#assert.eq(progress-ratios(2, 4, variant: "broad"), (.5, .5))
#assert.eq(progress-ratios(2, 4, start: 2, end: 3, variant: "near"), (.25, .5, .25))
#assert.eq(progress-ratios(0, 0), (1, 0))
#assert.eq(progress-ratios(8, 4, start: 1, end: 3), (0, 1, 0, 0))
Progress ratios cover empty decks, single slides and section boundaries.
