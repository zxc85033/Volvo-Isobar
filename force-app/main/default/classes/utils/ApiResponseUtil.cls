public with sharing class ApiResponseUtil {
    
    public static Blob buildBlobFromString(String responseAsString) {
        Blob responseAsBlob = Blob.valueOf(responseAsString);
        return responseAsBlob;
    }

    public static RestResponse buildRestResponse(RestResponse response, String status, String message, Integer httpCode) {
        MessageResponseWrapper messageResponseWrapper = new MessageResponseWrapper(status, message);
        response.statusCode = httpCode;
        response.responseBody = ApiResponseUtil.buildBlobFromString(JSON.serialize(messageResponseWrapper));
        
        return response;
    }

    public static RestResponse buildRestResponseDependingDatabaseResponse(RestResponse response, Database.UpsertResult dbResult) {
        response = ApiResponseUtil.buildRestResponse(response, Constants.REST_RESPONSE_FAIL, Constants.RESPONSE_ERROR_CANNOT_INSERT_OR_UPDATE, 400);
        if (dbResult.isSuccess()) {
            response = ApiResponseUtil.buildRestResponse(response, Constants.REST_RESPONSE_SUCCEEDED, null, 200);
        }

        return response;
    }

    public static RestResponse buildErrorResponse(RestResponse response, String errorMessage) {
        response = ApiResponseUtil.buildRestResponse(response, Constants.REST_RESPONSE_FAIL, errorMessage, 400);
        response.statusCode = 400;
        return response;
    }
}
