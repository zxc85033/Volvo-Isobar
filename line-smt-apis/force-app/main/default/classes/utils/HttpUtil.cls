public with sharing class HttpUtil {
    
    public static HttpResponse sendHttpGet(String url) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
    
        HttpResponse response = http.send(request);

        return response;
    }

    public static HttpResponse sendHttpPost(String url, String bodyAsJson) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(bodyAsJson);
    
        HttpResponse response = http.send(request);

        return response;
    }
}
