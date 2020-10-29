public with sharing class SObjectUtil {
    
    public static SObject updateFirstObjectWithNonNullValueOfSecondObject(SObject object1, SObject object2) {
        for (SObjectField field:object1.getSObjectType().getDescribe().fields.getMap().values()) {
            try {
                Object opp1Field = object1.get(field);
                Object opp2Field = object2.get(field);
                if (opp2Field != null) {
                    object1.put(field, opp2Field);
                }
            } catch (SObjectException ex) {
            }
          }
        return object1;
    }
}
