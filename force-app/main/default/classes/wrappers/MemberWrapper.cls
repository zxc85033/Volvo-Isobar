public class MemberWrapper {
    public String lineUID {get; set;}
    public String name {get; set;}
    public String gender {get; set;}
    public String cellPhone {get; set;}
    public String email {get; set;}
    public String birthday {get; set;}
    public String IsAgree {get; set;}
    public String IsPush {get; set;}

    public MemberWrapper(Member__c givenSObject) {
        this.lineUID = givenSObject.lineUID__c;
        this.name = givenSObject.Name;
        this.gender = givenSObject.gender__c;
        this.cellPhone = givenSObject.cellPhone__c;
        this.email = givenSObject.email__c;
        this.birthday = String.valueOf(givenSObject.birthday__c);
        this.IsAgree = String.valueOf(givenSObject.MemberAgreement__c);
        this.IsPush = String.valueOf(givenSObject.LinePushAgreement__c);
    }
}
