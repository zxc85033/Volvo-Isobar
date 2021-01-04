public class LineToSmtCarInsertWrapper {

    public String lineUID {get; set;}
    public String lineActivityID {get; set;}
    public String dealerCode {get; set;}
    public String user_id {get; set;}
    public String carModel {get; set;}
    public String powerType {get; set;}
    public String status {get; set;}

    public LineToSmtCarInsertWrapper(LineActivityCarViewInsertWrapper wrapper) {
        this.lineUID = wrapper.lineUID;
        this.lineActivityID = wrapper.lineActivityCarViewID;
        this.dealerCode = wrapper.dealerCode;
        this.user_id = wrapper.chooseSalesRepresentativeCode;
        this.carModel = wrapper.carModel;
        this.powerType = wrapper.powerType;
        this.status = wrapper.status;
    }

    public LineToSmtCarInsertWrapper(LineActivityCarTestInsertWrapper wrapper) {
        this.lineUID = wrapper.lineUID;
        this.lineActivityID = wrapper.lineActivityCarTestID;
        this.dealerCode = wrapper.dealerCode;
        this.user_id = wrapper.chooseSalesRepresentativeCode;
        this.carModel = wrapper.carModel;
        this.powerType = wrapper.powerType;
        this.status = wrapper.status;
    }
}
