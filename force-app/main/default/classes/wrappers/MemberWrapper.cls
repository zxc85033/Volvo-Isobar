global with sharing class MemberWrapper extends DtoBase {
    public String lineUID {get; set;}
    public String name {get; set;}
    public String gender {get; set;}
    public String cellPhone {get; set;}
    public String email {get; set;}
    public String birthday {get; set;}

    global override String getSObjectName() {
        return 'Member__c';
    }

    global override Map<String, Object> getSObjectMap() {
        return new Map<String, Object> {
            'LineUID__c' => this.lineUID,
            'Name' => this.name,
            'Gender__c' => this.gender,
            'CellPhone__c' => this.cellPhone,
            'Email__c' => this.email,
            'Birthday__c' => this.birthday
        };
    }

    global static MemberWrapper parseJson(String jsonString) {
        return (MemberWrapper) System.JSON.deserialize(jsonString, MemberWrapper.class);
    }
}

