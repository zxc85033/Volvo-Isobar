public with sharing class ApiResponseUtil {
    
    public static Blob buildBlobFromString(String responseAsString) {
        Blob responseAsBlob = Blob.valueOf(responseAsString);
        return responseAsBlob;
    }

    public static RestResponse buildRestResponseDependingDatabaseResponse(RestResponse response, Database.UpsertResult dbResult) {
        response.statusCode = 400;
        Blob resAsBlob = ApiResponseUtil.buildBlobFromString('Error while inserting or updating the sales representative.');
        
        if (dbResult.isSuccess()) {
            response.statusCode = 200;
            resAsBlob = ApiResponseUtil.buildBlobFromString('The sales representative has been insert or updated with success.');
        }
        
        response.responseBody = resAsBlob;

        return response;
    }
}
