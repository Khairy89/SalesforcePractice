# Mock Assessment – Account Opportunity LWC + Apex

## Task: Account Opportunity List Component
**Requirement:**
- Build a Lightning Web Component that displays Opportunities for a selected Account.
- The component should accept `accountId` as an `@api` property.
- Fetch data using an Apex controller.
- Display `Name`, `Stage`, and `Amount` columns.
- Handle loading, no-data, and error states.

### Recommended files
- `force-app/main/default/classes/AccountOpportunityController.cls`
- `force-app/main/default/lwc/accountOpportunityList/accountOpportunityList.js`
- `force-app/main/default/lwc/accountOpportunityList/accountOpportunityList.html`
- `force-app/main/default/lwc/accountOpportunityList/accountOpportunityList.js-meta.xml`
- `force-app/main/default/classes/AccountOpportunityControllerTest.cls`

### What to include
- Apex method should be `public static` and `@AuraEnabled(cacheable=true)`.
- Query `Opportunity` records filtered by `AccountId`.
- Use `Map` or `Set` if you need related data in the future.
- In the component, create `columns` for the datatable and wire the Apex method.
- Show a spinner during loading and a message when there are no opportunities.

### Why this is a good prep task
- Practices separation of concerns: Apex for data, LWC for UI.
- Tests should validate controller query behavior and empty result handling.
- This is a common interview ask for Salesforce developers.

### Helpful explanation for interview
- Use an Apex controller when your LWC needs server-side data.
- Use `cacheable=true` when the data is read-only and can be cached.
- For record pages, `@api accountId` is how the page passes the current record.
- Keep the LWC template simple with `if:true`, `if:false`, and a datatable.
