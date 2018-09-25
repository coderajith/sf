public with sharing class dynamiccontactlist {
public List<projects__c> ContactTemp = new List<projects__c>();
    public dynamiccontactlist()
    {
     
    }
     
    public set<SelectOption> contactlist
    {
        get
        {
            ContactTemp = [Select City__C from projects__c];
             
            contactlist = new set<SelectOption>();
             
            for(projects__c con : ContactTemp)
            {
                contactlist.add(new SelectOption(con.City__C, con.City__C));
            }
            return contactlist;
        }
        set;
    }
}