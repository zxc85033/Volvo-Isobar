@RestResource(urlMapping = '/smt/activityCarView')
global with sharing class SmtActivityCarViewApi {

    @HttpPost
    global static void saveActivityCarViewAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarViewWrapper requestBodyWrapper = ActivityCarViewWrapper.parseJson(request.requestBody.toString());
        ActivityCarView__c requestBodyObject = (ActivityCarView__c) requestBodyWrapper.ToSObject();

        List<ActivityCarView__c> existingObjectList = [SELECT id FROM ActivityCarView__c WHERE ActivityID__c =: requestBodyWrapper.ActivityID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            ActivityCarView__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarView__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
