global class SmtActivityCarTestWrapper extends DtoBase {
    public String lineActivityCarTestID {get; set;}
    public String activityID {get; set;}
    public String SMTLeadID {get; set;}
    public String salesRepresentativeCode {get; set;}
    public String carModel {get; set;}
    public String powerType {get; set;}
    public String status {get; set;}
    public String activityCarTestDate {get; set;}
    
    global override String getSObjectName() {
        return 'ActivityCarTest__c';
    }

    global override Map<String, Object> getSObjectMap() {
        return new Map<String, Object> {
            'LineActivityCarTestID__c' => this.lineActivityCarTestID,
            'ActivityID__c' => this.activityID,
            'CarModel__c' => this.carModel,
            'PowerType__c' => this.powerType,
            'Status__c' => this.status,
            'ActivityCarTestDate__c' => this.activityCarTestDate != null? Datetime.valueOf(this.activityCarTestDate) : null
        };
    }

    global static SmtActivityCarTestWrapper parseJson(String jsonString) {
        return (SmtActivityCarTestWrapper) System.JSON.deserialize(jsonString, SmtActivityCarTestWrapper.class);
    }
}
