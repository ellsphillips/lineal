#import "../src/progress.typ": lineal-progress-bar, get-progress-state
#set page(width: 960pt, height: 540pt, margin: 35pt)
#set text(size: 18pt)
#set block(spacing: 8pt)

Equal finite weights remain visible even when their raw sum overflows.
#lineal-progress-bar(variant: "broad", ratios: (1e308, 1e308), height: 1em)
#v(16pt)
Near groups previous, current and future sections.
#lineal-progress-bar(variant: "near", ratios: (1, 2, 1), height: 18pt)
#v(16pt)
Exact separates completed and remaining slides in the current section.
#lineal-progress-bar(variant: "exact", ratios: (1, 2, 1, 2), height: 18pt)
#v(16pt)
Zero-weight segments preserve the other segments' colours and proportions.
#lineal-progress-bar(variant: "exact", ratios: (0, 3, 0, 2), height: 18pt)
#v(16pt)
An empty deck shows a neutral remaining track.
#grid(columns: (1fr, 1fr, 1fr), gutter: 16pt,
  lineal-progress-bar(variant: "broad", height: 18pt),
  lineal-progress-bar(variant: "near", height: 18pt),
  lineal-progress-bar(height: 18pt),
)
#context {
  assert.eq(get-progress-state(variant: "broad", ratios: (1e308, 1e308)).values, (.5, .5))
  assert.eq(get-progress-state().values, (0, 0, 1, 0))
}
