global class LineActivityCarTestInsertWrapper extends DtoBase {
    public String lineActivityCarTestID {get; set;}
    public String dealerCode {get; set;}
    public String carModel {get; set;}
    public String powerType {get; set;}
    public String status {get; set;}
    public String lineUID {get; set;}
    public String chooseSalesRepresentativeCode {get ;set;}
    
    global override String getSObjectName() {
        return 'ActivityCarTest__c';
    }

    global override Map<String, Object> getSObjectMap() {
        return new Map<String, Object> {
            'LineActivityCarTestID__c' => this.lineActivityCarTestID,
            'CarModel__c' => this.carModel,
            'PowerType__c' => this.powerType,
            'Status__c' => this.status
        };
    }

    global static LineActivityCarTestInsertWrapper parseJson(String jsonString) {
        return (LineActivityCarTestInsertWrapper) System.JSON.deserialize(jsonString, LineActivityCarTestInsertWrapper.class);
    }
}
