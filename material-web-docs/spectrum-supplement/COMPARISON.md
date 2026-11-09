# Порівняння з Material Web

Material Web у цій папці містить документацію компонентів і темізації. Spectrum 2 містить власні значення токенів, схеми компонентів, настанови й зв’язки між даними. Однакові назви компонентів не означають однакові правила або взаємозамінність токенів.

## Приклади відмінностей

- **Кнопка:** Material Web описує типи `elevated`, `filled`, `filled tonal`, `outlined`, `text` у [button.md](../components/button.md). Spectrum описує варіанти `accent`, `primary`, `secondary`, `negative`, стан `isPending` та обмеження для нього у [button.json](data/components/button.json).
- **Колір:** Material Web пояснює колірні ролі й генерацію схем у [color.md](../theming/color.md). Spectrum додає власні числові й колірні значення в [токенах](data/tokens/) та режим `wireframe` разом із `light` і `dark` у [color-scheme.json](data/mode-sets/color-scheme.json).
- **Структура даних:** Material Web переважно подає описи і приклади використання. Spectrum додає машинозчитувані поля, словники допустимих значень, зв’язки між токенами й компонентами та окремі настанови в каталогах `fields/`, `registry/`, `relationships/`, `guidelines/`.

Компонентів із такими самими назвами: **8**. Вони залишені як окремі специфікації Spectrum, бо містять дані, яких немає у файлах Material Web.

| Назва | Material Web | Spectrum 2 |
| --- | --- | --- |
| button | [документація](../components/button.md) | [структуровані дані](data/components/button.json) |
| checkbox | [документація](../components/checkbox.md) | [структуровані дані](data/components/checkbox.json) |
| divider | [документація](../components/divider.md) | [структуровані дані](data/components/divider.json) |
| menu | [документація](../components/menu.md) | [структуровані дані](data/components/menu.json) |
| slider | [документація](../components/slider.md) | [структуровані дані](data/components/slider.json) |
| switch | [документація](../components/switch.md) | [структуровані дані](data/components/switch.json) |
| tabs | [документація](../components/tabs.md) | [структуровані дані](data/components/tabs.json) |
| text-field | [документація](../components/text-field.md) | [структуровані дані](data/components/text-field.json) |

Компонентів без однойменного файлу в Material Web: **89**.

accordion, action-bar, action-button, action-group, alert-banner, alert-dialog, avatar, avatar-group, badge, bar-panel, body, bottom-navigation-android, breadcrumbs, button-group, calendar, card, card-horizontal, cards, checkbox-group, close-button, coach-indicator, coach-mark, code, collection-card, color-area, color-control, color-handle, color-loupe, color-slider, color-wheel, combo-box, contextual-help, date-field, date-picker, detail, double-calendar, drop-zone, field, field-label, floating-action-button, form-item, heading, help-text, illustrated-message, in-field-button, in-field-progress-button, in-field-progress-circle, in-line-alert, link, list-view, meter, number-field, opacity-checkerboard, picker, popover, progress-bar, progress-circle, radio-button, radio-group, rating, scroll-zoom-bar, search-field, segmented-control, segmented-text-field, select-box, side-navigation, single-calendar, stack-item, standard-dialog, standard-panel, status-light, steplist, swatch, swatch-group, table, tag, tag-field, tag-group, takeover-dialog, text-area, thumbnail, time-field, title, toast, tooltip, tray, tree-view, triple-calendar, user-card

## Правило відбору

- Збережено канонічні дані `packages/design-data/` із Spectrum 2.
- Не збережено згенеровану плоску копію токенів `packages/tokens/src/` і повторне викладення даних у `docs/markdown/` та `docs/s2-docs/`.
- Файли з однаковою контрольною сумою SHA-256, зокрема відносно Material Web, пропущено.
- Спільні загальні поняття на кшталт кнопки чи кольору не вилучено, якщо правила або значення належать окремій системі Spectrum.
