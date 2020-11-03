@RestResource(urlMapping = '/line/activityCarView')
global class LineActivityCarViewApi {
    
    @HttpPost
    global static void saveActivityCarViewAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarViewWrapper requestBodyWrapper = ActivityCarViewWrapper.parseJson(request.requestBody.toString());
        ActivityCarView__c requestBodyObject = (ActivityCarView__c) requestBodyWrapper.ToSObject();

        List<Dealer__c> existingDealerList = [SELECT Id FROM Dealer__c WHERE DealerCode__c =: requestBodyWrapper.dealerCode];
        if (existingDealerList != null && existingDealerList.size() > 0) {
            requestBodyObject.Dealer__c = existingDealerList.get(0).Id;
        }

        List<SalesRepresentative__c> existingSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.chooseSalesRepresentativeCode];
        if (existingSalesRepresentativeList != null && existingSalesRepresentativeList.size() > 0) {
            requestBodyObject.ChooseSalesRepresentative__c = existingSalesRepresentativeList.get(0).Id;
        }
        
        List<ActivityCarView__c> existingObjectList = [SELECT Id FROM ActivityCarView__c WHERE LineActivityCarViewID__c =: requestBodyWrapper.lineActivityCarViewID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            ActivityCarView__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarView__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }

    @HttpPatch
    global static void updateActivityCarViewAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        ActivityCarViewWrapper requestBodyWrapper = ActivityCarViewWrapper.parseJson(request.requestBody.toString());
        ActivityCarView__c requestBodyObject = (ActivityCarView__c) requestBodyWrapper.ToSObject();

        List<ActivityCarView__c> existingObjectList = [SELECT Id FROM ActivityCarView__c WHERE LineActivityCarViewID__c =: requestBodyWrapper.lineActivityCarViewID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            ActivityCarView__c existingObject = existingObjectList.get(0);
            requestBodyObject.Id = existingObject.Id;
            requestBodyObject = (ActivityCarView__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
