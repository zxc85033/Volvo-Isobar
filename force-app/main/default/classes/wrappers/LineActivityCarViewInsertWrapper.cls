global with sharing class LineActivityCarViewInsertWrapper extends DtoBase {
    public String lineActivityCarViewID {get; set;}
	public String dealerCode {get; set;}
	public String carModel {get; set;}
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
            'CarModel__c' => this.carModel,
            'PowerType__c' => this.powerType,
            'Status__c' => this.status,
            'ActivityCarViewDate__c' => this.activityCarViewDate!= null? Datetime.valueOf(this.activityCarViewDate): null,
            'Satisfaction__c' => this.satisfaction,
            'ChooseMethod__c' => this.chooseMethod
        };
    }

    global static LineActivityCarViewInsertWrapper parseJson(String jsonString) {
        return (LineActivityCarViewInsertWrapper) System.JSON.deserialize(jsonString, LineActivityCarViewInsertWrapper.class);
    }
}
