global class LineActivityCarTestUpdateWrapper extends DtoBase {
    public String lineActivityCarTestID {get; set;}
    public String status {get; set;}
    public String companion {get; set;}
    public String safetySeatQuantity {get; set;}
    public String garageTestRequirement {get; set;}
    public String carTestRouteID {get; set;}
    public String purchaseDecision {get; set;}
    public Integer satisfaction {get; set;}

    global override String getSObjectName() {
        return 'ActivityCarTest__c';
    }

    global override Map<String, Object> getSObjectMap() {
        return new Map<String, Object> {
            'LineActivityCarTestID__c' => this.lineActivityCarTestID,
            'Status__c' => this.status,
            'Companion__c' => this.companion,
            'SafetySeatQuantity__c' => this.safetySeatQuantity,
            'GarageTestRequirement__c' => this.garageTestRequirement,
            'PurchaseDecision__c' => this.purchaseDecision,
            'Satisfaction__c' => this.satisfaction
        };
    }

    global static LineActivityCarTestUpdateWrapper parseJson(String jsonString) {
        return (LineActivityCarTestUpdateWrapper) System.JSON.deserialize(jsonString, LineActivityCarTestUpdateWrapper.class);
    }
}
