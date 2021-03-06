@RestResource(urlMapping = '/smt/lead')
global class SmtLeadApi {

    @HttpPost
    global static void saveLeadAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        LeadWrapper requestBodyWrapper = LeadWrapper.parseJson(request.requestBody.toString());
        Lead__c requestBodyObject = (Lead__c) requestBodyWrapper.ToSObject();

        List<SalesRepresentative__c> existingSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.salesRepresentativeCode];
        if (existingSalesRepresentativeList != null && existingSalesRepresentativeList.size() > 0) {
            requestBodyObject.SalesRepresentative__c = existingSalesRepresentativeList.get(0).Id;
        } else {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }
        List<SalesRepresentative__c> existingExSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.exSalesRepresentativeCode];
        if (existingExSalesRepresentativeList != null && existingExSalesRepresentativeList.size() > 0) {
            requestBodyObject.ExSalesRepresentative__c = existingExSalesRepresentativeList.get(0).Id;
        } else {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }

        List<Lead__c> existingObjectList = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        if (existingObjectList == null || existingObjectList.isEmpty()) {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }
        
        Lead__c existingObject = existingObjectList.get(0);
        requestBodyObject.Id = existingObject.Id;
        requestBodyObject = (Lead__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(requestBodyObject, existingObject);
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
