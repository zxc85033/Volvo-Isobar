@RestResource(urlMapping = '/smt/activityCarTest')
global class SmtActivityCarTestApi {

    @HttpPost
    global static void saveActivityCarTestAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        SmtActivityCarTestWrapper requestBodyWrapper = SmtActivityCarTestWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();

        List<ActivityCarTest__c> existingObjectList = [SELECT Id, Member__c FROM ActivityCarTest__c WHERE LineActivityCarTestID__c =: requestBodyWrapper.lineActivityCarTestID];
        if (existingObjectList == null || existingObjectList.isEmpty()) {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.RESPONSE_ERROR_NOT_EXISTING);
            return;
        }

        List<Lead__c> existingLeadList = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        List<SalesRepresentative__c> existingSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.salesRepresentativeCode];
        if (existingSalesRepresentativeList == null || existingSalesRepresentativeList.isEmpty()) {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.RESPONSE_ERROR_NOT_EXISTING);
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

        ActivityCarTest__c existingObject = existingObjectList.get(0);
        requestBodyObject.Id = existingObject.Id;
        requestBodyObject = (ActivityCarTest__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
