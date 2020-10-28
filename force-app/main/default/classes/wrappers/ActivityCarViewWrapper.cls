global with sharing class ActivityCarViewWrapper extends DtoBase {
    public String lineActivityCarViewID {get; set;}
	public String activityID {get; set;}
	public String SMTLeadID {get; set;}
	public String salesRepresentativeCode {get; set;}
	public String dealerCode {get; set;}
	public String carStyle {get; set;}
	public String powerType {get; set;}
	public String status {get; set;}
	public String activityCarViewDate {get; set;}
    public String satisfaction {get; set;}
    
    public String lineUID {get; set;}
    public String chooseMethod {get; set;}
    public String chooseSalesRepresentativeCode {get; set;}
    
    global override String getSObjectName() {
        return 'ActivityCarView__c';
    }

    global override Map<String, Object> getSObjectMap() {
        return new Map<String, Object> {
            'LineActivityCarViewID__c' => this.lineActivityCarViewID,
            'ActivityID__c' => this.activityID,
            'Dealer__c' => this.dealerCode,
            'CarStyle__c' => this.carStyle,
            'PowerType__c' => this.powerType,
            'Status__c' => this.status,
            'ActivityCarViewDate__c' => Datetime.valueOf(this.activityCarViewDate),
            'Satisfaction__c' => this.satisfaction,
            'ChooseMethod__c' => this.chooseMethod,
            'ChooseSalesRepresentative__c' => this.chooseSalesRepresentativeCode
        };
    }

    global static ActivityCarViewWrapper parseJson(String jsonString) {
        return (ActivityCarViewWrapper) System.JSON.deserialize(jsonString, ActivityCarViewWrapper.class);
    }
}
