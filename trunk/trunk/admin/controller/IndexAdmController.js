$(document).ready(function(){
    
    $("#menu").load("../includes/Menu.html", function(){
        $("#superMenu").load("../includes/SuperMenu.html", function(){
            $("#pleaseWait").hide();
        });
    });

    listaQtdProduto();
    
    function listaQtdProduto(){
        $.post( "../service/IndexService.php", {
                action:'listar_produto_usuario'
            },
            function( data ) {
                if(data["codErro"] == 0){
                    $("#qtdProduto").html(data["countProduto"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});