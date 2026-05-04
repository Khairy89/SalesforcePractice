trigger ContactEmailUpdateTrigger on Contact (before insert, before update) {

    set<Id> accountIds = new Set<Id>();
}