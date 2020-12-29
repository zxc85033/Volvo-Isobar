public with sharing class BuyCalculatorTriggerHandler extends TriggerHandler {
    public BuyCalculatorTriggerHandler() {
    }

    protected override void afterUpdate() {
        for (BuyCalculator__c triggeredObject : (List<BuyCalculator__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureCallout(Constants.LINE_ENDPOINT_BUY_CALCULATOR, objectAsJson);
        }
    }

    protected override void afterInsert() {
        for (BuyCalculator__c triggeredObject : (List<BuyCalculator__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(triggeredObject);
            LineCallout.lineFutureCallout(Constants.LINE_ENDPOINT_BUY_CALCULATOR, objectAsJson);
        }
    }
}
