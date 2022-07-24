public class CTLocationController {

    //return a list<Person__c> with last 100 changed records
    public static list<Location__c> getRecentStatusChanges() {
        return [SELECT Id, Name, Address__c, Red_Score__c, Pincode__c, Status_Update_Date__c, Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
    }

    //return a list<Person__c> containing searchTerm in Name, Mobile or Token fields
    public static list<Location__c> searchLocation(String searchTerm) {
    return [SELECT Id, Name, Address__c, Red_Score__c, Pincode__c, Status_Update_Date__c, Status__c FROM Location__c WHERE (Name LIKE :searchTerm OR Address__c LIKE :searchTerm OR Pincode__c LIKE :searchTerm) ORDER BY Status_Update_Date__c DESC];
    }

    public static Location__c getLocationById (string locationId){
    
    //SOQL returns list even if there is one record. We save it to list 'poeople'
    List<Location__c> location = [SELECT Id, Name, Address__c, Red_Score__c, Pincode__c, Status_Update_Date__c, Status__c FROM Location__c WHERE Id = :locationId];

    //we choose first record from the list to be returned, and as it's going to gave one record it returns just one
    if(location != null && location.size() > 0) {
        return location [0];
    } 
    return null;
    }
}