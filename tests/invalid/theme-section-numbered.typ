// expect-error: section slide: numbered must be a boolean
#import "../../lib.typ": lineal-theme
#show: lineal-theme.with(section-numbered: "false")
= Section
== Topic
Content.
