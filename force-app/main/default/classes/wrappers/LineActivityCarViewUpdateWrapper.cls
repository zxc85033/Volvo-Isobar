global with sharing class LineActivityCarViewUpdateWrapper extends DtoBase {
    public String lineActivityCarViewID {get; set;}
	public String status {get; set;}
	public String satisfaction {get; set;}
   
    global override String getSObjectName() {
        return 'ActivityCarView__c';
    }

    global override Map<String, Object> getSObjectMap() {
        return new Map<String, Object> {
            'LineActivityCarViewID__c' => this.lineActivityCarViewID,
            'Status__c' => this.status,
            'Satisfaction__c' => this.satisfaction
        };
    }

    global static LineActivityCarViewUpdateWrapper parseJson(String jsonString) {
        return (LineActivityCarViewUpdateWrapper) System.JSON.deserialize(jsonString, LineActivityCarViewUpdateWrapper.class);
    }
}
