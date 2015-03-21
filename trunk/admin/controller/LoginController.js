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
                console.log(data);
            }
        ,"json");
    });
});