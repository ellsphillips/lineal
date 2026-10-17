#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((1, 5, 1, 3), (1, 5, 1, 3), (2, 5, 1, 3), (2, 5, 1, 3), (2, 5, 1, 3), (3, 5, 1, 3), (4, 5, 4, 5), (4, 5, 4, 5), (5, 5, 4, 5))
#show: lineal-theme.with(config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
= First
Section A
#pause
Section B
== One
A
#pause
B
#pause
C
== Two
D
= Last
Section C
#pause
Section D
== End
E
