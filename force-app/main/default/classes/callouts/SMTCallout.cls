public class SMTCallout {

    public static String getAccessToken() {
        HttpResponse response = HttpUtil.sendHttpPostForSmtAccessToken();
        Map<String, Object> mappedJsonResponseBody = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        return mappedJsonResponseBody.get('token').toString();
    }

    @future(callout=true)
    public static void smtFutureCallout(String smtUrl, String objectAsJson) {
        HttpResponse response = HttpUtil.sendHttpPostForSmt(Constants.SMT_HOST + smtUrl, objectAsJson);
        MessageResponseWrapper messageResponse = new MessageResponseWrapper();
        messageResponse.status = response.getStatusCode() == 200? Constants.REST_RESPONSE_SUCCEEDED : Constants.REST_RESPONSE_FAIL;
        messageResponse.message = response.getStatusCode() == 200? null : response.getBody();

        System.debug(messageResponse.message);
    }
}
