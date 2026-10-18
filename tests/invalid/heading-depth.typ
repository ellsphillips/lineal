// expect-error: depth must be none or a positive integer
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model((), depth: 0)
