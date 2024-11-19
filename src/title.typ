#import "@preview/touying:0.5.3": *

#import "colour.typ": colour

#let title-slide() = (
  // Create a background with horizontal lines
  let line-count = 20, // Number of lines
  let line-spacing = 10, // Spacing between lines
  for i in range(line-count) {
    [#place(
      horizon + center,
      dy: - i * line-spacing * 1%,
      line(length: 4cm, stroke: 2pt + maroon)
    )
    ]
  }
)

#let title-slide(
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set text(fill: self.colors.neutral-darkest)

    place(
      horizon + center,
      image("../assets/img/title-bg.svg")
    )

    block(
      width: 60%,
      inset: 2cm,
      breakable: false,
      align(
        horizon + left,
        {
          v(40%)
          block(
            inset: 0em,
            breakable: false,
            {
              stack(
                dir: ltr,
                spacing: 1fr,
                info.title,
                info.logo,
              )
              line(
                length: 100%,
                stroke: 2pt + colour.primary,
              )
              if info.subtitle != none {
                parbreak()
                text(size: 1.2em, info.subtitle)
              }
            },
          )
          set text(size: .8em)
          v(1em)
          if info.institution != none {
            parbreak()
            text(size: .9em, info.institution)
          }
          if info.date != none {
            v(20%)
            text(size: .8em, utils.display-info-date(self))
          }
        },
      )
    )
  }
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(
      fill: self.colors.neutral-light,
      margin: 0em
    ),
  )
  touying-slide(self: self, body)
})