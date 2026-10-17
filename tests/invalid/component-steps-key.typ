// expect-error: steps items accept only title and description
#import "../../src/components/steps.typ": steps
#steps(((title: [First], descripton: [Misspelled field]),))
