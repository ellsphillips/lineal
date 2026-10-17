// expect-error: steps direction must be vertical or horizontal
#import "../../src/components/steps.typ": steps
#steps(([First],), direction: "diagonal")
