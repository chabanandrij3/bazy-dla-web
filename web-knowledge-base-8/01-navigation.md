# 1. Navigation

**Sources:** [GOV.UK Design System](https://github.com/alphagov/govuk-design-system) and [GitHub Primer](https://github.com/primer/react). Official material: [GOV.UK — Navigate a service](https://design-system.service.gov.uk/patterns/navigate-a-service/), [Primer — component catalog](https://primer.style/product/components/), [Primer — NavList](https://primer.style/product/components/nav-list/).

## Consolidated rules

1. Navigation should reflect user tasks and content structure; item labels should predict the destination.
2. The current location should be clear from the heading, active item, or breadcrumbs. Repeated navigation should keep consistent labels, order, and behavior.
3. A link moves to another address; a button performs an action. Using the wrong element makes keyboard and assistive-technology use harder.
4. Menu depth should match the real hierarchy. If users cannot find content, test task-based labels and grouping before adding another level.

## What Primer adds

- **Specific component choices.** [NavList](https://primer.style/product/components/nav-list/) is vertical navigation; [UnderlineNav](https://primer.style/product/components/underline-nav/) is horizontal link navigation; [Breadcrumbs](https://primer.style/product/components/) show a hierarchy path; [Pagination](https://primer.style/product/components/) moves through result pages.
- **A nesting limit.** NavList guidance allows up to four levels; needing more is a signal to review the structure. This is a Primer-specific constraint, not a universal standard.
- **Navigation in a layout.** [SplitPageLayout](https://primer.style/product/components/split-page-layout/) shows how to combine a persistent sidebar with main content without losing the selected item's context.
- **Accessible state.** Primer examples use `aria-current="page"` for the active link. Do not set it on multiple items within one route.

## Page checklist

- Can a new visitor identify their current location and next step?
- Can the menu be traversed with a keyboard while keeping focus visible?
- Does each link label match the destination page heading?
- Do important routes remain available on narrow screens?

**Related:** [page structure](02-layout.md), [accessibility](06-accessibility.md).
