// expect-error: slide bounds must be finite numbers
#import "../../src/progress.typ": progress-ratios
#progress-ratios(calc.inf - calc.inf, 4)
