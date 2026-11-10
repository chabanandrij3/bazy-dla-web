param(
  [Parameter(Mandatory=$true)][string]$Root,
  [Parameter(Mandatory=$true)][string]$PreviousGuideDirectory
)

$topics = @(
  @{Folder='01-navigation'; Title='Навігація'; Guide='01-navigation.md'; Sources=@('alphagov__govuk-design-system','alphagov__govuk-frontend','primer__design','primer__react')},
  @{Folder='02-structure-layout'; Title='Структура й макет'; Guide='02-layout.md'; Sources=@('uswds__uswds-site','uswds__uswds','twbs__bootstrap')},
  @{Folder='03-content-readability'; Title='Контент і читабельність'; Guide='03-content.md'; Sources=@('carbon-design-system__carbon-website','carbon-design-system__carbon','github__docs')},
  @{Folder='04-forms'; Title='Форми'; Guide='04-forms.md'; Sources=@('adobe__spectrum-design-data','ant-design__ant-design')},
  @{Folder='05-functionality'; Title='Функціональність'; Guide='05-functionality.md'; Sources=@('mdn__content','GoogleChrome__lighthouse')},
  @{Folder='06-accessibility'; Title='Доступність'; Guide='06-accessibility.md'; Sources=@('w3c__wcag','dequelabs__axe-core')},
  @{Folder='07-aesthetics'; Title='Естетика'; Guide='07-visual-design.md'; Sources=@('material-components__material-web','primer__primitives')},
  @{Folder='08-security'; Title='Безпека'; Guide='08-security.md'; Sources=@('OWASP__ASVS','OWASP__CheatSheetSeries','mdn__mdn-http-observatory')}
)

$oldLinks = @{
  '01-navigation.md'='../01-navigation/README.md'
  '02-layout.md'='../02-structure-layout/README.md'
  '03-content.md'='../03-content-readability/README.md'
  '04-forms.md'='../04-forms/README.md'
  '05-functionality.md'='../05-functionality/README.md'
  '06-accessibility.md'='../06-accessibility/README.md'
  '07-visual-design.md'='../07-aesthetics/README.md'
  '08-security.md'='../08-security/README.md'
  '09-supplements.md'='../09-supplements/README.md'
}

foreach ($topic in $topics) {
  $folder = Join-Path $Root $topic.Folder
  [IO.Directory]::CreateDirectory($folder) | Out-Null
  $sourceLines = foreach ($source in $topic.Sources) {
    $exists = Test-Path -LiteralPath (Join-Path $folder $source)
    $state = if ($exists) { 'файли на місці' } else { 'завантаження не завершено' }
    "- [$source]($source/) — $state"
  }

  $body = Get-Content -LiteralPath (Join-Path $PreviousGuideDirectory $topic.Guide) -Raw -Encoding UTF8
  $body = [regex]::Replace($body, '^# [^\r\n]+\r?\n', '')
  foreach ($key in $oldLinks.Keys) { $body = $body.Replace($key, $oldLinks[$key]) }
  $body = $body.Replace('../material-web-docs/', '../../material-web-docs/')
  $content = @"
# $($topic.Title)

## Повні локальні файли

$($sourceLines -join "`n")

У папках вище збережено структуру вихідних репозиторіїв: документацію, код, дані, приклади, тести та ліцензії. Цей стислий огляд допомагає знайти потрібну частину; для точних значень і API відкривайте локальні файли джерел.

## Практичний огляд

$body
"@
  [IO.File]::WriteAllText((Join-Path $folder 'README.md'), $content, [Text.UTF8Encoding]::new($false))
}

$rows = foreach ($topic in $topics) {
  "| [$($topic.Title)]($($topic.Folder)/README.md) | $($topic.Sources -join ', ') |"
}
$rootReadme = @"
# Велика локальна база для створення сайтів

**Оновлено:** 2026-11-09. **Мова пояснень:** українська. **Оригінальні файли:** мовами авторів.

Ця папка містить повні локальні знімки відкритих репозиторіїв, згруповані за вісьмома темами. Відкрийте тему, потім її вихідні папки. `README.md` кожного розділу дає короткий синтез двох або більше джерел.

| Розділ | Локальні джерела |
|---|---|
$($rows -join "`n")
| [Доповнення](09-supplements/README.md) | Adobe React Spectrum; Web Platform Tests; пояснення NN/g і Baymard |

## Як користуватися

1. Відкрийте відповідну тему вище.
2. Прочитайте короткий практичний огляд і перегляньте повні файли кожного джерела.
3. Для пошуку за назвою файла скористайтеся [FILE_CATALOG.tsv](FILE_CATALOG.tsv); [SOURCE_MANIFEST.tsv](SOURCE_MANIFEST.tsv) містить кількість файлів і версії джерел.
4. Зберігайте умови ліцензій кожного репозиторію при повторному використанні його коду, текстів, іконок або зображень.

## Що означає «проаналізовано»

Репозиторії збережені без тематичного видалення файлів. Практичні огляди зіставляють їхні підходи; автоматизований каталог перевіряє склад файлів і дозволяє знайти дублікати. Великий тестовий корпус WPT не перетворювався на рекомендації шляхом ручного читання кожного тесту. Огляди не замінюють актуальну специфікацію чи тестування конкретного сайту.

## Походження

Джерело кожної папки позначене назвою організації та репозиторію. Git-репозиторії мають власний `HEAD` для перевірки версії. Для двох архівних знімків у папках збережено `ORIGINAL_SNAPSHOT.zip`; файли з назвами, несумісними з Windows, перейменовано за картою `WINDOWS_PATH_MAP.csv`.
"@
[IO.File]::WriteAllText((Join-Path $Root 'README.md'), $rootReadme, [Text.UTF8Encoding]::new($false))

$supplementReadme = @"
# Чотири доповнення

## 1. Nielsen Norman Group — евристики зручності

Публічний матеріал: https://www.nngroup.com/articles/ten-usability-heuristics/ . Це авторська стаття, а не відкритий файловий репозиторій. Практичний стислий огляд з попередньої версії бази наведено нижче; повного набору файлів NN/g для завантаження немає.

## 2. Baymard Institute — UX-дослідження checkout

Публічний опис: https://baymard.com/research/checkout-usability . Повний масив дослідження доступний у Baymard Premium і не наданий локально. Тут збережено лише власний короткий огляд публічної інформації.

## 3. Adobe React Spectrum / React Aria

Повні відкриті файли: [adobe__react-spectrum](adobe__react-spectrum/).

## 4. Web Platform Tests

Повний відкритий тестовий корпус: [web-platform-tests__wpt](web-platform-tests__wpt/). Це тести поведінки вебплатформи, а не набір готових дизайнерських правил.

## Практичний огляд доповнень

"@
$supplementOld = Get-Content -LiteralPath (Join-Path $PreviousGuideDirectory '09-supplements.md') -Raw -Encoding UTF8
$supplementOld = [regex]::Replace($supplementOld, '^# [^\r\n]+\r?\n', '')
foreach ($key in $oldLinks.Keys) { $supplementOld = $supplementOld.Replace($key, $oldLinks[$key]) }
$supplementOld = [regex]::Replace($supplementOld, '(?m)^\*\*Обсяг:\*\*.*(?:\r?\n)?', '**Обсяг:** повний відкритий тестовий корпус збережено у цій збірці; шукайте тести за потрібною вебможливістю.' + "`n")
[IO.Directory]::CreateDirectory((Join-Path $Root '09-supplements')) | Out-Null
[IO.File]::WriteAllText((Join-Path $Root '09-supplements\README.md'), $supplementReadme + $supplementOld, [Text.UTF8Encoding]::new($false))

Write-Output 'Created root, eight topic guides, and supplement guide.'
