// expect-error: navigation: depth must be a positive integer or none
#import "../../lib.typ": lineal-theme
#show: lineal-theme.with(section-depth: 0)
= Section
== Topic
Content.
