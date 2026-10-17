#import "../lib.typ": lineal-outline

#set document(date: none)
#set page(width: 600pt, height: 280pt, margin: 24pt)
#set text(size: 12pt)

= A programme with many topics
#lineal-outline(title: [Session navigation], size: 12pt, gap: .45em)

#pagebreak()
#for index in range(34) {
  heading(depth: 2)[Topic #str(index + 1): a short descriptive label]
}
= Follow-up
== Share the materials
The outline must keep all thirty-four earlier topic links.
