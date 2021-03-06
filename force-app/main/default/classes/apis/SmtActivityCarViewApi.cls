@RestResource(urlMapping = '/smt/activityCarView')
global class SmtActivityCarViewApi {

    @HttpPost
    global static void saveActivityCarViewAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        SmtActivityCarViewWrapper requestBodyWrapper = SmtActivityCarViewWrapper.parseJson(request.requestBody.toString());
        ActivityCarView__c requestBodyObject = (ActivityCarView__c) requestBodyWrapper.ToSObject();

        List<ActivityCarView__c> existingObjectList = [SELECT id FROM ActivityCarView__c WHERE LineActivityCarViewID__c =: requestBodyWrapper.lineActivityCarViewID];
        if (existingObjectList == null || existingObjectList.isEmpty()) {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }

        List<Lead__c> existingLeadList = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        List<SalesRepresentative__c> existingSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.salesRepresentativeCode];
        if (existingSalesRepresentativeList == null || existingSalesRepresentativeList.isEmpty()) {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }

        Lead__c newOrExistingLead = null;
        if (existingLeadList != null && existingLeadList.size() > 0) {
            newOrExistingLead = existingLeadList.get(0);
            requestBodyObject.Lead__c = newOrExistingLead.Id;
        } else {
            newOrExistingLead = new Lead__c();
            newOrExistingLead.SMTLeadId__c = requestBodyWrapper.SMTLeadID;
            newOrExistingLead.Member__c = existingObjectList.get(0).Member__c;
        }
        newOrExistingLead.SalesRepresentative__c = existingSalesRepresentativeList.get(0).Id;
        Database.upsert(newOrExistingLead);
        requestBodyObject.Lead__c = newOrExistingLead.Id;
        
        ActivityCarView__c existingObject = existingObjectList.get(0);
        requestBodyObject.Id = existingObject.Id;
        requestBodyObject = (ActivityCarView__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
