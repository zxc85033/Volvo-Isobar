public with sharing class LineCallout {
    
    @future(callout=true)
    public static void lineFutureCallout(String lineUrl, String objectAsJson) {
        HttpResponse response = HttpUtil.sendHttpPostForLine(lineUrl, objectAsJson);
        MessageResponseWrapper messageResponse = new MessageResponseWrapper();
        messageResponse.httpCode = response.getStatusCode();
        messageResponse.message = response.getBody();

        System.debug(messageResponse.message);
    }
}
