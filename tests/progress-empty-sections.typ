#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((0, 1, 1, 0), (0, 1, 1, 0), (0, 1, 1, 1), (1, 1, 1, 1))
#show: lineal-theme.with(section-numbered: false, config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
= Empty one
= Empty two
= Last
== One
A
