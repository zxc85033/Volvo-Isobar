trigger MemberTrigger on Member__c (after update) {
    new MemberTriggerHandler().run();
}