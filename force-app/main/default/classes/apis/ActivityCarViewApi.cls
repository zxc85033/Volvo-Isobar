@RestResource(urlMapping = '/smt/activityCarView')
global with sharing class ActivityCarViewApi {

    @HttpPost
    global static void saveActivityCarViewAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarViewWrapper activityCarView = ActivityCarViewWrapper.parseJson(request.requestBody.toString());

        ActivityCarView__c activityCarViewObject = (ActivityCarView__c) activityCarView.ToSObject();
        
        Database.UpsertResult dbResult = Database.upsert(activityCarViewObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
