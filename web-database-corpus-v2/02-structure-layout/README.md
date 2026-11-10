# Structure and layout

## Complete source files

- [uswds__uswds-site](uswds__uswds-site/) — pinned source files
- [uswds__uswds](uswds__uswds/) — pinned source files
- [twbs__bootstrap](twbs__bootstrap/) — pinned source files

The directories above preserve each source repository's structure, including documentation, code, data, examples, tests, and licenses. This short guide helps you locate the relevant material; use the source files for exact values and APIs.

## Practical guide


**Sources:** [U.S. Web Design System](https://github.com/uswds/uswds-site) and [Bootstrap](https://github.com/twbs/bootstrap). Official material: [USWDS — layout grid](https://designsystem.digital.gov/utilities/layout-grid/), [Bootstrap — grid](https://getbootstrap.com/docs/5.3/layout/grid/), [Bootstrap — containers](https://getbootstrap.com/docs/5.3/layout/containers/).

## Consolidated rules

1. Start with information order: main content, related actions, then supporting material. The grid only implements that hierarchy.
2. Main content should remain understandable without side columns. On small screens, define the block order instead of merely wrapping columns.
3. Similar page types should use consistent containers, spacing, and alignment. Limit text line length for readability.
4. Visual order and HTML order should match wherever users navigate by keyboard or use a screen reader.

## What Bootstrap adds

- **A precise implementation model:** 12 columns, containers → rows → columns, and six standard breakpoints. This makes layout variants explicit in code.
- **Responsive classes:** column width can change by breakpoint; narrow screens usually stack blocks, while wider screens show multiple columns. See the [examples](https://getbootstrap.com/docs/5.3/layout/grid/).
- **Configurable gutters:** horizontal and vertical spacing can be controlled independently, and Sass variables let a project change the grid.
- **Alternative CSS Grid:** the [separate implementation](https://getbootstrap.com/docs/5.3/layout/css-grid/) is useful for two-dimensional layouts. Do not combine it with the standard grid without a reason.

## Page checklist

- Are the main action and heading visible without searching through secondary blocks?
- Does the logical order survive on a phone and at increased zoom?
- Can the text be read without horizontal scrolling?
- Do pages of the same type use the same width and spacing rules?

**Related:** [navigation](../01-navigation/README.md), [content](../03-content-readability/README.md), [visual design](../07-aesthetics/README.md).
