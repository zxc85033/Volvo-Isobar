public with sharing class HttpUtil {
    
    public static HttpResponse sendHttpGet(String url) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
    
        HttpResponse response = http.send(request);

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

        return response;
    }
}
