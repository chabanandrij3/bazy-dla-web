# 8. Security

**Sources:** [OWASP ASVS](https://github.com/OWASP/ASVS) and [MDN HTTP Observatory](https://github.com/mdn/mdn-http-observatory). Practical material: [OWASP Cheat Sheet Series](https://github.com/OWASP/CheatSheetSeries), [MDN Observatory](https://developer.mozilla.org/en-US/observatory/), [test methodology](https://developer.mozilla.org/en-US/observatory/docs/tests_and_scoring).

## Consolidated rules

1. Protect data in transit with HTTPS/TLS. Treat form fields, URL parameters, and API responses as untrusted; browser validation never replaces server validation.
2. Authentication, session management, access control, input handling, and dependencies need separate requirements and tests. [ASVS 5.0](https://github.com/OWASP/ASVS) provides a structured requirement set.
3. Use focused OWASP implementation guidance, including [frontend security](https://cheatsheetseries.owasp.org/cheatsheets/Web_Frontend_Security_Cheat_Sheet.html) and [Content Security Policy](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html).
4. Preserve test evidence for a specific site version; passing one scanner does not prove overall security.

## What MDN HTTP Observatory adds

- **Automated public-site checks** for security HTTP headers and related settings, with individual tests, a score, and explanations.
- **Repeatable execution:** use the web page, command line, or JSON API to detect configuration changes after deployment. See the [instructions](https://github.com/mdn/mdn-http-observatory/blob/main/README.md).
- **Current tests:** the modern MDN implementation replaced the archived Mozilla Observatory; version 1.7.0 from September 2026 added COOP and COEP scoring. See [releases](https://github.com/mdn/mdn-http-observatory/releases).
- **A clear boundary:** Observatory does not test SQL injection, weak passwords, or every application vulnerability. See the [FAQ](https://developer.mozilla.org/en-US/observatory/docs/faq).

## Site checklist

- Record applicable ASVS requirements for the specific site.
- Test authentication, access control, input handling, and sessions separately.
- Run Observatory against the deployed domain and review every result, not only the total score.
- Repeat the scan after server-configuration changes and preserve the date and version.

**Related:** [forms](04-forms.md), [functionality](05-functionality.md).
