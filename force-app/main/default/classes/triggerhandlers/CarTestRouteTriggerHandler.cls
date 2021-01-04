public with sharing class CarTestRouteTriggerHandler extends TriggerHandler {
    public CarTestRouteTriggerHandler() {
    }

    protected override void afterUpdate() {
        List<Id> dealerIdList = new List<Id>();
        for (CarTestRoute__c triggeredObject : (List<CarTestRoute__c>) Trigger.new) {
            dealerIdList.add(triggeredObject.Dealer__c);
        }
        List<Dealer__c> dealerList = [SELECT Id, DealerCode__c FROM Dealer__c WHERE Id in :dealerIdList];
        if (dealerList.isEmpty()) {
            return;
        }

        for (CarTestRoute__c triggeredObject : (List<CarTestRoute__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(new CarTestRouteWrapper(triggeredObject, dealerList.get(0)));
            LineCallout.lineFutureCallout(Constants.LINE_ENDPOINT_CAR_TEST_ROUTE, objectAsJson);
        }
    }

    protected override void afterInsert() {
        List<Id> dealerIdList = new List<Id>();
        for (CarTestRoute__c triggeredObject : (List<CarTestRoute__c>) Trigger.new) {
            dealerIdList.add(triggeredObject.Dealer__c);
        }
        List<Dealer__c> dealerList = [SELECT Id, DealerCode__c FROM Dealer__c WHERE Id in :dealerIdList];
        if (dealerList.isEmpty()) {
            return;
        }

        for (CarTestRoute__c triggeredObject : (List<CarTestRoute__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(new CarTestRouteWrapper(triggeredObject, dealerList.get(0)));
            LineCallout.lineFutureCallout(Constants.LINE_ENDPOINT_CAR_TEST_ROUTE, objectAsJson);
        }
    }
}
