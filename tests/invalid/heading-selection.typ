// expect-error: selected ids must exist
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model((), selected: ("missing",))
