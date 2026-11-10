# Accessibility

## Complete source files

- [w3c__wcag](w3c__wcag/) — pinned source files
- [dequelabs__axe-core](dequelabs__axe-core/) — pinned source files

The directories above preserve each source repository's structure, including documentation, code, data, examples, tests, and licenses. This short guide helps you locate the relevant material; use the source files for exact values and APIs.

## Practical guide


**Sources:** [W3C WCAG 2.2](https://github.com/w3c/wcag) and [Deque axe-core](https://github.com/dequelabs/axe-core). Official material: [published WCAG 2.2](https://www.w3.org/TR/WCAG22/), [axe-core rules](https://github.com/dequelabs/axe-core/blob/develop/doc/rule-descriptions.md).

## Consolidated rules

1. WCAG 2.2 provides testable criteria for perceivable, operable, understandable, and robust content. They apply to the whole site, not only individual components.
2. Provide logical headings, text alternatives, sufficient contrast, visible focus, keyboard operation, understandable labels, and useful error messages.
3. Test complete scenarios—search, form entry, errors, and confirmation—with assistive technologies and increased zoom.
4. An accessible component does not guarantee an accessible page if it is integrated incorrectly or given poor text.

## What axe-core adds

- **Machine-readable checks** for HTML/ARIA and rules mapped to WCAG 2.0–2.2 criteria and accessibility practices.
- **Specific element discovery:** results identify where a failure occurs, which checks passed, and where manual review is required.
- **Repeatability:** checks can be included in component tests and rerun after interface changes.
- **Coverage limits:** axe-core's authors explicitly state that automation detects only part of WCAG issues. Manual testing remains necessary. See the [project description](https://github.com/dequelabs/axe-core).

## Minimum testing cycle

1. Choose a target WCAG 2.2 level and review criteria relevant to the page.
2. Run axe-core on every important page state, including open menus and form errors.
3. Manually test keyboard operation, a screen reader, zoom, and text meaning.
4. Record each defect with the criterion, page, and reproduction steps.

**Related:** [navigation](../01-navigation/README.md), [content](../03-content-readability/README.md), [forms](../04-forms/README.md).
