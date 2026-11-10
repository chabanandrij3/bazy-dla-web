# 5. Functionality

**Sources:** [MDN Web Docs](https://github.com/mdn/content) and [Google Lighthouse](https://github.com/GoogleChrome/lighthouse). Official material: [MDN Learn Web Development](https://developer.mozilla.org/en-US/docs/Learn_web_development), [Chrome — Lighthouse](https://developer.chrome.com/docs/lighthouse/), [Lighthouse CLI](https://github.com/GoogleChrome/lighthouse#using-the-node-cli).

## Consolidated rules

1. Every visible control should perform its expected action. Test the entire path: start, loading, success, error, and retry.
2. Use native HTML and browser capabilities when they match the task. This simplifies keyboard support, navigation history, and multi-device behavior.
3. On a slow network, users should understand what is happening. Do not lose entered data because of a temporary failure.
4. Performance affects real usability: slow loading and response delays can prevent task completion.

## What Lighthouse adds

- **Automated URL audits:** performance, accessibility, technical practices, and SEO appear in one report with links explaining specific problems.
- **Reproducible results:** run Lighthouse in Chrome DevTools, the command line, or as a Node module to compare page versions.
- **Performance data:** Lighthouse exposes loading and responsiveness bottlenecks that are not visible in MDN API documentation.
- **Automation limits:** a successful audit does not test business logic, actual data persistence, payments, or search-result correctness.

## Functionality checklist

- Create a short scenario table: action → expected result → actual result → error state.
- Test every primary scenario with mouse and keyboard, on a narrow screen, and with an unstable connection.
- Run Lighthouse on representative pages, not only the home page.
- For cross-browser feature compatibility, see [Web Platform Tests](09-supplements.md#4-web-platform-tests).

**Related:** [forms](04-forms.md), [accessibility](06-accessibility.md), [security](08-security.md).
