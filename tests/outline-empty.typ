#import "../src/outline.typ": lineal-outline, lineal-toc
#set document(date: none)
#set page(width: 600pt, height: 300pt, margin: 32pt)

#lineal-toc(title: auto)
#lineal-outline(title: none)

No authored headings means no navigation rows.

#context {
  assert(query(heading).len() == 0, message: "empty navigation must not add headings")
}
