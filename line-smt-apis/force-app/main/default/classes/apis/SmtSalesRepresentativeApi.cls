@RestResource(urlMapping = '/smt/salesrepresentative/*')
global with sharing class SmtSalesRepresentativeApi {
    @HttpPost
    global static void createOrUpdateSalesRepresentative(SalesRepresentative__c salesRepresentative) {
        RestResponse response = Restcontext.response;
        
        response.statusCode = 200;
   }
}
