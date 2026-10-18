// expect-error: target must select headings only
#import "../../src/navigation/heading-model.typ": get-heading-model
#figure([Diagram], caption: [Example])
#context get-heading-model(target: figure)
