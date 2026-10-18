// expect-error: ratios must be finite non-negative numbers
#import "../../src/progress.typ": lineal-progress-bar, progress-ratios
#lineal-progress-bar(variant: "broad", ratios: (calc.inf, 1))
