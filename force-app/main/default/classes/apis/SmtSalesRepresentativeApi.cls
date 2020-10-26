@RestResource(urlMapping = '/smt/salesrepresentative')
global with sharing class SmtSalesRepresentativeApi {
    
    @HttpPost
    global static void saveSalesRepresentativeAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        SalesRepresentativeWrapper salesReps = SalesRepresentativeWrapper.parseJson(request.requestBody.toString());
        SalesRepresentative__c salesRepsObject = (SalesRepresentative__c) salesReps.ToSObject();
        Database.UpsertResult dbResult = Database.upsert(salesRepsObject);

        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
}
