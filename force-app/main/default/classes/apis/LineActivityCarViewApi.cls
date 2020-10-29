@RestResource(urlMapping = '/line/activityCarView')
global with sharing class LineActivityCarViewApi {
    
    @HttpPost
    global static void saveActivityCarViewAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarViewWrapper requestBodyWrapper = ActivityCarViewWrapper.parseJson(request.requestBody.toString());
        ActivityCarView__c requestBodyObject = (ActivityCarView__c) requestBodyWrapper.ToSObject();

        ActivityCarView__c existingObject = [SELECT Id FROM ActivityCarView__c WHERE ActivityID__c =: requestBodyWrapper.activityID];
        if (existingObject != null) {
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarView__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
