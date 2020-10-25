trigger CarTestRouteTrigger on CarTestRoute__c (after insert, after update) {
    new CarTestRouteTriggerHandler().run();
}