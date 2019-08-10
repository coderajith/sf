({
    loadJquery : function(component, event, helper) {
        jQuery(document).ready(function(){
            $(".select2Class").select2({
               placeholder: "search user"
           });
        });
    }
})