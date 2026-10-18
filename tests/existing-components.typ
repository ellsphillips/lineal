#import "../lib.typ": quote, repository
#import "../src/components/repository.typ": repository-shares
#set page(width: 700pt, height: 500pt, margin: 35pt)
#set text(size: 18pt)
#set align(horizon)
#assert.eq(repository-shares((Typst: 2, Rust: 1)).map(item => item.share), (2 / 3, 1 / 3))
#assert.eq(repository-shares((Typst: 100, Empty: 0)).len(), 1)
#quote[The unattributed form also works.]
#v(15pt)
#quote(author: [A speaker], source: [Conference talk])[Attribution accepts rich content.]
#v(15pt)
#repository(name: "ellsphillips/lineal", languages: (Typst: 2, Rust: 1))
#v(15pt)
#repository(languages: (Typst: 1), ink: rgb("345d8b"))
