public with sharing class PromotionTriggerHandler extends TriggerHandler {
    public PromotionTriggerHandler() {
    }

    protected override void afterInsert() {
        for (Promotion__c triggeredObject : (List<Promotion__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(new PromotionWrapper(triggeredObject));
            LineCallout.lineFutureCallout(Constants.LineHost + Constants.LineEndpointPromotion, objectAsJson);
        }
    }

    protected override void afterUpdate() {
        for (Promotion__c triggeredObject : (List<Promotion__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(new PromotionWrapper(triggeredObject));
            LineCallout.lineFutureCallout(Constants.LineHost + Constants.LineEndpointPromotion, objectAsJson);
        }
    }
}
