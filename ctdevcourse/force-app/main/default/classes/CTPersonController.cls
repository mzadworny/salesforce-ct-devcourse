public class CTPersonController {
    public static String getToken(String mobile) {
        Blob targetBlob = Blob.valueOf(mobile);
        Blob encryptedMobile = Crypto.generateDigest('MD5', targetBlob);

        // get the string value from blob
        return EncodingUtil.base64Encode(encryptedMobile);
    }


    //return a list<Person__c> with last 100 changed records
    public static list<Person__c> getRecentHealthChanges() {
            return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
    }

    //return a list<Person__c> containing searchTerm in Name, Mobile or Token fields
    public static list<Person__c> searchPeople(String searchTerm) {
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c WHERE (Name LIKE :searchTerm OR Mobile__c LIKE :searchTerm OR Token__c LIKE :searchTerm) ORDER BY Status_Update_Date__c DESC];
    }

    public static Person__c getPersonById (string personId){
        
        //SOQL returns list even if there is one record. We save it to list 'poeople'
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c WHERE Id = :personId];

        //we choose first record from the list to be returned, and as it's going to gave one record it returns just one
        if(people != null && people.size() > 0) {
            return people [0];
        } 
        return null;
    }

}