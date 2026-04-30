public with sharing class HelloWorld {
    @AuraEnabled
    public static String sayHello() {
        return 'Hello from Apex!';
    }
}