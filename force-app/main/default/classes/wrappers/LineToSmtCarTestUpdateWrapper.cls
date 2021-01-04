public class LineToSmtCarTestUpdateWrapper {
    
    public String lineActivityID {get; set;}
    public String status {get; set;}
    public String companion {get; set;}
    public String safetySeatQuantity {get; set;}
    public String garageTestRequirement {get; set;}
    public String carTestRouteID {get; set;}
    public String purchaseDecision {get; set;}
    public Integer satisfaction {get; set;}
    
    public LineToSmtCarTestUpdateWrapper(LineActivityCarTestUpdateWrapper wrapper) {
        this.lineActivityID = wrapper.lineActivityCarTestID;
        this.status = wrapper.status;
        this.companion = wrapper.companion;
        this.safetySeatQuantity = wrapper.safetySeatQuantity;
        this.garageTestRequirement = wrapper.garageTestRequirement;
        this.carTestRouteID = wrapper.carTestRouteID;
        this.purchaseDecision = wrapper.purchaseDecision;
        this.satisfaction = wrapper.satisfaction;
    }
}
