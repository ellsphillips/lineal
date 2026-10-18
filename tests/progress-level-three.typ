#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((1, 6, 1, 4), (2, 6, 1, 4), (3, 6, 1, 4), (4, 6, 1, 4), (5, 6, 5, 6), (6, 6, 5, 6))
#show: lineal-theme.with(config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected), slide-level: 3))
= First
== Group A
=== One
A
=== Two
B
== Group B
=== Three
C
= Last
== Group C
=== End
D
