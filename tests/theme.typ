#import "../lib.typ": lineal-theme, title-slide, config-info, config-colors
#set document(date: none)
#show: lineal-theme.with(
  footer-progress: false,
  config-info(title: [Import test], subtitle: [Public package API]),
  config-colors(primary: rgb("345d8b")),
)
#title-slide()
= First section
== First slide
Public imports work without importing Touying separately.
=== Nested heading
Nested headings use a bundled marker.
= Second section
== Second slide
The outline and slide counter follow the headings.
