// expect-error: entries require id and level
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model(((id: "missing-level"),))
