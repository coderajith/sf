CONTROLLER:

public with sharing class dynamiccontactlist {
public List<Contact> ContactTemp = new List<Contact>();
    public dynamiccontactlist()
    {
     
    }
    public set<SelectOption> contactlist
    {
        get
        {
            ContactTemp = [Select name from Contact];
            contactlist = new set<SelectOption>();
            for(Contact con : ContactTemp)
            {
                contactlist.add(new SelectOption(con.name, con.name));
            }
            return contactlist;
        }
        set;
    }
}

PAGE:

<apex:page controller="dynamiccontactlist">
  <apex:form >
      <apex:selectList size="1">
          <apex:selectOptions value="{!contactlist}"></apex:selectOptions>
      </apex:selectList>
  </apex:form>
</apex:page>
