public with sharing class ApiResponseUtil {
    
    public static Blob buildBlobFromString(String responseAsString) {
        Blob responseAsBlob = Blob.valueOf(responseAsString);
        return responseAsBlob;
    }

    public static RestResponse buildRestResponseDependingDatabaseResponse(RestResponse response, Database.UpsertResult dbResult) {
        response.statusCode = 400;
        Blob resAsBlob = ApiResponseUtil.buildBlobFromString(Constants.ResponseErrorCannotInsertOrUpdate);
        
        if (dbResult.isSuccess()) {
            response.statusCode = 200;
            resAsBlob = ApiResponseUtil.buildBlobFromString(Constants.ResponseSuccessInsertOrUpdate);
        }
        
        response.responseBody = resAsBlob;

        return response;
    }

    public static RestResponse buildErrorResponse(RestResponse response, String errorMessage) {
        
        MessageResponseWrapper messageResponseWrapper = new MessageResponseWrapper();
        messageResponseWrapper.httpCode = 400;
        messageResponseWrapper.message = errorMessage;
        response.statusCode = 400;
        response.responseBody = ApiResponseUtil.buildBlobFromString(JSON.serialize(messageResponseWrapper));
        
        return response;
    }
}
