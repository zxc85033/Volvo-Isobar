@RestResource(urlMapping = '/smt/salesrepresentative')
global with sharing class SmtSalesRepresentativeApi {
    @HttpPost
    global static void createOrUpdateSalesRepresentative() {
        RestRequest request = RestContext.request;
        System.debug(request.requestBody);
        RestResponse response = Restcontext.response;
        MessageResponse messageResponse = (MessageResponse) JSON.deserialize(request.requestBody.toString(), MessageResponse.class);
        
        response.statusCode = 200;
        Blob resAsBlob = ApiResponseUtil.buildBlobFromString('Message is ' + messageResponse.message + ' and code is ' + messageResponse.httpCode);
        response.responseBody = resAsBlob;
   }
}
