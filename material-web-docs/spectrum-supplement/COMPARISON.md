# Comparison with Material Web

Material Web in this directory provides component and theming documentation. Spectrum 2 provides its own token values, component schemas, guidance, and data relationships. Matching component names do not imply identical rules or interchangeable tokens.

## Examples of differences

- **Button:** Material Web documents `elevated`, `filled`, `filled tonal`, `outlined`, and `text` types in [button.md](../components/button.md). Spectrum defines `accent`, `primary`, `secondary`, and `negative` variants, plus `isPending` and its constraints, in [button.json](data/components/button.json).
- **Color:** Material Web explains color roles and scheme generation in [color.md](../theming/color.md). Spectrum supplies its own numeric and color values in [tokens](data/tokens/) and adds a `wireframe` mode beside `light` and `dark` in [color-scheme.json](data/mode-sets/color-scheme.json).
- **Data structure:** Material Web primarily provides descriptions and usage examples. Spectrum adds machine-readable fields, allowed-value dictionaries, token-to-component relationships, and separate guidance in `fields/`, `registry/`, `relationships/`, and `guidelines/`.

There are **8** components with matching names. They remain separate Spectrum specifications because they contain data absent from the Material Web files.

| Name | Material Web | Spectrum 2 |
| --- | --- | --- |
| button | [documentation](../components/button.md) | [structured data](data/components/button.json) |
| checkbox | [documentation](../components/checkbox.md) | [structured data](data/components/checkbox.json) |
| divider | [documentation](../components/divider.md) | [structured data](data/components/divider.json) |
| menu | [documentation](../components/menu.md) | [structured data](data/components/menu.json) |
| slider | [documentation](../components/slider.md) | [structured data](data/components/slider.json) |
| switch | [documentation](../components/switch.md) | [structured data](data/components/switch.json) |
| tabs | [documentation](../components/tabs.md) | [structured data](data/components/tabs.json) |
| text-field | [documentation](../components/text-field.md) | [structured data](data/components/text-field.json) |

There are **89** components without a same-named Material Web file.

accordion, action-bar, action-button, action-group, alert-banner, alert-dialog, avatar, avatar-group, badge, bar-panel, body, bottom-navigation-android, breadcrumbs, button-group, calendar, card, card-horizontal, cards, checkbox-group, close-button, coach-indicator, coach-mark, code, collection-card, color-area, color-control, color-handle, color-loupe, color-slider, color-wheel, combo-box, contextual-help, date-field, date-picker, detail, double-calendar, drop-zone, field, field-label, floating-action-button, form-item, heading, help-text, illustrated-message, in-field-button, in-field-progress-button, in-field-progress-circle, in-line-alert, link, list-view, meter, number-field, opacity-checkerboard, picker, popover, progress-bar, progress-circle, radio-button, radio-group, rating, scroll-zoom-bar, search-field, segmented-control, segmented-text-field, select-box, side-navigation, single-calendar, stack-item, standard-dialog, standard-panel, status-light, steplist, swatch, swatch-group, table, tag, tag-field, tag-group, takeover-dialog, text-area, thumbnail, time-field, title, toast, tooltip, tray, tree-view, triple-calendar, user-card

## Selection rule

- Canonical `packages/design-data/` data from Spectrum 2 is preserved.
- The generated flat token copy in `packages/tokens/src/` and repeated data in `docs/markdown/` and `docs/s2-docs/` are excluded.
- Files with identical SHA-256 checksums, including matches against Material Web, are omitted.
- Shared concepts such as buttons or color are retained when their rules or values belong to the separate Spectrum system.
