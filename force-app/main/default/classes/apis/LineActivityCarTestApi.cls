@RestResource(urlMapping = '/line/activityCarTest')
global class LineActivityCarTestApi {
    
    @HttpPost
    global static void saveActivityCarTestAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarTestWrapper activityCarTest = ActivityCarTestWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c activityCarTestObject = [SELECT id FROM ActivityCarTest__c WHERE ActivityID__c =: activityCarTest.ActivityID];
        
        if (activityCarTestObject == null) {
            activityCarTestObject = (ActivityCarTest__c) activityCarTest.ToSObject();
        } else {
            System.debug('activityCarTestObject existing');
        }
        
        Database.UpsertResult dbResult = Database.upsert(activityCarTestObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
