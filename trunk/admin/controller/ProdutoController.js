$(document).ready(function(){
    
    $("#menu").load("../includes/Menu.html", function(){
        $("#superMenu").load("../includes/SuperMenu.html", function(){
            $("#pleaseWait").hide();
        });
    });
    
    listaProduto();
    
    function listaProduto(){
        $.post( "../service/ProdutoService.php", {
                action:'listar_produto_usuario'
            },
            function(data) {
                if(data["codErro"] == 0){
                    $("#tbdProduto").html(data["html"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});