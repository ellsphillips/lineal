// expect-error: ratios must be finite non-negative numbers
#import "../../src/progress.typ": lineal-progress-bar, progress-ratios
#lineal-progress-bar(ratios: (1, -1, 1, 1))
