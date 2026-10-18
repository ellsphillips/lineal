// expect-error: every data-table row must match the header count
#import "../../src/components/data-table.typ": data-table
#data-table(([Name], [Value]), (([Only one cell],),))
