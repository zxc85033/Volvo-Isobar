@RestResource(urlMapping = '/line/member')
global class LineMemberApi {
    
    @HttpPost
    global static void saveMemberAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        LineMemberWrapper requestBodyWrapper = LineMemberWrapper.parseJson(request.requestBody.toString());
        Member__c requestBodyObject = (Member__c) requestBodyWrapper.ToSObject();
        
        List<Member__c> existingObjectList = [SELECT Id FROM Member__c WHERE LineUID__c =: requestBodyWrapper.lineUID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            Member__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (Member__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(requestBodyObject, existingObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
