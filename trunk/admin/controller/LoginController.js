$(document).ready(function(){
    
    verificaLogado();
    
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
                    window.location = "index.html"
                }
            }
        ,"json");
    });
    
    function verificaLogado(){
        $.post( "../service/LoginService.php", {
                action:'verfica_logado'
            },
            function( data ) {
                if(data["logged"]){
                    window.location = "index.html";
                }
            }
        ,"json");
    }
});