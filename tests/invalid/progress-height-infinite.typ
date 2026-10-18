// expect-error: height must be a finite positive length
#import "../../src/progress.typ": lineal-progress-bar, progress-ratios
#lineal-progress-bar(height: calc.inf * 1pt)
