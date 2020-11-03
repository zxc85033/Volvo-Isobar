public with sharing class DealerDataLoader {
    
    public static void loadData() {
        Dealer__c data = new Dealer__c();

        data.Area__c = Constants.PicklistDealerAreaNorth;
        data.PhotoURL__c = 'https://images.google.com';
        data.Address__c = 'Taipei';
        data.ServiceHours__c = 'XXX';
        data.DealerCode__c = 'AMA';
        data.DealerSystemCode__c = 'XXXX';
        data.DealerSystemName__c = 'YYYY';
        data.City__c = '台北市';
        data.Telephone__c = '0989123456';

        insert data;
    }
}