# Apex Trigger Exercise Plan

## Objective
Write an Apex trigger on the Contact object that updates a contact's email to 'Test@Test.com' when the contact's MailingState matches the parent Account's BillingState.

---

## Requirements Analysis

### Trigger Scope
- **Object**: Contact
- **Trigger Events**: `before insert`, `before update`
- **Reason for Events**: We need to update the email before the record is saved to the database

### Business Logic
1. When a Contact is created or updated
2. Compare Contact.MailingState with Account.BillingState
3. If they match → Set Contact.Email = 'Test@Test.com'

### Key Considerations
- Need to fetch parent Account data (via `AccountId`)
- Handle bulk operations (use collections, not loops with SOQL)
- Avoid hitting governor limits
- Handle null values (MailingState or BillingState could be null)
- Test both insert and update scenarios

---

## Implementation Plan

### Step 1: Create the Trigger File
- **File Path**: `force-app/main/default/triggers/`
- **File Name**: `ContactEmailUpdateTrigger.trigger`
- **Trigger Name**: ContactEmailUpdateTrigger

### Step 2: Write the Trigger Code
The trigger will:
1. Collect all Account IDs from the contacts being inserted/updated
2. Query the related Account records to get their BillingState
3. Iterate through the contacts and compare MailingState with BillingState
4. Update the email if states match

### Step 3: Create a Test Class
- **File Path**: `force-app/main/default/classes/`
- **File Name**: `ContactEmailUpdateTriggerTest.cls`
- **Test Coverage**: Minimum 75% (aim for 100%)

### Test Scenarios to Cover
1. ✓ Contact insert with matching MailingState and BillingState → Email should be 'Test@Test.com'
2. ✓ Contact insert with non-matching states → Email should remain unchanged
3. ✓ Contact update with matching states → Email should be updated to 'Test@Test.com'
4. ✓ Contact update with non-matching states → Email should remain unchanged
5. ✓ Handle null MailingState or BillingState gracefully
6. ✓ Bulk operations (multiple contacts at once)

---

## File Structure
```
force-app/main/default/
├── triggers/
│   └── ContactEmailUpdateTrigger.trigger
└── classes/
    └── ContactEmailUpdateTriggerTest.cls
```

---

## Development Steps
1. [ ] Create the trigger file with basic structure
2. [ ] Implement the business logic
3. [ ] Create the test class
4. [ ] Write and run unit tests
5. [ ] Verify code coverage
6. [ ] Deploy to DevEdition org
7. [ ] Manual testing in the org (optional)

---

## Notes
- **Best Practice**: Use before insert/update to avoid DML operations within the trigger
- **Performance**: Use a single query to fetch all related accounts to avoid SOQL in loops
- **Null Safety**: Handle cases where MailingState or BillingState is null
