#import "../src/components/code-block.typ": code-block
#set page(width: 500pt, height: 500pt, margin: 30pt)
#let case = sys.inputs.at("case", default: "valid")
#{
if case == "valid" { code-block("const value = 1;") }
else if case == "height" { code-block("let count = 0;", height: 5pt) }
else if case == "max-height" { code-block("let count = 0;", max-height: 15pt, caption: [This caption is part of the measured height.]) }
else if case == "range" { code-block("let count = 0;", start-line: 20, emphasize: ((19, 21),)) }
else if case == "nowrap" { code-block("const description = \"Words that require wrapping in a small panel\";", width: 150pt, wrap: false) }
else if case == "token" { code-block("unbreakable_identifier_wider_than_the_available_source_column", width: 100pt) }
else if case == "headerless-height" { code-block("let count = 0;", show-header: false, height: 5pt) }
else if case == "headerless-max-height" { code-block("let count = 0;", show-header: false, max-height: 15pt) }
else if case == "headerless-nowrap" { code-block("const description = \"Words that require wrapping in a small panel\";", show-header: false, width: 150pt, wrap: false) }
else if case == "source" { code-block([Content must be a string.]) }
else if case == "style" { code-block("hello", style: (ink: black)) }
else if case == "style-name" { code-block("hello", style: "unavailable") }
else if case == "start-line" { code-block("hello", start-line: 0) }
else if case == "tab-size" { code-block("hello", tab-size: 0) }
else if case == "width" { code-block("hello", width: 0pt) }
else if case == "height-type" { code-block("hello", height: 100%) }
else { panic("unknown code-block test case") }
}
