@RestResource(urlMapping = '/smt/activityCarView')
global with sharing class SmtActivityCarViewApi {

    @HttpPost
    global static void saveActivityCarViewAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarViewWrapper requestBodyWrapper = ActivityCarViewWrapper.parseJson(request.requestBody.toString());
        ActivityCarView__c requestBodyObject = (ActivityCarView__c) requestBodyWrapper.ToSObject();

        ActivityCarView__c existingObject = [SELECT id FROM ActivityCarView__c WHERE ActivityID__c =: requestBodyWrapper.ActivityID];
        if (existingObject != null) {
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarView__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
