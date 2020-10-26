@RestResource(urlMapping = '/smt/activityCarTest')
global with sharing class SmtActivityCarTestApi {

    @HttpPost
    global static void saveActivityCarTestAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarTestWrapper activityCarTest = ActivityCarTestWrapper.parseJson(request.requestBody.toString());

        ActivityCarTest__c activityCarTestObject = (ActivityCarTest__c) activityCarTest.ToSObject();
        
        Database.UpsertResult dbResult = Database.upsert(activityCarTestObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
