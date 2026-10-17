#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((1, 3, 1, 3), (2, 3, 1, 3), (3, 3, 1, 3), (4, 3, 4, 3), (5, 3, 4, 3), (6, 3, 4, 3), (7, 3, 4, 3))
#show: lineal-theme.with(config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
= Main
== One
A
== Two
B
#show: appendix
= Backup
== One
C
= Extra
== Two
D
