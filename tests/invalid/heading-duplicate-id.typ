// expect-error: ids must be unique
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model(((id: "same", level: 1), (id: "same", level: 2)))
