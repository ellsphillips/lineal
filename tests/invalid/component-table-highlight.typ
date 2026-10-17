// expect-error: data-table highlight indices must refer to existing zero-based rows
#import "../../src/components/data-table.typ": data-table
#data-table(([Name],), (([Row],),), highlight: (1,))
