// expect-error: columns: widths must contain one track per body
#import "../../lib.typ": layouts
#layouts.columns(widths: (1fr,), [First], [Second])
