public class MemberTriggerHandler extends TriggerHandler {
    
    protected override void afterUpdate() {
        for (Member__c triggeredObject : (List<Member__c>) Trigger.new) {
            String objectAsJson = JSON.serialize(new MemberWrapper(triggeredObject));
            LineCallout.lineFutureCallout(Constants.LINE_ENDPOINT_MEMBER, objectAsJson);
        }
    }
}
