#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((0, 0, 1, 0),)
#show: lineal-theme.with(config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
#title-slide()
