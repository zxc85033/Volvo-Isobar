@RestResource(urlMapping = '/smt/salesrepresentative')
global with sharing class SmtSalesRepresentativeApi {
    
    @HttpPost
    global static void saveSalesRepresentativeAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        SalesRepresentativeWrapper requestBodyWrapper = SalesRepresentativeWrapper.parseJson(request.requestBody.toString());
        SalesRepresentative__c requestBodyObject = (SalesRepresentative__c) requestBodyWrapper.ToSObject();

        List<SalesRepresentative__c> existingObjectList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.salesRepresentativeCode];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            SalesRepresentative__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (SalesRepresentative__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(requestBodyObject, existingObject);
        }

        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
}
