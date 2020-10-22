public with sharing class CarTestRouterDataLoader {
    
    public static void loadData() {
        CarTestRoute__c data = new CarTestRoute__c();

        data.GoogleMapLink__c = 'https://maps.google.com/';
        data.CarTestRouteType__c = Constants.PicklistCarTestRouteTypeUrban;
        data.TestDriveExperienceProject__c = 'OK';
        data.DrivingDistance__c = '100';
        data.RouteDescription__c = 'Dangerous';
        data.DrivingTime__c = 'Short';

        insert data;
    }
}