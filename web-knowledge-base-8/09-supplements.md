# Four specialized supplements

These sources help validate and deepen the eight main topics. They do not create an alternative design-token set or duplicate the main rules.

## 1. Nielsen Norman Group: usability heuristics

**Source:** [10 Usability Heuristics for User Interface Design](https://www.nngroup.com/articles/ten-usability-heuristics/) by Jakob Nielsen; editorially reviewed in 2024.

**Adds:** an expert-review method covering system status, familiar language, user control and error recovery, consistency, error prevention, reduced memory load, restrained design, and recovery from errors.

**Use:** walk through primary scenarios as a new user and record the action, expectation, actual state, and violated heuristic for every problem. It most strongly supplements [navigation](01-navigation.md), [content](03-content.md), [functionality](05-functionality.md), and [visual design](07-visual-design.md).

**Access:** this is a public article, not an open database for bulk copying. This collection stores only an original short summary and a link.

## 2. Baymard Institute: ecommerce research

**Source:** [Cart & Checkout Usability Research](https://baymard.com/research/checkout-usability) and the [research methodology](https://baymard.com/research/methodology).

**Adds:** examples and research findings for cart and checkout journeys, including field labels, checkout steps, hints, error messages, and data validation.

**Use:** apply this when a site includes a catalog, cart, payment, or ordering. It supplements [forms](04-forms.md) and [navigation](01-navigation.md); some findings are unnecessary for a simple information site.

**Access:** the page includes open articles and examples; the full Baymard Premium research database is paid. No closed material is reproduced here.

## 3. Adobe React Aria

**Source:** the [adobe/react-spectrum repository](https://github.com/adobe/react-spectrum) and [forms guide](https://react-spectrum.adobe.com/forms).

**Adds:** implementation-level behavior and accessibility for interactive components: focus and keyboard management, field labels and descriptions, validation, and submission. This complements the structured Spectrum design data describing components and tokens.

**Use:** when building custom React components or checking [forms](04-forms.md), [navigation](01-navigation.md), and [accessibility](06-accessibility.md). React Aria should not be treated as a ready-made visual theme.

## 4. Web Platform Tests

**Source:** [web-platform-tests/wpt](https://github.com/web-platform-tests/wpt) and [public results](https://wpt.fyi/).

**Adds:** a large browser conformance test suite for web standards, showing whether an HTML, CSS, or Web API feature behaves consistently across implementations.

**Use:** verify nonstandard or new web features before using them in a critical flow. This supplements [functionality](05-functionality.md) but does not test the business logic of your specific site.

**Scope:** the repository contains far more tests than a normal website-design database needs. Search for the relevant web feature instead of copying the entire corpus into another collection.
