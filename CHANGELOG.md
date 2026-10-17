# Changelog

## 0.2.0 (unreleased)

- Export the theme, configuration helpers and every content component from the
  package entrypoint. This addresses the missing export reported in issues
  [#5](https://github.com/ellsphillips/lineal/issues/5) and
  [#6](https://github.com/ellsphillips/lineal/issues/6) once the registry release
  is published. Existing `@preview/lineal:0.1.0` imports remain unchanged.
- Add callouts, metrics, numbered steps, data tables and comparisons.
- Extend code blocks with syntax inference, light/dark styles, SVG file marks,
  line numbers, ranges, captions, wrapping and measured overflow checks.
- Add reusable column, panel and fixed-height frame layouts.
- Make quote attribution optional and export `quote` publicly.
- Normalise repository language weights and reject invalid totals.
- Fix nested headings, progress bars without sections and theme logo overrides.
- Add a component gallery, API guides, package smoke tests and compiler checks
  for Typst 0.13.1 and 0.14.2.

### Compatibility

Existing positional `code-block` content and its `filename`, `language` and
`theme` options remain supported. Code panels now default to selectable numbered
source with a matching syntax theme. `theme: none` disables syntax colouring.
Existing layout names remain available.

## 0.1.0

Initial published theme and components. The registry snapshot does not export
`lineal-theme`; use the new release or a source checkout for the full API.
