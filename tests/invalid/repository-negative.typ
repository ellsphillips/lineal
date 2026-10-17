// expect-error: repository: language weights must be non-negative numbers
#import "../../lib.typ": repository
#repository(name: "owner/repo", languages: (Typst: -1))
