@RestResource(urlMapping = '/line/activityCarTest')
global class LineActivityCarTestApi {
    
    @HttpPost
    global static void saveActivityCarTestAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        LineActivityCarTestInsertWrapper requestBodyWrapper = LineActivityCarTestInsertWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();

        List<ActivityCarTest__c> existingObjectList = [SELECT Id FROM ActivityCarTest__c WHERE LineActivityCarTestID__c =: requestBodyWrapper.lineActivityCarTestID];
        if (existingObjectList != null && existingObjectList.size() > 0) {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorDuplicateLineActivityID);
            return;
        }

        List<Dealer__c> existingDealerList = [SELECT Id FROM Dealer__c WHERE DealerCode__c =: requestBodyWrapper.dealerCode];
        if (existingDealerList != null && existingDealerList.size() > 0) {
            requestBodyObject.Dealer__c = existingDealerList.get(0).Id;
        } else {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }

        List<Member__c> existingMemberList = [SELECT Id FROM Member__c WHERE LineUID__c =: requestBodyWrapper.lineUID];
        if (existingMemberList != null && existingMemberList.size() > 0) {
            requestBodyObject.Member__c = existingMemberList.get(0).Id;
        } else {
            response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
            return;
        }

        if (requestBodyWrapper.chooseMethod == Constants.PicklistChooseSalesRepsManual) {
            List<SalesRepresentative__c> existingSalesRepresentativeList = [SELECT Id FROM SalesRepresentative__c WHERE SalesRepresentativeCode__c =: requestBodyWrapper.chooseSalesRepresentativeCode];
            if (existingSalesRepresentativeList.isEmpty()) {
                response = ApiResponseUtil.buildErrorResponse(response, Constants.ResponseErrorNotExisting);
                return;
            }
            requestBodyObject.ChooseSalesRepresentative__c = existingSalesRepresentativeList.get(0).Id;
        }
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }

    @HttpPatch
    global static void updateActivityCarTestAndSendToSmt() {
        RestRequest request = RestContext.request;
        RestResponse response = Restcontext.response;

        LineActivityCarTestUpdateWrapper requestBodyWrapper = LineActivityCarTestUpdateWrapper.parseJson(request.requestBody.toString());
        ActivityCarTest__c requestBodyObject = (ActivityCarTest__c) requestBodyWrapper.ToSObject();

        List<CarTestRoute__c> existingCarTestRouterList = [SELECT Id FROM CarTestRoute__c WHERE Name =: requestBodyWrapper.carTestRouteID];
        if (existingCarTestRouterList != null && existingCarTestRouterList.size() > 0) {
            requestBodyObject.CarTestRoute__c = existingCarTestRouterList.get(0).Id;
        }
        
        List<ActivityCarTest__c> existingObjectList = [SELECT id FROM ActivityCarTest__c WHERE LineActivityCarTestID__c =: requestBodyWrapper.lineActivityCarTestID];
        if (existingObjectList == null || existingObjectList.isEmpty()) {
            response.statusCode = 400;
            response.responseBody = ApiResponseUtil.buildBlobFromString(Constants.ResponseErrorNotExisting);
            return;
        }

        ActivityCarTest__c existingObject = existingObjectList.get(0);
        requestBodyObject.Id = existingObject.Id;
        requestBodyObject = (ActivityCarTest__c) SObjectUtil.updateFirstObjectWithNonNullValueOfSecondObject(existingObject, requestBodyObject);
        
        Database.UpsertResult dbResult = Database.upsert(requestBodyObject);
        ApiResponseUtil.buildRestResponseDependingDatabaseResponse(response, dbResult);
    }
}
