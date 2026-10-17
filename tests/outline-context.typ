#import "../lib.typ": lineal-theme, config-info, config-colors
#import "../src/outline.typ": lineal-outline, lineal-toc

#set document(date: none)
#show: lineal-theme.with(config-info(title: [Navigation context]),
  config-colors(primary: rgb("#633d88")))
#set text(size: 14pt)

= First section
== Current topic
#lineal-outline(title: [This section], depth: 4, size: 13pt)
=== First detail
Detail content stays in the hierarchy.
==== A deeper detail
It receives another level of indentation.
== Sibling topic remains visible
Context includes the entire current section.

#heading(depth: 1, numbering: none, outlined: false)[Private section]
== A public topic under a hidden root
#lineal-outline(title: [Public topics],
  filter: entry => entry.heading.outlined, size: 13pt)
== Its sibling stays in this private section
It must not attach to the preceding public root.

= An empty section
= Final section
== A long title that wraps naturally across several lines when the available width is deliberately narrow
#lineal-outline(title: [Selected topics], target: heading.where(level: 2), size: 13pt)

== Full hierarchy with a custom transform
#lineal-toc(title: [Programme], depth: 2, size: 12pt,
  transform: (entry, body) => [#if entry.is-current { strong(body) } else { body }])
