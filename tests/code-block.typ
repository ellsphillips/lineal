#import "../src/components/code-block.typ": code-block, file-icon, file-label, file-kind, language-info, selected-line, DEFAULT_CODE_THEME, code-block-icon, code-block-title

#assert(file-kind("state.SVELTE.TS") == "svelte-ts")
#assert(file-kind("state.svelte.test.ts") == "ts")
#assert(file-kind("app.tsx") == "tsx")
#assert(file-kind("config.yml") == "yaml")
#assert(file-kind("notes.unknown") == "text")
#assert(language-info("app.svelte", auto).tag == "lineal-svelte")
#assert(language-info("app.svelte.ts", auto).tag == "lineal-svelte-ts")
#assert(language-info("anything", "typescript").label == "TypeScript")
#assert(selected-line(25, (21, (24, 27))))
#assert(not selected-line(23, (21, (24, 27))))

#set page(width: 960pt, height: 680pt, margin: 30pt)
#set text(font: "Libertinus Serif", size: 16pt)
#set block(spacing: 12pt)

= Dark panels and selectable source

#let svelte = ```svelte
<script lang="ts">
  let count = $state(0);
  const label = $derived(`Count: ${count}`);
</script>

<button onclick={() => count++}>
  {label}
</button>

<style>
  button { color: rebeccapurple; }
</style>
```.text
#grid(columns: (1fr, 1fr), gutter: 20pt,
  code-block(svelte, filename: "components/counter.svelte", height: 300pt, start-line: 20, emphasize: ((21, 23), 25)),
  code-block("export class Counter {\n  value = $state(0);\n  /* A multiline comment\n     retains its scope. */\n  label = $derived(`Value:\n${this.value}`);\n}", filename: "state/counter.svelte.ts", height: 300pt, line-numbers: false),
)

#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 20pt,
  file-label("app.tsx", size: 16pt), file-label("app.svelte", size: 16pt),
  file-label("app.svelte.ts", size: 16pt), file-label("source.txt", size: 16pt),
)

#pagebreak()
= Light panels, captions and wrapping

#grid(columns: (1fr, 1fr), gutter: 20pt,
  code-block("const description = \"This is long enough to wrap naturally at word boundaries and still retain one logical source line number.\";\nexport const nextLine = true;", filename: "src/description.ts", style: "light", width: 100%, start-line: 80, emphasize: (80,), caption: [Wrapped source uses one number for each original source line.]),
  code-block("export function Counter() {\n  const [count, setCount] = useState(0);\n  return <button onClick={() => setCount(count + 1)}>\n    {count}\n  </button>;\n}", filename: "counter.tsx", style: "light", caption: [The filename selects TSX highlighting.]),
)

#code-block("first line\r\n\r\n  indented line  \r\n", filename: "spacing.txt", style: "light", width: 60%, line-numbers: false)

#pagebreak()
= Compact excerpts and existing API

#grid(columns: (1fr, 1fr), gutter: 20pt,
  code-block("const label = useMemo(\n  () => `${count}`, [count]\n);", filename: "state.tsx", show-header: false, height: 90pt, max-height: 90pt, start-line: 30, emphasize: (31,)),
  code-block("const label = $derived(`${count}`);", filename: "state.svelte.ts", show-header: false, height: 90pt, max-height: 90pt, start-line: 30, emphasize: (30,)),
)
#code-block(filename: "src/app.py", language: "python", theme: DEFAULT_CODE_THEME, "def hello(name):\n    print(f'Hello, {name}!')")
#code-block-title(title: "src/app.py", language: "python")
#code-block-icon(language: "tsx")

#pagebreak()
= Custom colours and syntax themes

#let custom = (ground: rgb("#eaf2ee"), raised: rgb("#f7fbf9"), ink: rgb("#173f34"), muted: rgb("#527365"), wire: rgb("#b9d2c7"), accent: rgb("#006b4b"), "accent-text": rgb("#00543b"))
#code-block("const greeting = \"Hello\";\nconsole.log(greeting);", filename: "hello.ts", style: custom, emphasize: (2,), caption: [Custom palettes use their ink colour until an explicit syntax theme is supplied.])
#code-block("const greeting = \"Hello\";\nconsole.log(greeting);", filename: "hello.ts", style: "dark", theme: read("../src/components/code/lineal-dark.tmTheme", encoding: none), caption: [A tmTheme file can be passed as bytes.])
#code-block("// Plain source\nconst greeting = \"Hello\";", filename: "hello.ts", style: "light", theme: none, width: 100% - 40pt)
