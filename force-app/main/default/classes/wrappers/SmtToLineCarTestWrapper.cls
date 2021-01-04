public class SmtToLineCarTestWrapper {
    
    public String CarTestID {get; set;}
    public String ActivityID {get; set;}
    public String SMTLeadID {get; set;}
    public String CarModel {get; set;}
    public String PowerType {get; set;}
    public String Status {get; set;}
    public String CarTestDate {get; set;}
    public String SalesRepresentativeCode {get; set;}

    public SmtToLineCarTestWrapper(SmtActivityCarTestWrapper wrapper) {
        this.CarTestID = wrapper.lineActivityCarTestID;
        this.ActivityID = wrapper.activityID;
        this.SMTLeadID = wrapper.SMTLeadID;
        this.SalesRepresentativeCode = wrapper.salesRepresentativeCode;
        this.CarModel = wrapper.carModel;
        this.PowerType = wrapper.powerType;
        this.Status = wrapper.status;
        this.CarTestDate = wrapper.activityCarTestDate;
        this.SalesRepresentativeCode = wrapper.salesRepresentativeCode;
    }
}
