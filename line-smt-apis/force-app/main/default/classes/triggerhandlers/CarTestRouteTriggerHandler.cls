public with sharing class CarTestRouteTriggerHandler extends TriggerHandler {
    public CarTestRouteTriggerHandler() {
    }

    protected override void afterUpdate() {
        sendToLine();
    }

    protected override void afterInsert() {
        sendToLine();
    }

    private MessageResponse sendToLine() {

        HttpResponse response = HttpUtil.sendHttpGet('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        MessageResponse messageResponse = new MessageResponse();
        messageResponse.httpCode = response.getStatusCode();
        messageResponse.message = response.getBody();

        System.debug(messageResponse.message);

        return messageResponse;
    }
}
