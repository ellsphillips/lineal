// expect-error: height must be a finite positive length
#import "../../src/progress.typ": lineal-progress-bar
#lineal-progress-bar(height: (calc.inf - calc.inf) * 1pt)
