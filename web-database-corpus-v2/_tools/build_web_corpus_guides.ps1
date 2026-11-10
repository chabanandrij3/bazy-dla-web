param(
  [Parameter(Mandatory=$true)][string]$Root,
  [Parameter(Mandatory=$true)][string]$PreviousGuideDirectory
)

$topics = @(
  @{Folder='01-navigation'; Title='Navigation'; Guide='01-navigation.md'; Sources=@('alphagov__govuk-design-system','alphagov__govuk-frontend','primer__design','primer__react')},
  @{Folder='02-structure-layout'; Title='Structure and layout'; Guide='02-layout.md'; Sources=@('uswds__uswds-site','uswds__uswds','twbs__bootstrap')},
  @{Folder='03-content-readability'; Title='Content and readability'; Guide='03-content.md'; Sources=@('carbon-design-system__carbon-website','carbon-design-system__carbon','github__docs')},
  @{Folder='04-forms'; Title='Forms'; Guide='04-forms.md'; Sources=@('adobe__spectrum-design-data','ant-design__ant-design')},
  @{Folder='05-functionality'; Title='Functionality'; Guide='05-functionality.md'; Sources=@('mdn__content','GoogleChrome__lighthouse')},
  @{Folder='06-accessibility'; Title='Accessibility'; Guide='06-accessibility.md'; Sources=@('w3c__wcag','dequelabs__axe-core')},
  @{Folder='07-aesthetics'; Title='Visual design'; Guide='07-visual-design.md'; Sources=@('material-components__material-web','primer__primitives')},
  @{Folder='08-security'; Title='Security'; Guide='08-security.md'; Sources=@('OWASP__ASVS','OWASP__CheatSheetSeries','mdn__mdn-http-observatory')}
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
    $state = if ($exists) { 'source files available' } else { 'download incomplete' }
    "- [$source]($source/) — $state"
  }

  $body = Get-Content -LiteralPath (Join-Path $PreviousGuideDirectory $topic.Guide) -Raw -Encoding UTF8
  $body = [regex]::Replace($body, '^# [^\r\n]+\r?\n', '')
  foreach ($key in $oldLinks.Keys) { $body = $body.Replace($key, $oldLinks[$key]) }
  $body = $body.Replace('../material-web-docs/', '../../material-web-docs/')
  $content = @"
# $($topic.Title)

## Complete source files

$($sourceLines -join "`n")

The directories above preserve each source repository's structure: documentation, code, data, examples, tests, and licenses. This short guide helps locate the relevant material; use the source files for exact values and APIs.

## Practical guide

$body
"@
  [IO.File]::WriteAllText((Join-Path $folder 'README.md'), $content, [Text.UTF8Encoding]::new($false))
}

$rows = foreach ($topic in $topics) {
  "| [$($topic.Title)]($($topic.Folder)/README.md) | $($topic.Sources -join ', ') |"
}
$rootReadme = @"
# Large local website-building database

**Updated:** 2026-11-09. **Guide language:** English. **Original files:** preserved in their authors' languages.

This directory contains complete local snapshots of open repositories grouped into eight topics. Open a topic and then its source directories. Each section's `README.md` provides a short synthesis of two or more sources.

| Section | Local sources |
|---|---|
$($rows -join "`n")
| [Supplements](09-supplements/README.md) | Adobe React Spectrum; Web Platform Tests; NN/g and Baymard notes |

## How to use it

1. Open the relevant topic above.
2. Read the practical guide and inspect each source's complete files.
3. Search [FILE_CATALOG.tsv](FILE_CATALOG.tsv) by filename; [SOURCE_MANIFEST.tsv](SOURCE_MANIFEST.tsv) records file counts and source revisions.
4. Preserve each repository's license terms when reusing its code, text, icons, or images.

## What analyzed means

The repositories are preserved without thematic file deletion. Practical guides compare their approaches; the generated catalog records the file set and helps find duplicates. The large WPT test corpus was not converted into recommendations by manually reading every test. These guides do not replace current specifications or testing of a specific site.

## Provenance

Each source directory is named after its organization and repository. Git repositories retain their own `HEAD` for version checks. Two archive snapshots include `ORIGINAL_SNAPSHOT.zip`; filenames incompatible with Windows are mapped in `WINDOWS_PATH_MAP.csv`.
"@
[IO.File]::WriteAllText((Join-Path $Root 'README.md'), $rootReadme, [Text.UTF8Encoding]::new($false))

$supplementReadme = @"
# Four supplements

## 1. Nielsen Norman Group — usability heuristics

Public material: https://www.nngroup.com/articles/ten-usability-heuristics/ . This is an authored article, not an open file repository. A short original summary appears below; no complete NN/g file set is available for download.

## 2. Baymard Institute — checkout UX research

Public description: https://baymard.com/research/checkout-usability . The full research database is available through Baymard Premium and is not stored locally. Only an original short summary of public information is included.

## 3. Adobe React Spectrum / React Aria

Complete open files: [adobe__react-spectrum](adobe__react-spectrum/).

## 4. Web Platform Tests

Complete open test corpus: [web-platform-tests__wpt](web-platform-tests__wpt/). These test web-platform behavior; they are not a set of ready-made design rules.

## Practical supplement guide

"@
$supplementOld = Get-Content -LiteralPath (Join-Path $PreviousGuideDirectory '09-supplements.md') -Raw -Encoding UTF8
$supplementOld = [regex]::Replace($supplementOld, '^# [^\r\n]+\r?\n', '')
foreach ($key in $oldLinks.Keys) { $supplementOld = $supplementOld.Replace($key, $oldLinks[$key]) }
$supplementOld = [regex]::Replace($supplementOld, '(?m)^\*\*Scope:\*\*.*(?:\r?\n)?', '**Scope:** the complete open test corpus is preserved in this collection; search for the relevant web feature.' + "`n")
[IO.Directory]::CreateDirectory((Join-Path $Root '09-supplements')) | Out-Null
[IO.File]::WriteAllText((Join-Path $Root '09-supplements\README.md'), $supplementReadme + $supplementOld, [Text.UTF8Encoding]::new($false))

Write-Output 'Created root, eight topic guides, and supplement guide.'
