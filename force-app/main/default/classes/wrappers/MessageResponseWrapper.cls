public with sharing class MessageResponseWrapper {
    public String message {get; set;}

    public Integer httpCode {get; set;}
    
    public MessageResponseWrapper() {
    }

    public MessageResponseWrapper(String message) {
        this.message = message;
    }
}
