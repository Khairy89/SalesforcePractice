# Mock Assessment – Contact Trigger

## Task: Contact Email Update Trigger

**Requirement:**
- Write an Apex trigger on `Contact` that updates the contact's `Email` to `Test@Test.com` when the contact's `MailingState` matches the parent `Account`'s `BillingState`.

**Instructions:**
- Trigger should run on `before insert` and `before update`.
- Use a bulk-safe design.
- Do not perform SOQL inside loops.
- If the `MailingState` matches the parent `Account` `BillingState`, set `Contact.Email = 'Test@Test.com'`.
- Include a test class to validate the behavior.

## Recommended structure

Use these files:

1. `force-app/main/default/triggers/ContactMailingStateTrigger.trigger`
2. `force-app/main/default/classes/ContactMailingStateHandler.cls`
3. `force-app/main/default/classes/ContactMailingStateHandlerTest.cls`

### Why use this structure?

- `ContactMailingStateTrigger.trigger`: contains the trigger entry point and manages trigger context.
- `ContactMailingStateHandler.cls`: contains the business logic in a reusable, testable Apex class.
- `ContactMailingStateHandlerTest.cls`: contains test methods for coverage and validation.

## Example design

- Trigger: `before insert, before update`
- Handler:
  - Collect `AccountId` values from trigger contacts.
  - Query parent accounts once.
  - Compare `MailingState` with `BillingState`.
  - Update the email value for matching contacts.

## Notes

- Use `Map<Id, Account>` to store queried accounts.
- Use `Trigger.isInsert` and `Trigger.isUpdate` as needed.
- Ensure tests cover both positive and negative cases.
- Keep the logic bulk-safe for multiple contacts.
