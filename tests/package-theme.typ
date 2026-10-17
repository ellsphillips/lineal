#import "@preview/lineal:0.2.0": (
  lineal-theme, title-slide, lineal-outline, lineal-progress-bar,
  config-info, config-colors, config-common, config-page, brand, colour,
)

#show: lineal-theme.with(
  config-info(title: [Package smoke test], subtitle: [Lineal 0.2.0], logo: brand.logo),
)

#title-slide()

= Imported theme

== Standard slide

=== Nested heading

The theme, assets, configuration helpers and slide counters work from the installed package.

== Outline

#lineal-outline()
