#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((0, 6, 1, 1), (1, 6, 1, 1), (2, 6, 2, 3), (3, 6, 2, 3), (4, 6, 4, 4), (5, 6, 5, 6), (6, 6, 5, 6))
#show: lineal-theme.with(config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
#title-slide()
== Preamble
Opening content.
= First
== One
A
= Empty
= Last
== End
B
