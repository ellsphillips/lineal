#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#import "@preview/touying:0.7.4": touying-slide-wrapper, touying-slide, utils
#let custom-section(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-common(freeze-slide-counter: true))
  touying-slide(self: self, [A custom section card])
})
#let expected = ((0, 4, 1, 2), (1, 4, 1, 2), (2, 4, 1, 2), (2, 4, 3, 4), (3, 4, 3, 4), (4, 4, 3, 4))
#show: lineal-theme.with(config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected), new-section-slide-fn: custom-section))
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
