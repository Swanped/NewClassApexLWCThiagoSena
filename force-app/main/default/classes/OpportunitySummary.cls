public with sharing class OpportunitySummary {
    @AuraEnabled
    public static List<Opportunity> getOpportunities(){
        return [SELECT Id, Name FROM Opportunity];
    }
}
