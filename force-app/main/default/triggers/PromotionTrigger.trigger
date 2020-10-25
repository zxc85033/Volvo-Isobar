trigger PromotionTrigger on Promotion__c (after insert, after update) {
    new PromotionTriggerHandler().run();
}