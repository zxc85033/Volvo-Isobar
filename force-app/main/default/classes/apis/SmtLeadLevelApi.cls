@RestResource(urlMapping = '/smt/leadlevel')
global with sharing class SmtLeadLevelApi {

    @HttpPost
    global static void saveLeadAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        LeadWrapper lead = LeadWrapper.parseJson(request.requestBody.toString());

        Lead__c leadObject = (Lead__c) lead.ToSObject();
        
        Database.UpsertResult dbResult = Database.upsert(leadObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
