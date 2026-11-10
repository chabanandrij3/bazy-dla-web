# Website-building knowledge base

**Version:** 2026-11-09. **Language:** English. **Format:** eight topic databases and four specialized supplements.

This is a navigational and practical knowledge base. Each of the eight topics compares **two official sources**: shared guidance is consolidated into one rule, while distinct approaches and data from the second source are recorded separately. Numeric tokens from different design systems are never mixed.

| No. | Topic | Source 1 | Source 2 | Open |
|---|---|---|---|---|
| 1 | Navigation | GOV.UK Design System | GitHub Primer | [Database 1](01-navigation.md) |
| 2 | Structure and layout | U.S. Web Design System | Bootstrap | [Database 2](02-layout.md) |
| 3 | Content and readability | IBM Carbon | GitHub Docs | [Database 3](03-content.md) |
| 4 | Forms | Adobe Spectrum Design Data | Ant Design | [Database 4](04-forms.md) |
| 5 | Functionality | MDN Web Docs | Google Lighthouse | [Database 5](05-functionality.md) |
| 6 | Accessibility | W3C WCAG 2.2 | Deque axe-core | [Database 6](06-accessibility.md) |
| 7 | Visual design | Material Web | GitHub Primer Primitives | [Database 7](07-visual-design.md) |
| 8 | Security | OWASP ASVS / Cheat Sheets | MDN HTTP Observatory | [Database 8](08-security.md) |

**Supplements:** [NN/g, Baymard, Adobe React Aria, and Web Platform Tests](09-supplements.md).

## How to use it

1. Open the topic you are working on.
2. Review the consolidated rules and the “What the second source adds” section.
3. Apply the checklist to the specific page.
4. Open the original source for exact APIs, tokens, and criteria because these details change.

## Local source material

The original [Material Web documentation](../material-web-docs/intro.md) and an [Adobe Spectrum 2 data selection](../material-web-docs/spectrum-supplement/README.md) sit beside this directory. They remain separate sources; this knowledge base provides a topic index and synthesis without duplicating their files.

## Scope and provenance

This is a **curated summary of verified official material**, not complete copies of 16 repositories. Large repositories include build code, tests, version history, and other files outside these topics. Do not assume that every file in every repository was manually read or that every recommendation applies to every site. Sources and exact material are listed in each topic; verify them before implementation. Website security and accessibility must be confirmed by testing the implementation, not by the presence of these notes.
