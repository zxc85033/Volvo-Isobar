global class LineActivityCarTestInsertWrapper extends DtoBase {
    public String lineActivityCarTestID {get; set;}
    public String activityID {get; set;}
    public String SMTLeadID {get; set;}
    public String salesRepresentativeCode {get; set;}
    public String dealerCode {get; set;}
    public String carModel {get; set;}
    public String powerType {get; set;}
    public String status {get; set;}
    public String activityCarTestDate {get; set;}
    public String companion {get; set;}
    public String safetySeatRequirement {get; set;}
    public String safetySeatQuantity {get; set;}
    public String garageTestRequirement {get; set;}
    public String carTestRouteCode {get; set;}
    public String purchaseDecision {get; set;}
    public String lastTestCarStyle {get; set;}
    public String satisfaction {get; set;}

    public String lineUID {get; set;}
    public String chooseMethod {get; set;}
    public String chooseSalesRepresentativeCode {get ;set;}
    
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
            'ActivityCarTestDate__c' => this.activityCarTestDate != null? Datetime.valueOf(this.activityCarTestDate) : null,
            'Companion__c' => this.companion,
            'SafetySeatRequirement__c' => this.safetySeatRequirement,
            'SafetySeatQuantity__c' => this.safetySeatQuantity,
            'GarageTestRequirement__c' => this.garageTestRequirement,
            'PurchaseDecision__c' => this.purchaseDecision,
            'LastTestCarStyle__c' => this.lastTestCarStyle,
            'Satisfaction__c' => this.satisfaction,
            'ChooseMethod__c' => this.chooseMethod
        };
    }

    global static LineActivityCarTestInsertWrapper parseJson(String jsonString) {
        return (LineActivityCarTestInsertWrapper) System.JSON.deserialize(jsonString, LineActivityCarTestInsertWrapper.class);
    }
}
