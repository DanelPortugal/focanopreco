$(document).ready(function(){
    
    $(document).off("click", "#logout");
    $(document).on("click", "#logout", function(){
        $.post( "../service/LoginService.php",
            {
                action:'logout'
            },
            function( data ) {
                if(data["codErro"] == 0){
                    window.location = "login.html"
                }
            }
        ,"json");
    });
});