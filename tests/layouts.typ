#import "../lib.typ": layouts
#set page(width: 700pt, height: 500pt, margin: 30pt)
#set text(size: 18pt)
#layouts.columns(widths: (2fr, 1fr),
  layouts.panel[Two shares of the width.],
  layouts.panel[One share.],
)
#v(20pt)
#layouts.frame(width: 100% - 12pt, height: 100pt, inset: 10pt, stroke: gray)[Measured before drawing.]
#v(20pt)
#layouts.frame(width: 180pt, height: 80pt)[Absolute width.]
