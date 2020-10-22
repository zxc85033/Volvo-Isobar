public with sharing class LineCallout {
    @future(callout=true)
    public static void carTestRouterTriggerCallout(String carTestRouterAsJson) {
        HttpResponse response = HttpUtil.sendHttpGet('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        MessageResponse messageResponse = new MessageResponse();
        messageResponse.httpCode = response.getStatusCode();
        messageResponse.message = response.getBody();

        System.debug(messageResponse.message);
    }
}
