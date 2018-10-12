REFERENCE: https://hisrinu.wordpress.com/2011/05/30/custom-multi-select-picklist-field-in-visualforce/
PAGR:

<apex:page controller="multiselect">
    <apex:form >
        <apex:panelGrid columns="3" id="abcd">
            <apex:selectList id="sel1" value="{!leftselected}" multiselect="true" style="width:100px" size="5">
                <apex:selectOptions value="{!unselectedvalues}" />
            </apex:selectList>
                <apex:panelGroup >
                    <br/>
                    <apex:image value="{!$Resource.multiselected}">
                        <apex:actionSupport event="onclick" action="{!selectclick}" reRender="abcd"/>
                    </apex:image>
                    <br/><br/>
                    <apex:image value="{!$Resource.multiunselected}">
                        <apex:actionSupport event="onclick" action="{!unselectclick}" reRender="abcd"/>
                    </apex:image>
                </apex:panelGroup>
            <apex:selectList id="sel2" value="{!rightselected}" multiselect="true" style="width:100px" size="5">
                <apex:selectOptions value="{!SelectedValues}" />
            </apex:selectList>
        </apex:panelGrid>
    </apex:form>
</apex:page>

CONTROLLER:

public class multiselect {
 
    Set<String> originalvalues = new Set<String>{'A','B','C','D','E','F','G'};
    Public List<string> leftselected{get;set;}
    Public List<string> rightselected{get;set;}
    Set<string> leftvalues = new Set<string>();
    Set<string> rightvalues = new Set<string>();
     
    public multiselect(){
        leftselected = new List<String>();
        rightselected = new List<String>();
        leftvalues.addAll(originalValues);
    }
     
    public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        return null;
    }
 
    public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
}
