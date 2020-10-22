public with sharing class MessageResponse {
    public String message {get; set;}

    public Integer httpCode {get; set;}
    
    public MessageResponse() {
    }

    public MessageResponse(String message) {
        this.message = message;
    }
}
