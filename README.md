# Web Databases

An open collection of sources and notes for building websites.

| Directory | Contents |
| --- | --- |
| [material-web-docs](material-web-docs/) | Material Web documentation and a separate Adobe Spectrum 2 supplement |
| [web-knowledge-base-8](web-knowledge-base-8/) | A concise English index covering eight topics |
| [web-database-corpus-v2](web-database-corpus-v2/) | Complete local snapshots of open sources, a manifest, and file catalogs |

Start with the [index](web-knowledge-base-8/README.md). For exact data, open the source files or follow the links to the original sources.

## Sources and rights

This repository combines material from multiple authors. Every source project retains its own license terms; the sources and pinned versions are listed in the [manifest](web-database-corpus-v2/SOURCE_MANIFEST.tsv). The Material Web documentation comes from [material-components/material-web](https://github.com/material-components/material-web/tree/main/docs), with its license preserved in [LICENSES/MATERIAL_WEB_LICENSE](LICENSES/MATERIAL_WEB_LICENSE). Adobe Spectrum data comes from [adobe/spectrum-design-data](https://github.com/adobe/spectrum-design-data); its license and copyright notices are included in the [supplement](material-web-docs/spectrum-supplement/). Including material here does not transfer its copyright.

Open Git sources are pinned as submodules at the exact revisions recorded in the manifest. Two original ZIP snapshots are stored through Git LFS because of GitHub's regular file-size limit. For a complete clone, install Git LFS and use `git clone --recurse-submodules`.
