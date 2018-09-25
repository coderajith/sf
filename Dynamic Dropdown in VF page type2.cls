CONTROLLER:

public with sharing class ProjectSellStatusController {
    public List<SelectOption> options {get;set;} 
    
    public projectSellStatusController(){
      options = new list<selectoption>();
      options.add(new selectoption('none','--None--'));
      Schema.DescribeFieldResult fieldResult = Projects__c.City__c.getDescribe();
      List<Schema.PicklistEntry> Values = fieldResult.getPicklistValues();
      for( Schema.PicklistEntry i : Values){
        options.add(new SelectOption(i.getLabel(), i.getValue()));
      }        
    }
}

PAGE:
<apex:page>
  <apex:form>
    <apex:outputText value="Choose City:" />
    <apex:selectList value="{!projectCity}" multiselect="false" size="1" style="font-size:15px">
      <apex:selectOptions Value="{!options}"/>
      <apex:actionSupport event="onchange" action="{!showProjectList}" />
    </apex:selectList>
  </apex:form>
</apex:page>
