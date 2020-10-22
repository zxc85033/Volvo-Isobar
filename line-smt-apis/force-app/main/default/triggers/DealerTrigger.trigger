trigger DealerTrigger on Dealer__c (after insert, after update) {
    new DealerTriggerHandler().run();
}