@isTest
private class ContactMailingStateHandlerTest {
    
    @isTest static void testWithValidMailingState() {
        Account acc = new Account(Name='Acc1', BillingCountry='United States', BillingState='New York');
        insert acc;
        Contact c = new Contact(FirstName='John', LastName='Doe', AccountId=acc.Id, MailingCountry='United States', MailingState='New York');
        insert c;
        Contact reloaded = [SELECT MailingState FROM Contact WHERE Id=:c.Id];
        System.assertEquals('New York', reloaded.MailingState);
    }
    
    @isTest static void testNullMailingState() {
        Account acc = new Account(Name='Acc2', BillingCountry='United States', BillingState='California');
        insert acc;
        Contact c = new Contact(FirstName='Jane', LastName='Doe', AccountId=acc.Id, MailingCountry='United States', MailingState=null);
        insert c;
        Contact reloaded = [SELECT MailingState FROM Contact WHERE Id=:c.Id];
        System.assertEquals(null, reloaded.MailingState);
    }
    
    @isTest static void testNoAccountId() {
        Contact c = new Contact(FirstName='NoAcc', LastName='Doe', MailingCountry='United States', MailingState='Texas');
        insert c;
        Contact reloaded = [SELECT MailingState FROM Contact WHERE Id=:c.Id];
        System.assertEquals('Texas', reloaded.MailingState);
    }
    
    @isTest static void testNullBillingState() {
        Account acc = new Account(Name='Acc3', BillingCountry='United States', BillingState=null);
        insert acc;
        Contact c = new Contact(FirstName='NullBilling', LastName='Doe', AccountId=acc.Id, MailingCountry='United States', MailingState='Florida');
        insert c;
        Contact reloaded = [SELECT MailingState FROM Contact WHERE Id=:c.Id];
        System.assertEquals('Florida', reloaded.MailingState);
    }
}
