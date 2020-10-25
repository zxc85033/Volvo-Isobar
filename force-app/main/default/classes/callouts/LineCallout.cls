public with sharing class LineCallout {
    
    @future(callout=true)
    public static void lineFutureTriggerCallout(String lineUrl, String objectAsJson) {
        HttpResponse response = HttpUtil.sendHttpPost(lineUrl, objectAsJson);
        MessageResponse messageResponse = new MessageResponse();
        messageResponse.httpCode = response.getStatusCode();
        messageResponse.message = response.getBody();

        System.debug(messageResponse.message);
    }

}
