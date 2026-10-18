// expect-error: repository: language weights must have a positive total
#import "../../lib.typ": repository
#repository(name: "owner/repo", languages: (Typst: 0))
