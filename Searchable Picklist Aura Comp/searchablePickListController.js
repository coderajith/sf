({
	doInit : function(component, event, helper) {
		helper.RelationshipTypes(component);
	},
	selectType : function(component,event,helper){
        if(!event.target.id.includes('No Matching for ')){
            component.set("v.selectedType",event.target.id);
        }
    },
    filter : function(component,event,helper){
        var filter = component.get("v.selectedType");
        var allTypes = component.get("v.relationshipTypesDummy");
        var result =[];
        for(var i=0; i<allTypes.length; i++){
            var a = allTypes[i].toLowerCase();
            var b = filter.toLowerCase();
            var c = a.includes(b);
            if(a.includes(b)){
                result.push(allTypes[i]);
            }
        }
        if(result.length == 0){
            result.push('No Matching for '+filter);
        } 
        component.set("v.relationshipTypes",result);
    }
})