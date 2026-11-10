# Large local website-building database

**Updated:** 2026-11-09. **Guide language:** English. **Original files:** preserved in their authors' languages.

This directory contains complete snapshots of open repositories grouped into eight topics. Open a topic and then one of its source directories. Each topic README consolidates guidance from two or more sources.

| Section | Local sources |
|---|---|
| [Navigation](01-navigation/README.md) | alphagov__govuk-design-system, alphagov__govuk-frontend, primer__design, primer__react |
| [Structure and layout](02-structure-layout/README.md) | uswds__uswds-site, uswds__uswds, twbs__bootstrap |
| [Content and readability](03-content-readability/README.md) | carbon-design-system__carbon-website, carbon-design-system__carbon, github__docs |
| [Forms](04-forms/README.md) | adobe__spectrum-design-data, ant-design__ant-design |
| [Functionality](05-functionality/README.md) | mdn__content, GoogleChrome__lighthouse |
| [Accessibility](06-accessibility/README.md) | w3c__wcag, dequelabs__axe-core |
| [Visual design](07-aesthetics/README.md) | material-components__material-web, primer__primitives |
| [Security](08-security/README.md) | OWASP__ASVS, OWASP__CheatSheetSeries, mdn__mdn-http-observatory |
| [Supplements](09-supplements/README.md) | Adobe React Spectrum; Web Platform Tests; NN/g and Baymard notes |

## How to use it

1. Open the relevant topic above.
2. Read the practical guide and inspect the complete files for each source.
3. Search [FILE_CATALOG.tsv](FILE_CATALOG.tsv) by filename; [SOURCE_MANIFEST.tsv](SOURCE_MANIFEST.tsv) records file counts and source revisions.
4. Preserve every repository's license terms when reusing its code, text, icons, or images.

## What analyzed means

The repositories are preserved without thematic file deletion. The practical guides compare their approaches, while the generated catalog records the file set and helps identify duplicates. The large WPT test corpus was not converted into recommendations by manually reading every test. These guides do not replace current specifications or testing of a specific site.

## Provenance

Each source directory is named after its organization and repository. Git repositories are pinned to a specific commit. Two archive snapshots include ORIGINAL_SNAPSHOT.zip; filenames incompatible with Windows are mapped in WINDOWS_PATH_MAP.csv.

## Complete cloning

Open Git sources are pinned as submodules. Two ZIP snapshots use Git LFS. Install Git LFS and run: git clone --recurse-submodules https://github.com/chabanandrij3/bazy-dla-web.git