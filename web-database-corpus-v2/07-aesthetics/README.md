# Visual design

## Complete source files

- [material-components__material-web](material-components__material-web/) — pinned source files
- [primer__primitives](primer__primitives/) — pinned source files

The directories above preserve each source repository's structure, including documentation, code, data, examples, tests, and licenses. This short guide helps you locate the relevant material; use the source files for exact values and APIs.

## Practical guide


**Sources:** [Material Web](https://github.com/material-components/material-web) and [GitHub Primer Primitives](https://github.com/primer/primitives). Official material: [Material Web docs](https://github.com/material-components/material-web/tree/main/docs), [Primer — foundations](https://primer.style/product/getting-started/foundations/), [Primer — design tokens](https://github.com/primer/primitives#design-token-data).

## Consolidated rules

1. Visual hierarchy should reveal what is primary, supporting, and interactive. Typography, spacing, color, shape, and states create that hierarchy.
2. Store repeated values as tokens so colors, sizes, and spacing remain consistent.
3. Color cannot be the only way to communicate state. Test contrast, visible focus, and zoom against the [accessibility criteria](../06-accessibility/README.md).
4. Brand style should support content and actions instead of distracting from them.

## What Primer Primitives adds

- **Raw structured tokens** in `src/tokens/`: color, typography, spacing, size, motion, and other foundations that can be analyzed or compiled into CSS variables.
- **Multiple modes:** light, dark, and high-contrast variants—a concrete theming model that can be compared with Material Web.
- **Semantic roles:** instead of copying a component's literal color, connect the token to a role such as background, text, or border.
- **Motion control:** animation tokens and guidance account for the system reduced-motion preference. See the [token description](https://github.com/primer/primitives).

## Rule for combining the systems

**Do not mix Material and Primer values in one token set.** Choose one base system for the site and transfer only justified principles or new categories from the other, defining your own values. This follows from the different purposes of their design tokens.

## Page checklist

- Is it easy to distinguish the heading, primary action, secondary action, and disabled state?
- Do similar pages use consistent spacing, typography roles, and colors?
- Do dark mode and increased contrast work when advertised?
- Is animation ever the only carrier of important information?

**Local primary source:** [Material Web](../../material-web-docs/intro.md).
