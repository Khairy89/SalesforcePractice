// Create the account sObject
Account acct = new Account(
    Name = 'Acme',
    Phone = '(415)555-1212',
    NumberOfEmployees = 100
);

// Insert the account by using DML
insert acct;

// Optional: confirm by debug
System.debug('New Account Id: ' + acct.Id);
