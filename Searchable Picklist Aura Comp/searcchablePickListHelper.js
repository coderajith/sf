({
	RelationshipTypes : function(component) {
        var action = component.get("c.getRelationshipTypes");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var records = response.getReturnValue();
                component.set("v.relationshipTypes",records);
                component.set("v.relationshipTypesDummy",records);
            } else {
                alert('error');
            }
    	});
        $A.enqueueAction(action);
    },
})