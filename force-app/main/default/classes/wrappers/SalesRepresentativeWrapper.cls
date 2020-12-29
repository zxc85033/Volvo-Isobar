global with sharing class SalesRepresentativeWrapper extends DtoBase {
    public String salesRepresentativeCode {get; set;}
    public String salesRepresentativeName {get; set;}
    public String dealerCode {get; set;}
    public String nickname {get; set;}
    public String cellPhone {get; set;}
    public String telephone {get; set;}
    public String lineID {get; set;}
    public String lineLink {get; set;}
    public String selfRecommendedContent {get; set;}
    public String workingStatus {get; set;}
    public String QRCodeLink {get; set;}
    public String Email {get; set;}

    global override String getSObjectName() {
		  return 'SalesRepresentative__c';
	  }

	global override Map<String, Object> getSObjectMap() {
		return new Map<String, Object> {
			'SalesRepresentativeCode__c' => this.salesRepresentativeCode,
			'Name' => this.salesRepresentativeName,
			'NickName__c' => this.nickname,
			'CellPhone__c' => this.cellPhone,
			'Telephone__c' => this.telephone,
      'LineID__c' => this.lineID,
      'LineLink__c' => this.lineLink,
      'SelfRecommendedContent__c' => this.selfRecommendedContent,
      'WorkingStatus__c' => this.workingStatus,
      'QRCodeLink__c' => this.QRCodeLink
		};
  }
  
  global static SalesRepresentativeWrapper parseJson(String jsonString) {
    return (SalesRepresentativeWrapper) System.JSON.deserialize(jsonString, SalesRepresentativeWrapper.class);
  }
}
