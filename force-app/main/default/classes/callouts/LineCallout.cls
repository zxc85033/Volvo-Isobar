public with sharing class LineCallout {
    
    @future(callout=true)
    public static void lineFutureTriggerCallout(String lineUrl, String objectAsJson) {
        HttpResponse response = HttpUtil.sendHttpPost(lineUrl, objectAsJson);
        MessageResponseWrapper messageResponse = new MessageResponseWrapper();
        messageResponse.httpCode = response.getStatusCode();
        messageResponse.message = response.getBody();

        System.debug(messageResponse.message);
    }

    @future(callout=true)
    public static void externalLineApiPromotion() {
        Http http = new Http();
        HttpRequest callout = new HttpRequest();
        callout.setEndpoint(Constants.linecalloutHost + 'promotion');
        callout.setMethod('POST');
        callout.setHeader('Ocp-Apim-Subscription-Key', 'b32fd1d39b1f423790949e60c38910cb');
        
        /*
        String boundary = '----WebKitFormBoundary' + String.valueOf(DateTime.now().getTime());
        callout.setHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
        
        String body = boundary + '\r\n';
        body += 'Content-Disposition: form-data; name="PromotionID"\r\n\n';
        body += '1\r\n';
        body += boundary;
        callout.setBody(body);
        callout.setHeader('Content-Length', String.valueof(body.length()));
        */
        callout.setBody('PromotionId=1');

        HttpResponse responseCallout = http.send(callout);
        System.debug('Response Callout http code is:' + responseCallout.getStatusCode() + ' and body is:' + responseCallout.getBody());
    }

}
