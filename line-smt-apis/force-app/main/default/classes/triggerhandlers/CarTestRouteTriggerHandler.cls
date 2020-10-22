public with sharing class CarTestRouteTriggerHandler extends TriggerHandler {
    public CarTestRouteTriggerHandler() {
    }

    protected override void afterUpdate() {
        for (CarTestRoute__c carTestRoute : (List<CarTestRoute__c>) Trigger.new) {
            String carTestRouteAsJson = JSON.serialize(carTestRoute);
            LineCallout.carTestRouterTriggerCallout(carTestRouteAsJson);
        }
    }

    protected override void afterInsert() {
        for (CarTestRoute__c carTestRoute : (List<CarTestRoute__c>) Trigger.new) {
            String carTestRouteAsJson = JSON.serialize(carTestRoute);
            LineCallout.carTestRouterTriggerCallout(carTestRouteAsJson);
        }
    }
}
