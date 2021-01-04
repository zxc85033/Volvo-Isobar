public class SmtToLineCarViewWrapper {
    
    public String CarViewID {get; set;}
    public String ActivityID {get; set;}
    public String SMTLeadID {get; set;}
    public String CarModel {get; set;}
    public String PowerType {get; set;}
    public String Status {get; set;}
    public String CarViewDate {get; set;}
    public String SalesRepresentativeCode {get; set;}

    public SmtToLineCarViewWrapper(SmtActivityCarViewWrapper wrapper) {
        this.CarViewID = wrapper.lineActivityCarViewID;
        this.ActivityID = wrapper.activityID;
        this.SMTLeadID = wrapper.SMTLeadID;
        this.SalesRepresentativeCode = wrapper.salesRepresentativeCode;
        this.CarModel = wrapper.carModel;
        this.PowerType = wrapper.powerType;
        this.Status = wrapper.status;
        this.CarViewDate = wrapper.activityCarViewDate;
        this.SalesRepresentativeCode = wrapper.salesRepresentativeCode;
    }
}
