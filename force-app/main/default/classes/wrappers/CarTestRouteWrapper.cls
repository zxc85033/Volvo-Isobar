public class CarTestRouteWrapper {
    public String CarTestRouteID {get; set;}
    public String DealerCode {get; set;}
    public String CarTestRouteType {get; set;}
    public String DrivingTime{get; set;}
    public String DrivingDistance {get; set;}
    public String RouteDescription {get; set;}
    public String GoogleMapLink {get; set;}
    public String CarTestExperienceProject {get; set;}
    
    public CarTestRouteWrapper(CarTestRoute__c givenSObject, Dealer__c dealerObject) {
        this.CarTestRouteID = givenSObject.Name;
        this.DealerCode = dealerObject.DealerCode__c;
        this.CarTestRouteType = givenSObject.CarTestRouteType__c;
        this.DrivingTime = givenSObject.DrivingTime__c;
        this.DrivingDistance = givenSObject.DrivingDistance__c;
        this.RouteDescription = givenSObject.RouteDescription__c;
        this.GoogleMapLink = givenSObject.GoogleMapLink__c;
        this.CarTestExperienceProject = givenSObject.CarTestExperienceProject__c;    
    }

}
