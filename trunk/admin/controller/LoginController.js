$(document).ready(function(){
    $(document).off("click", "#btnLogin");
    $(document).on("click", "#btnLogin", function(){
        $.post( "../service/LoginService.php",
            {
                action:'login',
                nomLogin: $("#txtLogin").val(),
                nomSenha: $("#txtSenha").val()
            },
            function( data ) {
                if(data["codErro"] == 0){
                    window.location = "index.php"
                }
            }
        ,"json");
    });
});