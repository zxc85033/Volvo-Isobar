public class LineCallout {
    
    @future(callout=true)
    public static void lineFutureCallout(String lineUrl, String objectAsJson) {
        HttpResponse response = HttpUtil.sendHttpPostForLine(Constants.LINE_HOST + lineUrl, objectAsJson);
        MessageResponseWrapper messageResponse = new MessageResponseWrapper();
        messageResponse.status = response.getStatusCode() == 200? Constants.REST_RESPONSE_SUCCEEDED : Constants.REST_RESPONSE_FAIL;
        messageResponse.message = response.getStatusCode() == 200? null : response.getBody();

        System.debug(messageResponse.message);
    }
}
