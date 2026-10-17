// expect-error: data-table cells must be content, strings, numbers, booleans or none
#import "../../src/components/data-table.typ": data-table
#data-table(([Name], [Value]), ((([Nested array], [Wrong cell type]), 2),))
