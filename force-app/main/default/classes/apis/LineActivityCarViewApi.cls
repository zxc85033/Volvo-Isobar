@RestResource(urlMapping = '/line/activityCarView')
global with sharing class LineActivityCarViewApi {
    
    @HttpPost
    global static void saveActivityCarViewAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarViewWrapper activityCarView = ActivityCarViewWrapper.parseJson(request.requestBody.toString());

        ActivityCarView__c activityCarViewObject = (ActivityCarView__c) activityCarView.ToSObject();
        
        Database.UpsertResult dbResult = Database.upsert(activityCarViewObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
