// expect-error: comparison needs exactly two labels
#import "../../src/components/comparison.typ": comparison
#comparison([First], [Second], labels: ([Missing label],))
