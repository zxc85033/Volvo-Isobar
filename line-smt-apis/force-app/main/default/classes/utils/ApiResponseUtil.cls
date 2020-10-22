public with sharing class ApiResponseUtil {
    
    public static Blob buildBlobFromString(String responseAsString) {
        Blob responseAsBlob = Blob.valueOf(responseAsString);
        return responseAsBlob;
    }
}
