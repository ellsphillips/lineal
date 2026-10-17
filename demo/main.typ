#import "../lib.typ": lineal-theme, title-slide, config-info, brand
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

#include "content/index.typ"
