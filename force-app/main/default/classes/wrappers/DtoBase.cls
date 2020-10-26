global abstract class DtoBase {
	
	global abstract String getSObjectName();
	global abstract Map<String, Object> getSObjectMap();
	
	global virtual SObject ToSObject() {
		SObject obj = Schema.getGlobalDescribe().get(getSObjectName()).newSObject();
		Map<String, Object> objectMap = getSObjectMap();			

		for (String sObjectField : objectMap.keySet()) {
			obj.put(sObjectField, objectMap.get(sObjectField));
		}
		
		return obj;
	} 
	
}