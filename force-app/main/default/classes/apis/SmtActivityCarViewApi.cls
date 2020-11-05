@RestResource(urlMapping = '/smt/activityCarView')
global class SmtActivityCarViewApi {

    @HttpPost
    global static void saveActivityCarViewAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        SmtActivityCarViewWrapper requestBodyWrapper = SmtActivityCarViewWrapper.parseJson(request.requestBody.toString());
        ActivityCarView__c requestBodyObject = (ActivityCarView__c) requestBodyWrapper.ToSObject();

        List<Dealer__c> existingDealerList = [SELECT Id FROM Dealer__c WHERE DealerCode__c =: requestBodyWrapper.dealerCode];
        if (existingDealerList != null && existingDealerList.size() > 0) {
            requestBodyObject.Dealer__c = existingDealerList.get(0).Id;
        }

        List<Lead__c> existingLeadList = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        if (existingLeadList != null && existingLeadList.size() > 0) {
            requestBodyObject.Lead__c = existingLeadList.get(0).Id;
        }

        List<ActivityCarView__c> existingObjectList = [SELECT id FROM ActivityCarView__c WHERE ActivityID__c =: requestBodyWrapper.ActivityID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            ActivityCarView__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarView__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
