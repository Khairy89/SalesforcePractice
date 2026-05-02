# Mock Assessment – Opportunity Trigger + LWC

## Task 1: Apex Trigger
**Requirement:**
- Write a bulk-safe Apex trigger on `Opportunity` that prevents duplicate `Opportunity` records with the same `Name` under the same `Account`.
- If a duplicate is detected, add an error to the record.

### Recommended files
- `force-app/main/default/triggers/OpportunityPreventDuplicate.trigger`
- `force-app/main/default/classes/OpportunityPreventDuplicateHandler.cls`
- `force-app/main/default/classes/OpportunityPreventDuplicateHandlerTest.cls`

### What to do
- Use `before insert` and `before update`.
- Collect `AccountId + Name` keys for all incoming records.
- Query existing opportunities once using a single SOQL.
- Compare in-memory duplicates and the queried records.
- Add errors with `o.addError()`.

### Why use a class file
- Keeps logic reusable and testable.
- Lets the trigger remain thin and focused on trigger context.
- Interviewers expect separation: trigger launches handler logic.

## Task 2: Lightning Web Component
**Requirement:**
- Build an LWC that shows a list of Opportunities for a given Account.
- Accept `accountId` via `@api`.
- Use an Apex controller method annotated with `@AuraEnabled(cacheable=true)`.
- Display results in a `lightning-datatable` with `Name`, `Stage`, `Amount`.
- Handle loading and error states.

### Recommended files
- `force-app/main/default/classes/OpportunityController.cls`
- `force-app/main/default/lwc/opportunityList/opportunityList.js`
- `force-app/main/default/lwc/opportunityList/opportunityList.html`
- `force-app/main/default/lwc/opportunityList/opportunityList.js-meta.xml`

### Explanation
- `@AuraEnabled(cacheable=true)` is used for read-only data retrieval in LWC.
- `@api accountId` makes the component usable on record pages.
- `lightning-datatable` is the standard way to show tabular data in LWC.
- Use `@wire` to call Apex and expose `data` / `error` to the template.

## Recommended interview answer
If asked to write this in an interview, say:
- "I'll create a trigger plus a handler class for the Opportunity duplicate check, and a separate Apex controller and LWC for the Opportunity list." 
- "Anonymous Apex is only for quick tests—production code should be saved as metadata and covered by tests."
