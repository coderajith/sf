public with sharing class ProjectSellStatusController {

    public list<projects__c> projectList {get;set;}
    public list<Wing__c> wingList {get;set;}
    public list<Apartment__c> apartmentList {get;set;}
    public list<Apartment__c> FlatDetail {get;set;}
    public String winghead {get;set;}
    public String apartmenthead {get;set;}
    public String projectHead {get;set;}
    public string projectCity {get;set;}
    public List<SelectOption> options {get;set;}
    public boolean showApartment {get;set;} 
    public boolean showWing {get;set;}
    public integer projectListSize {get;set;}

        public projectSellStatusController(){
        /*  options = new list<selectoption>();
        	options.add(new selectoption('none','--None--'));
        	Schema.DescribeFieldResult fieldResult = Projects__c.City__c.getDescribe();
        	List<Schema.PicklistEntry> Values = fieldResult.getPicklistValues();
            for( Schema.PicklistEntry i : Values){
                options.add(new SelectOption(i.getLabel(), i.getValue()));
            }  */   
            options = options();
        }
        
        public list<SelectOption> options(){
			options = new list<SelectOption>();
			set<string> stng = new set<string>();
			options.add(new selectoption('none','--None--'));
			for(projects__c a : [Select City__c from projects__c order by City__c]){
    			stng.add(a.City__c);
			}
			for (String s : stng) {
            	options.add(new SelectOption(s, s));
        	}
			return options;
		}
        
        public void showProjectList(){ 
            projectList = [select name from projects__c where City__C =:projectCity];
            projectListSize = projectList.size();
            if(projectList.size() == 0){
            	projectHead = null;
            } else{
            	projectHead = 'project Name';
            }
            showApartment = false;
      		showWing = false;
        }
        
        public void showWingList(){ 
            String projId = ApexPages.currentPage().getParameters().get('projectId');
            wingList = [select name from Wing__c where projects__c =:projId ];
            if(wingList.size() == 0){
            	winghead = null;
            } else{
            	winghead = 'Wing Name';
            }
            apartmentList = null;
            apartmenthead = null;  
            showWing = true;
        }
        
        public void showApartmentList(){
            String wingId = ApexPages.currentPage().getParameters().get('wingId');
            apartmentList = [select name from Apartment__c where Wing__c =:wingId ];
            if(apartmentList.size() == 0){
            	apartmenthead = null;
            } else{
            	apartmenthead = 'Apartment Name';
            }
            showApartment = true;
        }
        
        public void showFlatDetail(){ 
            string FlatId = apexpages.currentpage().getparameters().get('flatId'); 
            flatDetail = [select name,Owner_Name__c,Status__c,Purchase_date__c from Apartment__c where Apartment__c.id=:flatId];
        }   
}
