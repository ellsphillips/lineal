// expect-error: frame: content exceeds the available height
#import "../../lib.typ": layouts
#layouts.frame(height: 10pt)[#v(100pt) Overflow.]
