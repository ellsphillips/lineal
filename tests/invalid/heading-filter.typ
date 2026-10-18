// expect-error: filter must return a boolean
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model(((id: "one", level: 1),), filter: entry => [Not a boolean])
