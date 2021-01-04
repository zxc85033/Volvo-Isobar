public with sharing class Constants {
    public final static String PICKLIST_MEMBER_GENDER_MISTER = '先生';
    public final static String PICKLIST_MEMBER_GENDER_MISS = '小姐';

    public final static String PICKLIST_CAR_TEST_ROUTE_TYPE_URBAN = '市區道路';
    public final static String PICKLIST_CAR_TEST_ROUTE_TYPE_MOUNTAIN = '山區道路';
    public final static String PICKLIST_CAR_TEST_ROUTE_TYPE_HIGHWAY = '高速道路';
    public final static String PICKLIST_CAR_TEST_ROUTE_TYPE_OTHER = '其他';

    public final static String PICKLIST_DEALER_AREA_NORTH = '北';
    public final static String PICKLIST_DEALER_AREA_SOUTH = '南';
    public final static String PICKLIST_DEALER_AREA_MIDDLE = '中';
    public final static String PICKLIST_DEALER_AREA_EAST = '東';

    public final static String PICKLIST_PROMOTION_POWER_TYPE_GAS = 'Drive-e 汽油車款';
    public final static String PICKLIST_PROMOTION_POWER_TYPE_HYBRID = '高效輕油電車款';
    public final static String PICKLIST_PROMOTION_POWER_TYPE_HYBRID_PHEV = '雙能電動車款';

    public final static String PICKLIST_PROMOTION_STATUS_ENABLED = '啟用';
    public final static String PICKLIST_PROMOTION_STATUS_DISABLED = '停用';
   
    public final static String PICKLIST_CHOOSE_SALES_REPS_MANUAL = '自行指定';

    public final static String LINE_HOST = 'https://cloudservice.azure-api.net/volvo/api/test/';
    public final static String LINE_ENDPOINT_PROMOTION = 'promotion';
    public final static String LINE_ENDPOINT_CAR_VIEW = 'CarView';
    public final static String LINE_ENDPOINT_CAR_TEST_ROUTE = 'CarTestRoute';
    public final static String LINE_ENDPOINT_CAR_TEST = 'CarTest';
    public final static String LINE_ENDPOINT_DEALER = 'Dealer';
    public final static String LINE_ENDPOINT_SMT_LEAD = 'SMTLead';
    public final static String LINE_ENDPOINT_SALES = 'Sales';
    public final static String LINE_ENDPOINT_MEMBER = 'Member';
    public final static String LINE_ENDPOINT_BUY_CALCULATOR = 'BuyCalculator';
    
    public final static String SMT_HOST = 'http://smt.genesys-tech.com:777/smt/smt/';
    public final static String SMT_ENDPOINT_TOKEN = 'token/gettoken';
    public final static String SMT_ACCESS_TOKEN_BODY = '{"userid":"sftest","password":"e8302e6d972939401b7b62784b67b4fd"}';
    public final static String SMT_ENDPOINT_INSERT_MEMBER = 'LINE4i/InsertMember';
    
    public final static String REST_RESPONSE_FAIL = 'Failed';
    public final static String REST_RESPONSE_SUCCEEDED = 'Succeeded';

    public final static String RESPONSE_ERROR_DUPLICATE_LINE_ACTIVITY_ID = 'Duplicate Line Activity ID';
    public final static String RESPONSE_ERROR_NOT_EXISTING = 'This object does not exist.';
    public final static String RESPONSE_ERROR_CANNOT_INSERT_OR_UPDATE = 'Error while inserting or updating the sales representative.';
    
}
