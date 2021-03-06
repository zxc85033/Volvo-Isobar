public with sharing class CarTestRouteTriggerHandler extends TriggerHandler {
    public CarTestRouteTriggerHandler() {
    }

    protected override void afterUpdate() {
        for (CarTestRoute__c triggeredObject : (List<CarTestRoute__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureCallout(Constants.LineHost + Constants.LineEndpointCarTestRoute, objectAsJson);
        }
    }

    protected override void afterInsert() {
        for (CarTestRoute__c triggeredObject : (List<CarTestRoute__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureCallout(Constants.LineHost + Constants.LineEndpointCarTestRoute, objectAsJson);
        }
    }
}
