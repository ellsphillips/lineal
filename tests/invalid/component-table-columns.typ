// expect-error: data-table columns must match the header count
#import "../../src/components/data-table.typ": data-table
#data-table(([Name], [Value]), (), columns: (1fr,))
