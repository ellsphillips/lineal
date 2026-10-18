// expect-error: ratios must match the variant's segment count
#import "../../src/progress.typ": lineal-progress-bar, progress-ratios
#lineal-progress-bar(variant: "broad", ratios: (1, 2, 3))
