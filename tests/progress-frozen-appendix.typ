#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((0,2,1,2),(1,2,1,2),(2,2,1,2),(2,2,3,2),(3,2,3,2),(3,2,3,2),(4,2,3,2))
#show: lineal-theme.with(section-numbered: false, config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
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
