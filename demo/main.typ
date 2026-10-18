#import "../lib.typ": lineal-theme, title-slide, lineal-toc, config-info, brand, colour
#set document(title: "Lineal component gallery", date: none)

#show: lineal-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: brand.wordmark,
    subtitle: [Components for clear presentations],
    author: none,
    date: none,
    institution: [Editable examples. A small, clear API.],
    logo: brand.logo,
  ),
)

#set heading(numbering: "1.1")
#set text(size: 16pt)

#title-slide()

#heading(depth: 2, numbering: none, outlined: false)[In this gallery]

#lineal-toc(
  title: none, depth: 1,
  page-numbers: true, page-numbering: "1", fill: repeat[.],
  size: 22pt, gap: 1em, accent: colour.primary,
)

#include "content/index.typ"
