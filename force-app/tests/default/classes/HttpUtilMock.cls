@isTest
global class HttpUtilMock implements HttpCalloutMock {
    global HttpResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setStatus('OK');
        res.setStatusCode(200);
        res.setBody('OK');
        return res;
    }
}