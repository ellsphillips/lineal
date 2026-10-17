#import "../lib.typ": lineal-theme, title-slide, config-common, config-info
#import "../src/theme.typ": slide, focus-slide, new-section-slide
#import "@preview/touying:0.7.4": pause, appendix
#import "progress-assertions.typ": check-progress
#let expected = ((1, 4, 1, 2), (2, 4, 1, 2), (3, 4, 3, 4), (4, 4, 3, 4))
#show: lineal-theme.with(config-info(title: [Progress test]), config-common(page-preamble: self => check-progress(self, expected)))
= First
== One
#context {
  set heading(offset: 0)
  outline(title: [Native contents], depth: 2)
  heading(level: 1, outlined: false)[Decoration]
}
= Hidden section <touying:unoutlined>
== Two
B
