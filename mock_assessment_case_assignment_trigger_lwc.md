# Mock Assessment – Case Assignment Trigger + LWC

## Task: Case Owner Assignment Trigger + Case List LWC
**Requirement:**
- Write an Apex trigger on `Case` to assign the case owner to a queue if the case's `Priority` is `High`.
- Build an LWC that lists cases for the current user.

### Recommended files
- `force-app/main/default/triggers/CaseAssignmentTrigger.trigger`
- `force-app/main/default/classes/CaseAssignmentHandler.cls`
- `force-app/main/default/classes/CaseAssignmentHandlerTest.cls`
- `force-app/main/default/classes/CaseController.cls`
- `force-app/main/default/lwc/caseList/caseList.js`
- `force-app/main/default/lwc/caseList/caseList.html`
- `force-app/main/default/lwc/caseList/caseList.js-meta.xml`

### What to do in the trigger
- Trigger events: `before insert`, `before update`.
- Check each case in `Trigger.new` for `Priority == 'High'`.
- Set the owner to a queue ID or user ID, but avoid DML in the trigger.
- If using a queue, query the `Group` object once and store the queue ID.
- Keep logic bulk-safe and avoid SOQL inside loops.

### What to do in the LWC
- Build a component that fetches cases assigned to the current user.
- Use `@wire` with `@AuraEnabled(cacheable=true)` Apex method.
- Display `CaseNumber`, `Subject`, `Priority`, and `Status`.
- Handle loading and errors in the UI.

### Explanation for interview prep
- This task demonstrates both backend logic and UI experience.
- Use a trigger plus handler class because that is how you structure real Salesforce logic.
- The LWC shows you can surface data from Apex in the Lightning UI.
- Mention that `@AuraEnabled(cacheable=true)` is best for read-only lists and improves performance.

### Notes
- If you need to update `OwnerId`, use a `before` trigger.
- For a real interview, explain that you separate trigger context from business logic in a handler class.
- Explain that LWC should not contain SOQL or business logic; it should call Apex for data.
