$(document).ready(function(){
    verificaLogado()
    
    function verificaLogado(){
        $.post( "service/SessionService.php", {
                action:'verfica_logado'
            },
            function( data ) {
                if(data["logged"]){
                    window.location = "pages/index.html";
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});