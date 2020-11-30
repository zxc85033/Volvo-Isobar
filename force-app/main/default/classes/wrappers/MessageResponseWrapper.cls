public with sharing class MessageResponseWrapper {
    public String status {get; set;}
    public String message {get; set;}
    
    public MessageResponseWrapper() {
    }

    public MessageResponseWrapper(String status, String message) {
        this.status = status;
        this.message = message;
    }
}
