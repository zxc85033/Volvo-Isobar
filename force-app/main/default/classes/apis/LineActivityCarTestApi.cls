@RestResource(urlMapping = '/line/activityCarTest')
global with sharing class LineActivityCarTestApi {
    @HttpPost
    global static void saveActivityCarTestAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        MemberWrapper member = MemberWrapper.parseJson(request.requestBody.toString());

        Member__c memberObject = (Member__c) member.ToSObject();
        
        Database.UpsertResult dbResult = Database.upsert(memberObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
