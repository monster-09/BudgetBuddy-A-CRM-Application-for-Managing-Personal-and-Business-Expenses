public with sharing class ExpenseController {

    @AuraEnabled(cacheable = true)
    public static List<AggregateResult> getExpenesGroupByType(Date startDate, Date endDate){
       return [SELECT Expense_Type__c,sum(Expense__c) totalAmount FROM Expense__c where Expense_Date__c >= :startDate 
        AND Expense_Date__c <= :endDate WITH USER_MODE Group By Expense_Type__c 
        ];
    }
}