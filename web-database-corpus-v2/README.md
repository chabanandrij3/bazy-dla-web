# Велика локальна база для створення сайтів

**Оновлено:** 2026-11-09. **Мова пояснень:** українська. **Оригінальні файли:** мовами авторів.

Ця папка містить повні локальні знімки відкритих репозиторіїв, згруповані за вісьмома темами. Відкрийте тему, потім її вихідні папки. README.md кожного розділу дає короткий синтез двох або більше джерел.

## Завантаження з GitHub

Git-джерела збережені як підмодулі на точних ревізіях із `SOURCE_MANIFEST.tsv`. Щоб отримати їхній повний вміст, клонуйте репозиторій командою `git clone --recurse-submodules https://github.com/chabanandrij3/bazy-dla-web.git`. Два джерела, отримані як ZIP-знімки, зберігаються через Git LFS у відповідних папках.

| Розділ | Локальні джерела |
|---|---|
| [Навігація](01-navigation/README.md) | alphagov__govuk-design-system, alphagov__govuk-frontend, primer__design, primer__react |
| [Структура й макет](02-structure-layout/README.md) | uswds__uswds-site, uswds__uswds, twbs__bootstrap |
| [Контент і читабельність](03-content-readability/README.md) | carbon-design-system__carbon-website, carbon-design-system__carbon, github__docs |
| [Форми](04-forms/README.md) | adobe__spectrum-design-data, ant-design__ant-design |
| [Функціональність](05-functionality/README.md) | mdn__content, GoogleChrome__lighthouse |
| [Доступність](06-accessibility/README.md) | w3c__wcag, dequelabs__axe-core |
| [Естетика](07-aesthetics/README.md) | material-components__material-web, primer__primitives |
| [Безпека](08-security/README.md) | OWASP__ASVS, OWASP__CheatSheetSeries, mdn__mdn-http-observatory |
| [Доповнення](09-supplements/README.md) | Adobe React Spectrum; Web Platform Tests; пояснення NN/g і Baymard |

## Як користуватися

1. Відкрийте відповідну тему вище.
2. Прочитайте короткий практичний огляд і перегляньте повні файли кожного джерела.
3. Для пошуку за назвою файла скористайтеся [FILE_CATALOG.tsv](FILE_CATALOG.tsv); [SOURCE_MANIFEST.tsv](SOURCE_MANIFEST.tsv) містить кількість файлів і версії джерел.
4. Зберігайте умови ліцензій кожного репозиторію при повторному використанні його коду, текстів, іконок або зображень.

## Що означає «проаналізовано»

Репозиторії збережені без тематичного видалення файлів. Практичні огляди зіставляють їхні підходи; автоматизований каталог перевіряє склад файлів і дозволяє знайти дублікати. Великий тестовий корпус WPT не перетворювався на рекомендації шляхом ручного читання кожного тесту. Огляди не замінюють актуальну специфікацію чи тестування конкретного сайту.

[Звіт точних повторів](EXACT_GIT_DOCUMENT_DUPLICATES.tsv) містить 5 груп непорожніх документів із 17 шляхами між Git-джерелами. Вихідні файли збережено повністю; у путівниках повторені правила зведено в один огляд.

## Походження

Джерело кожної папки позначене назвою організації та репозиторію. Git-репозиторії мають власний HEAD для перевірки версії. Для двох архівних знімків у папках збережено ORIGINAL_SNAPSHOT.zip; файли з назвами, несумісними з Windows, перейменовано за картою WINDOWS_PATH_MAP.csv.
