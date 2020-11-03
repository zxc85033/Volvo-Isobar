@RestResource(urlMapping = '/line/activityCarTest')
global class LineActivityCarTestApi {
    
    @HttpPost
    global static void saveActivityCarTestAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarTestWrapper requestBodyWrapper = ActivityCarTestWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();

        List<Dealer__c> existingDealerList = [SELECT Id FROM Dealer__c WHERE DealerCode__c =: requestBodyWrapper.dealerCode];
        if (existingDealerList != null && existingDealerList.size() > 0) {
            requestBodyObject.Dealer__c = existingDealerList.get(0).Id;
        }

        List<SalesRepresentative__c> existingSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.chooseSalesRepresentativeCode];
        if (existingSalesRepresentativeList != null && existingSalesRepresentativeList.size() > 0) {
            requestBodyObject.ChooseSalesRepresentative__c = existingSalesRepresentativeList.get(0).Id;
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

    @HttpPatch
    global static void updateActivityCarTestAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarTestWrapper requestBodyWrapper = ActivityCarTestWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();
        
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
