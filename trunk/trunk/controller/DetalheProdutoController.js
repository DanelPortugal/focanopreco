$(document).ready(function(){
    
    $("#footer").load("../include/Footer.html");
    
    listaProdRequest();
    
    function listaProdRequest(){
        $.post( "../service/DetalheProdutoSevice.php", {
                action:'listar_produto',
                codProduto: getParameterByName("produto")
            },
            function( data ) {
                if(data["codErro"] == 0){
                    $("#pleaseWaitProduto").hide();
                    $("#topoProduto").html(data["html"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});