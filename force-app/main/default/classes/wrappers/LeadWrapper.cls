global with sharing class LeadWrapper extends DtoBase {
    public String SMTLeadID {get; set;}
    public String salesRepresentativeCode {get; set;}
    public String exSalesRepresentativeCode {get; set;}
    public String leadLevel {get; set;}

    global override String getSObjectName() {
        return 'Lead__c';
    }

    global override Map<String, Object> getSObjectMap() {
        return new Map<String, Object> {
            'SMTLeadId__c' => this.SMTLeadID,
            'SalesRepresentative__c	' => this.salesRepresentativeCode,
            'ExSalesRepresentative__c' => this.exSalesRepresentativeCode,
            'LeadLevel__c' => this.leadLevel
        };
    }

    global static LeadWrapper parseJson(String jsonString) {
        return (LeadWrapper) System.JSON.deserialize(jsonString, LeadWrapper.class);
    }
}
