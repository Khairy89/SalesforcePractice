cat << 'EOF' > MockAssessment.md
# Mock Assessment – Apex & LWC

## Task 1: Apex Trigger
**Requirement:**  
Prevent duplicate `Opportunity` records with the same `Name` under the same `Account`.

**Instructions:**  
- Write a bulk-safe trigger on `Opportunity`.  
- If a duplicate is detected, add an error to the record.  
- Include a test class with at least 75% coverage.

**Starter Code:**
```apex
trigger OpportunityPreventDuplicate on Opportunity (before insert, before update) {
    Set<String> oppKeys = new Set<String>();
    for (Opportunity o : Trigger.new) {
        if (o.Name != null && o.AccountId != null) {
            oppKeys.add(o.AccountId + ':' + o.Name.toLowerCase());
        }
    }

    Map<String, Opportunity> existing = new Map<String, Opportunity>(
        [SELECT Id, Name, AccountId FROM Opportunity WHERE (AccountId + ':' + Name) IN :oppKeys]
    );

    for (Opportunity o : Trigger.new) {
        String key = o.AccountId + ':' + o.Name.toLowerCase();
        if (existing.containsKey(key)) {
            o.addError('Duplicate Opportunity Name under same Account not allowed.');
        }
    }
}


Task 2: Lightning Web Component
Requirement:  
Build an LWC that displays a list of Opportunities for a given Account.

Accept accountId as a public property (@api).

Fetch Opportunities via Apex.

Display them in a datatable with columns: Name, Stage, Amount.

Handle loading and error states.

Starter Code:

OpportunityController.cls

public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(Id accountId) {
        return [SELECT Id, Name, StageName, Amount FROM Opportunity WHERE AccountId = :accountId];
    }
}

opportunityList.html

html
<template>
    <lightning-card title="Opportunities">
        <template if:true={opps.data}>
            <lightning-datatable
                key-field="id"
                data={opps.data}
                columns={columns}>
            </lightning-datatable>
        </template>
        <template if:true={opps.error}>
            <p>Error: {opps.error}</p>
        </template>
    </lightning-card>
</template>
opportunityList.js

javascript
import { LightningElement, api, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Stage', fieldName: 'StageName' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' }
];

export default class OpportunityList extends LightningElement {
    @api accountId;
    columns = COLUMNS;

    @wire(getOpportunities, { accountId: '$accountId' })
    opps;
}
opportunityList.js-meta.xml

xml
<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightning__RecordPage</target>
    </targets>
</LightningComponentBundle>
Instructions for Practice
Implement both tasks in your Playground project.

Deploy to org and test in a Lightning App Page or Account Record Page.

Run Apex tests to confirm coverage.

Time yourself (aim for 60–90 minutes total).
EOF


---

👉 Run this command in your project folder terminal. It will instantly create `MockAssessment.md` with all the content inside. Then just open it in VS Code like a normal README file.  

Would you like me to also prepare a **third file called `InterviewTalkingPoints.md`**