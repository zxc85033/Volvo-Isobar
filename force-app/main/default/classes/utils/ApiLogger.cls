public class ApiLogger {
    
    public static void log(HttpRequest request, HttpResponse response) {
        APILog__c apiLog = new APILog__c();
        apiLog.RequestBody__c = request.getBody();
        Map<String, Object> mappedJsonResponseBody = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        if (mappedJsonResponseBody != null) {
            apiLog.ResponseBody__c = JSON.serialize(mappedJsonResponseBody.get('message'));
        }
        apiLog.RequestMethod__c = request.getMethod();
        apiLog.RequestTime__c = Datetime.now();
        apiLog.RequestURL__c = request.getEndpoint();
        apiLog.StatusCode__c = response.getStatusCode();

        insert apiLog;
    }

    public static void log(RestRequest request, RestResponse response) {
        APILog__c apiLog = new APILog__c();
        if (request.requestBody != null) {
            apiLog.RequestBody__c = request.requestBody.toString();
        }
        if (response.responseBody != null) {
            apiLog.ResponseBody__c = response.responseBody.toString();
        }
        apiLog.RequestMethod__c = request.httpMethod;
        apiLog.RequestTime__c = Datetime.now();
        apiLog.RequestURL__c = request.requestURI;
        apiLog.StatusCode__c = response.statusCode;

        insert apiLog;
    }
}