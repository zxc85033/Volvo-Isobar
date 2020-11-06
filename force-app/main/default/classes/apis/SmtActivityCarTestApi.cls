@RestResource(urlMapping = '/smt/activityCarTest')
global class SmtActivityCarTestApi {

    @HttpPost
    global static void saveActivityCarTestAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        SmtActivityCarTestWrapper requestBodyWrapper = SmtActivityCarTestWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();

        List<Lead__c> existingLeadList = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        if (existingLeadList != null && existingLeadList.size() > 0) {
            requestBodyObject.Lead__c = existingLeadList.get(0).Id;
            
            Lead__c existingLead = existingLeadList.get(0);
            List<SalesRepresentative__c> existingSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.salesRepresentativeCode];
            if (existingSalesRepresentativeList != null && existingSalesRepresentativeList.size() > 0) {
                existingLead.SalesRepresentative__c = existingSalesRepresentativeList.get(0).Id;
                Database.upsert(existingLead);
            }
        } else {
            Lead__c newLead = new Lead__c();
            newLead.SMTLeadId__c = requestBodyWrapper.SMTLeadID;
            insert newLead;
        }

        List<ActivityCarTest__c> existingObjectList = [SELECT id FROM ActivityCarTest__c WHERE LineActivityCarTestID__c =: requestBodyWrapper.lineActivityCarTestID];
        if (existingObjectList == null || existingObjectList.isEmpty()) {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }

        ActivityCarTest__c existingObject = existingObjectList.get(0);
        requestBodyObject.Id = existingObject.Id;
        requestBodyObject = (ActivityCarTest__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
