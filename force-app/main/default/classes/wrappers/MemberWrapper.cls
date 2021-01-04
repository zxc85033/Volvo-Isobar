public class MemberWrapper {
    public String LineUID {get; set;}
    public String Name {get; set;}
    public String Gender {get; set;}
    public String CellPhone {get; set;}
    public String Email {get; set;}
    public String Birthday {get; set;}
    public String IsAgree {get; set;}
    public String IsPush {get; set;}

    public MemberWrapper(Member__c givenSObject) {
        this.lineUID = givenSObject.lineUID__c;
        this.name = givenSObject.Name;
        this.gender = givenSObject.gender__c;
        this.cellPhone = givenSObject.cellPhone__c;
        this.email = givenSObject.email__c;
        this.birthday = String.valueOf(givenSObject.birthday__c);
        this.IsAgree = givenSObject.MemberAgreement__c == true? 'Y' : 'N';
        this.IsPush = givenSObject.LinePushAgreement__c == true? 'Y' : 'N';
    }
}
