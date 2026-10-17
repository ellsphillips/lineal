#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((0, 4, 1, 2), (1, 4, 1, 2), (2, 4, 1, 2), (2, 4, 3, 4), (3, 4, 3, 4), (4, 4, 3, 4))
#show: lineal-theme.with(section-numbered: false, config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
= First
== A
One
== B
Two
= Last
== A
Three
== B
Four
