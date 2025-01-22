trigger DeleteTerritoryBasedonDeal on Opportunity (Before delete) {    
    if (Trigger__mdt.getInstance('Run_All_Triggers')?.IsActive__c == true) {
       if (Trigger.isDelete) {
       List<OpportunityLineItem> OppLineItemIds = [select id from OpportunityLineItem where OpportunityId in: trigger.old];
        if (!OppLineItemIds.isEmpty()) {
           OpportunityLineItemHandler.onDelete(OppLineItemIds);          
        //if (!OppLineItemIds.isEmpty()) {
            //insert OppLineItemIds;
        }
    }    
}
}