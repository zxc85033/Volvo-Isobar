@RestResource(urlMapping = '/smt/activityCarTest')
global class SmtActivityCarTestApi {

    @HttpPost
    global static void saveActivityCarTestAndSendLine() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        SmtActivityCarTestWrapper requestBodyWrapper = SmtActivityCarTestWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();

        List<Dealer__c> existingDealerList = [SELECT Id FROM Dealer__c WHERE DealerCode__c =: requestBodyWrapper.dealerCode];
        if (existingDealerList != null && existingDealerList.size() > 0) {
            requestBodyObject.Dealer__c = existingDealerList.get(0).Id;
        }

        List<CarTestRoute__c> existingCarTestRouterList = [SELECT Id FROM CarTestRoute__c WHERE Name =: requestBodyWrapper.dealerCode];
        if (existingCarTestRouterList != null && existingCarTestRouterList.size() > 0) {
            requestBodyObject.CarTestRoute__c = existingCarTestRouterList.get(0).Id;
        }

        List<Lead__c> existingLeadList = [SELECT Id FROM Lead__c WHERE SMTLeadId__c =: requestBodyWrapper.SMTLeadID];
        if (existingLeadList != null && existingLeadList.size() > 0) {
            requestBodyObject.Lead__c = existingLeadList.get(0).Id;
        }

        List<ActivityCarTest__c> existingObjectList = [SELECT id FROM ActivityCarTest__c WHERE ActivityID__c =: requestBodyWrapper.ActivityID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            ActivityCarTest__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarTest__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
   }
    
}
