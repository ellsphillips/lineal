// expect-error: callout tone must be info, success, warning, danger or neutral
#import "../../src/components/callout.typ": callout
#callout(tone: "urgent")[Invalid tone]
