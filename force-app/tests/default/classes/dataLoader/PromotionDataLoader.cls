public with sharing class PromotionDataLoader {
    
    public static void loadData() {
        Promotion__c data = new Promotion__c();

        data.PromotionContent__c = 'XXX';
        data.PromotionYear__c = '2020';
        data.PromotionMonth__c = '1';

        data.PowerType__c = Constants.PICKLIST_PROMOTION_POWER_TYPE_GAS;
        data.YearType__c = 'XXX';
        data.SuggestedPrice__c = 666;
        data.Status__c = Constants.PICKLIST_PROMOTION_STATUS_ENABLED;
        data.CarStyle__c = 'XXX';
        data.CarModel__c = 'XXX';

        insert data;
    }
}