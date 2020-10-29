@RestResource(urlMapping = '/line/member')
global with sharing class LineMemberApi {
    
    @HttpPost
    global static void saveMemberAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        MemberWrapper requestBodyWrapper = MemberWrapper.parseJson(request.requestBody.toString());
        Member__c requestBodyObject = (Member__c) requestBodyWrapper.ToSObject();
        
        Member__c existingObject = [SELECT Id FROM Member__c WHERE LineUID__c =: requestBodyWrapper.lineUID];
        if (existingObject != null) {
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (Member__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(requestBodyObject, existingObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
