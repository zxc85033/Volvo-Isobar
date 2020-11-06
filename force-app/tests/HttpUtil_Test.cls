@isTest
public with sharing class HttpUtil_Test {
    @isTest
    static void test_send_http_get_expect_200_contains_ok() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new HttpUtilMock());
        HttpResponse response = HttpUtil.sendHttpGet('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getBody());
        Test.stopTest();
    }

    @isTest
    static void test_send_http_post_expect_200_contains_ok() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new HttpUtilMock());
        HttpResponse response = HttpUtil.sendHttpPostForLine('https://postman-echo.com/post', '{}');
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getBody());
        Test.stopTest();
    }
}
