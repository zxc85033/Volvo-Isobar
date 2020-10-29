@RestResource(urlMapping = '/smt/leadlevel')
global with sharing class SmtLeadLevelApi {

    @HttpPost
    global static void saveLeadAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        LeadWrapper requestBodyWrapper = LeadWrapper.parseJson(request.requestBody.toString());
        Lead__c requestBodyObject = (Lead__c) requestBodyWrapper.ToSObject();

        Lead__c existingObject = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        if (existingObject != null) {
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (Lead__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(requestBodyObject, existingObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
