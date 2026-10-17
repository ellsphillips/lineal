// expect-error: levels must be positive integers
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model(((id: "bad", level: 0),))
