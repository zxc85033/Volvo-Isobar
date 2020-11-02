@RestResource(urlMapping = '/line/activityCarTest')
global class LineActivityCarTestApi {
    
    @HttpPost
    global static void saveActivityCarTestAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarTestWrapper requestBodyWrapper = ActivityCarTestWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();
        
        List<ActivityCarTest__c> existingObjectList = [SELECT id FROM ActivityCarTest__c WHERE ActivityID__c =: requestBodyWrapper.ActivityID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            ActivityCarTest__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarTest__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
