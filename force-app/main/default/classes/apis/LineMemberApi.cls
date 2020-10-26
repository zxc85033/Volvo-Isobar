@RestResource(urlMapping = '/line/member')
global with sharing class LineMemberApi {
    
    @HttpPost
    global static void saveMemberAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        MemberWrapper member = MemberWrapper.parseJson(request.requestBody.toString());

        Member__c memberObject = (Member__c) member.ToSObject();
        
        Database.UpsertResult dbResult = Database.upsert(memberObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
