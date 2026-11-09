# 8. Безпека

**Джерела:** [OWASP ASVS](https://github.com/OWASP/ASVS) і [MDN HTTP Observatory](https://github.com/mdn/mdn-http-observatory). Практичні матеріали: [OWASP Cheat Sheet Series](https://github.com/OWASP/CheatSheetSeries), [MDN Observatory](https://developer.mozilla.org/en-US/observatory/), [методика тестів](https://developer.mozilla.org/en-US/observatory/docs/tests_and_scoring).

## Зведені правила

1. Передавання даних має бути захищене HTTPS/TLS. Поля форми, параметри URL й відповіді API вважайте недовіреними; перевірка в браузері не замінює перевірку на сервері.
2. Автентифікація, керування сесіями, права доступу, обробка введення й залежності потребують окремих вимог і перевірок. [ASVS 5.0](https://github.com/OWASP/ASVS) надає структурований перелік таких вимог.
3. Для практичної реалізації використовуйте тематичні матеріали OWASP, зокрема про [безпеку фронтенду](https://cheatsheetseries.owasp.org/cheatsheets/Web_Frontend_Security_Cheat_Sheet.html) і [Content Security Policy](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html).
4. Зберігайте докази перевірок для конкретної версії сайту; успішне проходження лише одного сканера не підтверджує загальну захищеність.

## Що додає MDN HTTP Observatory

- **Автоматична перевірка публічного сайту** на захисні HTTP-заголовки й пов'язані налаштування; результат містить окремі тести, оцінку та пояснення.
- **Повторюваний запуск:** доступні вебсторінка, командний рядок і JSON API. Це дозволяє помічати зміну налаштувань після розгортання. [Інструкція](https://github.com/mdn/mdn-http-observatory/blob/main/README.md).
- **Актуалізовані тести:** сучасна реалізація MDN замінила заархівований старий Mozilla Observatory; у версії 1.7.0 від вересня 2026 року додано оцінювання COOP і COEP. [Релізи](https://github.com/mdn/mdn-http-observatory/releases).
- **Чітка межа:** Observatory не тестує SQL-ін'єкції, слабкі паролі чи всі уразливості застосунку. [FAQ](https://developer.mozilla.org/en-US/observatory/docs/faq).

## Перевірка сайту

- Записати застосовні вимоги ASVS для конкретного сайту.
- Перевірити автентифікацію, права доступу, обробку введення й сесії окремими тестами.
- Запустити Observatory для розгорнутого домену та переглянути кожен результат, не лише загальний бал.
- Після змін серверної конфігурації повторити сканування й зберегти дату та версію.

**Поруч:** [форми](04-forms.md), [функціональність](05-functionality.md).
