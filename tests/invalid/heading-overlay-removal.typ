// expect-error: overlay headings must form a cumulative prefix
#import "../../src/navigation/heading-model.typ": collapse-heading-overlays
#collapse-heading-overlays((
  (kind: "slide"), (kind: "subslide"),
  (kind: "heading", entry: (id: "one", signature: "one")),
  (kind: "subslide"),
))
