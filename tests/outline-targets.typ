#import "../lib.typ": lineal-outline, lineal-toc
#import "../src/outline.typ": current-heading, headings-context

#set document(date: none)
#set page(width: 700pt, height: 500pt, margin: 36pt)
#set text(size: 15pt)

#lineal-outline(title: [Before the first heading], depth: 2)

#pagebreak()
#heading(depth: 2)[An unsectioned topic]
#lineal-outline(title: [Unsectioned navigation], target: heading.where(level: 2))

#pagebreak()
= A section
== A topic
#lineal-outline(title: [Only section headings], target: heading.where(level: 1))

#context {
  assert(current-heading(level: 1).body == [A section])
  let selected = headings-context(target: heading.where(level: 1))
  assert(selected.current-heading.body == [A section])
  assert(selected.current-heading-idx == 0)
}

#pagebreak()
#lineal-toc(title: none, filter: entry => false)
An empty selection produces no generated headings or phantom navigation rows.
