@RestResource(urlMapping = '/smt/leadlevel')
global with sharing class SmtLeadLevelApi {

    @HttpPost
    global static void saveLeadAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        LeadWrapper requestBodyWrapper = LeadWrapper.parseJson(request.requestBody.toString());
        Lead__c requestBodyObject = (Lead__c) requestBodyWrapper.ToSObject();

        List<Lead__c> existingObjectList = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            Lead__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (Lead__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(requestBodyObject, existingObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
