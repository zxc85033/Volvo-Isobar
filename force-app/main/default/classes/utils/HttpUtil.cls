public with sharing class HttpUtil {
    
    public static HttpResponse sendHttpGet(String url) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
    
        HttpResponse response = http.send(request);

        ApiLogger.log(request, response);

        return response;
    }

    public static HttpResponse sendHttpPostForLine(String url, String stringBodyAsJson) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Ocp-Apim-Subscription-Key', 'b32fd1d39b1f423790949e60c38910cb');
        request.setBody(stringBodyAsJson);

        System.debug('---- Sending HTTP POST Request ----');
        System.debug('URL:' + url);
        System.debug('body:' + stringBodyAsJson);
    
        HttpResponse response = http.send(request);

        System.debug('response code:' + response.getStatusCode());
        System.debug('response body:' + response.getBody());

        ApiLogger.log(request, response);

        return response;
    }

    public static HttpResponse sendHttpPostForSmt(String url, String stringBodyAsJson) {
        String accessToken = SMTCallout.getAccessToken();
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        request.setBody(stringBodyAsJson);

        System.debug('---- Sending HTTP POST Request ----');
        System.debug('URL:' + url);
        System.debug('body:' + stringBodyAsJson);
    
        HttpResponse response = http.send(request);

        ApiLogger.log(request, response);

        System.debug('response code:' + response.getStatusCode());
        System.debug('response body:' + response.getBody());

        return response;
    }

    public static HttpResponse sendHttpPostForSmtAccessToken() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Constants.SMT_HOST + Constants.SMT_ENDPOINT_TOKEN);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(Constants.SMT_ACCESS_TOKEN_BODY);

        System.debug('---- Sending HTTP POST Request ----');
        
        HttpResponse response = http.send(request);

        System.debug('response code:' + response.getStatusCode());
        System.debug('response body:' + response.getBody());

        return response;
    }
}
