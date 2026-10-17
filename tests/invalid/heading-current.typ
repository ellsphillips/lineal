// expect-error: current id must exist
#import "../../src/navigation/heading-model.typ": build-heading-model
#build-heading-model((), current: "missing")
