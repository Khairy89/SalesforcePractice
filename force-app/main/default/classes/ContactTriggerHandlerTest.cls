@isTest
private class ContactTriggerHandlerTest {
    @isTest static void testAssignTitles() {
        // Prepare test data
        Contact c1 = new Contact(FirstName='Joe', LastName='Smith', Department='Finance');
        Contact c2 = new Contact(FirstName='Kathy', LastName='Smith', Department='Technology');
        Contact c3 = new Contact(FirstName='Amy', LastName='Lee', Department='Education');
        
        // Insert in bulk
        insert new List<Contact>{c1, c2, c3};

        // Query back and assert
        Contact reloaded1 = [SELECT Title FROM Contact WHERE Id=:c1.Id];
        System.assertEquals('Financial Analyst', reloaded1.Title);

        Contact reloaded2 = [SELECT Title FROM Contact WHERE Id=:c2.Id];
        System.assertEquals('Software Engineer', reloaded2.Title);

        Contact reloaded3 = [SELECT Title FROM Contact WHERE Id=:c3.Id];
        System.assertEquals('Teacher', reloaded3.Title);
    }
}