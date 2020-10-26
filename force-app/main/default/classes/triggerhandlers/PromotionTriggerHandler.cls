public with sharing class PromotionTriggerHandler extends TriggerHandler {
    public PromotionTriggerHandler() {
    }

    protected override void afterUpdate() {
        for (Promotion__c triggeredObject : (List<Promotion__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureTriggerCallout('https://postman-echo.com/post', objectAsJson);
        }
    }

    protected override void afterInsert() {
        for (Promotion__c triggeredObject : (List<Promotion__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureTriggerCallout('https://postman-echo.com/post', objectAsJson);
        }
    }
}