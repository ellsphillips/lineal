// expect-error: slide bounds must be finite numbers
#import "../../src/progress.typ": lineal-progress-bar, progress-ratios
#progress-ratios(1, calc.inf)
