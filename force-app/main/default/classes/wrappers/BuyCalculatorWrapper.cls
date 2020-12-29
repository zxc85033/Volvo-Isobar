public class BuyCalculatorWrapper {
    
    public String BuyCalculatorID {get; set;}
    public String CarSeries {get; set;}
    public String CarModel {get; set;}
    public String PowerType {get; set;}
    public String CarStyle {get; set;}
    public String YearType {get; set;}
    public String CarName {get; set;}
    public String SuggestedPrice {get; set;}
    public String PlanType {get; set;}
    public String PlanName {get; set;}
    public String DownPayment {get; set;}
    public String LoanAmount {get; set;}
    public String LoanPeriod {get; set;}
    public String Period1 {get; set;}
    public String Period2 {get; set;}
    public String CashPrice {get; set;}
    public String Status {get; set;}

    public BuyCalculatorWrapper(BuyCalculator__c givenSObject) {
        this.BuyCalculatorID = givenSObject.Id;
        this.CarSeries = givenSObject.CarSeries__c;
        this.CarModel = givenSObject.CarModel__c;
        this.PowerType = givenSObject.PowerType__c;
        this.CarStyle = givenSObject.CarStyle__c;
        this.YearType = givenSObject.YearType__c;
        this.CarName = givenSObject.CarName__c;
        this.SuggestedPrice = givenSObject.SuggestedPrice__c;
        this.PlanType = givenSObject.PlanType__c;
        this.PlanName = givenSObject.PlanName__c;
        this.DownPayment = givenSObject.DownPayment__c;
        this.LoanAmount = givenSObject.LoanAmount__c;
        this.LoanPeriod = givenSObject.LoanPeriod__c;
        this.Period1 = givenSObject.Period1__c;
        this.Period2 = givenSObject.Period2__c;
        this.CashPrice = givenSObject.CashPrice__c;
        this.Status = givenSObject.Status__c;
    }    
}
