// expect-error: ratios must have a positive total
#import "../../src/progress.typ": lineal-progress-bar, progress-ratios
#lineal-progress-bar(ratios: (0, 0, 0, 0))
