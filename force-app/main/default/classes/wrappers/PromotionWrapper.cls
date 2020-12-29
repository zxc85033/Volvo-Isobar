global with sharing class PromotionWrapper {
    public String PromotionID {get; set;}
    public String PromotionYear {get; set;}
    public String PromotionMonth {get; set;}
    public String CarSeries {get; set;}
    public String CarModel {get; set;}
    public String CarStyle {get; set;}
    public String CarName {get; set;}
    public String YearType {get; set;}
    public String SuggestedPrice {get; set;}
    public String PromotionContent {get; set;}
    public String Status {get; set;}

    public PromotionWrapper(Promotion__c promotionObject) {
        
        this.PromotionID = promotionObject.Id;
        this.PromotionYear = promotionObject.PromotionYear__c;
        this.PromotionMonth = promotionObject.PromotionMonth__c;
        
        this.CarSeries = promotionObject.CarSeries__c;
        this.CarModel = promotionObject.CarModel__c;
        this.CarStyle = promotionObject.CarStyle__c;
        this.CarName = promotionObject.CarName__c;

        this.YearType = promotionObject.YearType__c;
        this.SuggestedPrice = promotionObject.SuggestedPrice__c;
        this.PromotionContent = promotionObject.PromotionContent__c;
        
        this.Status = promotionObject.Status__c;

    }

}
