public class DealerWrapper {
    public String DealerSystemCode {get; set;}
    public String DealerSystemName {get; set;}
    public String DealerCode {get; set;}
    public String Name {get; set;}
    public String Area {get; set;}
    public String City {get; set;}
    public String Address {get; set;}
    public String Telephone {get; set;}
    public String ServiceHours {get; set;}
    public String PictureURL {get; set;}
    public String GPSLng {get; set;}
    public String GPSLat {get; set;}
    public String MapURL {get; set;}

    public DealerWrapper(Dealer__c givenSObject) {
        this.DealerSystemCode = givenSObject.DealerSystemCode__c;
        this.DealerSystemName = givenSObject.DealerSystemName__c;
        this.DealerCode = givenSObject.DealerCode__c;
        this.Name = givenSObject.Name;
        this.Area = givenSObject.Area__c;
        this.City = givenSObject.City__c;
        this.Address = givenSObject.Address__c;
        this.Telephone = givenSObject.Telephone__c;
        this.ServiceHours = givenSObject.ServiceHours__c;
        this.PictureURL = givenSObject.PhotoURL__c;
        this.GPSLng = String.valueOf(givenSObject.GPSlLngLat__longitude__s);
        this.GPSLat = String.valueOf(givenSObject.GPSlLngLat__latitude__s);
        this.MapURL = givenSObject.MapURL__c;
    }
}
