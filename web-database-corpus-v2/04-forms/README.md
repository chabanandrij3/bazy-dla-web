# Forms

## Complete source files

- [adobe__spectrum-design-data](adobe__spectrum-design-data/) — pinned source files
- [ant-design__ant-design](ant-design__ant-design/) — pinned source files

The directories above preserve each source repository's structure, including documentation, code, data, examples, tests, and licenses. This short guide helps you locate the relevant material; use the source files for exact values and APIs.

## Practical guide


**Sources:** [Adobe Spectrum Design Data](https://github.com/adobe/spectrum-design-data) and [Ant Design](https://github.com/ant-design/ant-design). Official material: [Spectrum — canonical design data](https://github.com/adobe/spectrum-design-data/blob/main/packages/design-data/README.md), [Ant Design — Form](https://ant.design/components/form/), [Ant Design — Form Page](https://ant.design/docs/spec/research-form/).

## Consolidated rules

1. Ask only for necessary data. Every field needs a clear visible label, optional help text, and an explicit error state.
2. Group fields by task and place them in a predictable order. Mark required fields before input, not only after a failed submission.
3. Errors should name the affected field and explain how to fix it. After submission, users need a clear result.
4. Field and button placement must not rely only on color or decorative icons.

## What Ant Design adds

- **Form layouts:** horizontal, vertical, and inline; the [documentation](https://ant.design/components/form/) shows behavior with long labels and different groups.
- **Dependent fields and dynamic lists:** changing one field can revalidate related fields; nested repeatable elements have dedicated examples.
- **Validation states:** `success`, `warning`, `error`, and `validating`; messages and hints can be tailored to a scenario.
- **Jump to error:** examples demonstrate scrolling to the field that requires correction, adding practical behavior to Spectrum component descriptions.
- **Accessible association:** compound fields must explicitly connect labels and controls through `htmlFor` and `id`; the [Ant Design example](https://ant.design/components/form/) explains when automatic association fails.

## Form checklist

- Is the reason for collecting sensitive information explained?
- Does every field provide a label, format, and error message?
- Can users fix one error without filling everything again?
- Does the page confirm successful submission?
- Does the server validate independently of browser checks? See [security](../08-security/README.md).

**Local Adobe source data:** [Spectrum supplement](../../material-web-docs/spectrum-supplement/README.md). **Additional guide:** [React Aria](../09-supplements/README.md#3-adobe-react-aria).
