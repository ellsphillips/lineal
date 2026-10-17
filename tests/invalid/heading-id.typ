// expect-error: ids must not be none
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model(((id: none, level: 1),))
