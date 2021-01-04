public class LineToSmtCarViewUpdateWrapper {
    public String lineActivityID {get; set;}
    public String status {get; set;}
    public Integer satisfaction {get; set;}
    
    public LineToSmtCarViewUpdateWrapper(LineActivityCarViewUpdateWrapper wrapper) {
        this.lineActivityID = wrapper.lineActivityCarViewID;
        this.status = wrapper.status;
        this.satisfaction = wrapper.satisfaction;
    }
}
