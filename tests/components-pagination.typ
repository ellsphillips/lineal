#import "../src/components/data-table.typ": data-table

#set page(width: 400pt, height: 270pt, margin: 24pt)
#set text(size: 12pt)

#data-table(([Record], [Status]), range(30).map(index => (str(index + 1), [Ready])), striped: true)
