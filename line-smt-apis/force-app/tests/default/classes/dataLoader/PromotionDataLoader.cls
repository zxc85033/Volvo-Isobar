public with sharing class PromotionDataLoader {
    
    public static void loadData() {
        Promotion__c data = new Promotion__c();

        data.PromotionContent__c = 'XXX';
        data.PromotionYear__c = 'XXX';
        data.PromotionMonth__c = 'XXX';

        data.PowerType__c = Constants.PicklistPromotionPowerTypeGas;
        data.YearType__c = 'XXX';
        data.SuggestedPrice__c = 666;
        data.Status__c = Constants.PicklistPromotionStatusEnabled;
        data.CarStyle__c = 'XXX';
        data.CarModel__c = 'XXX';

        insert data;
    }
}