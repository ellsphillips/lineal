// expect-error: steps start must be a positive integer
#import "../../src/components/steps.typ": steps
#steps(([First],), start: 0)
