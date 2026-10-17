#import "../src/outline.typ": lineal-outline, lineal-toc

#set document(date: none)
#set page(width: 740pt, height: 540pt, margin: 36pt, numbering: "i")
#set text(size: 16pt)
#counter(page).update(4)

#lineal-toc(title: [Workshop programme], page-numbers: true,
  page-numbering: "i", fill: repeat[.], gap: .6em)

#context {
  let authored = query(heading)
  assert(authored.len() == 7, message: "plain navigation titles must not create headings")
  let first = authored.first()
  assert(counter(page).at(first.location()).first() == 5,
    message: "TOC numbers must use logical page counters after resets")
}

#pagebreak()
= Prepare the workshop
== Agree the audience and the outcome
Keep the agenda close to the decision it supports.
=== Check the source material
Match every example to its intended audience.
== Confirm the practical details
Share the location, access requirements and joining instructions.

#pagebreak()
= Share the materials
== Publish the editable source
Keep related diagrams, examples and assets together.
== Collect useful feedback
Ask what the audience will use next.

#pagebreak()
#lineal-outline(title: [Current section], size: 14pt, accent: rgb("#633d88"))
