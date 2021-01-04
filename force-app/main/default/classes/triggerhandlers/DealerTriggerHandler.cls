public with sharing class DealerTriggerHandler extends TriggerHandler {
    public DealerTriggerHandler() {
    }

    protected override void afterUpdate() {
        for (Dealer__c triggeredObject : (List<Dealer__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(new DealerWrapper(triggeredObject));
            LineCallout.lineFutureCallout(Constants.LINE_ENDPOINT_DEALER, objectAsJson);
        }
    }

    protected override void afterInsert() {
        for (Dealer__c triggeredObject : (List<Dealer__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(new DealerWrapper(triggeredObject));
            LineCallout.lineFutureCallout(Constants.LINE_ENDPOINT_DEALER, objectAsJson);
        }
    }
}