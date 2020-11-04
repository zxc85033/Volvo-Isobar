public with sharing class DealerTriggerHandler extends TriggerHandler {
    public DealerTriggerHandler() {
    }

    protected override void afterUpdate() {
        for (Dealer__c triggeredObject : (List<Dealer__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureCallout(Constants.LineHost + Constants.LineEndpointDealer, objectAsJson);
        }
    }

    protected override void afterInsert() {
        for (Dealer__c triggeredObject : (List<Dealer__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureCallout(Constants.LineHost + Constants.LineEndpointDealer, objectAsJson);
        }
    }
}