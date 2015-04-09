$(document).ready(function(){
    
    $("#footer").load("../include/FooterView.html");
    
    listaProdRequest();
    listaMenu();
    
    function listaProdRequest(){
        $.post( "../service/ComparaProdutoService.php", {
                action:'listar_produto_pesquisa',
                codProduto1: getParameterByName("codProduto1"),
                codProduto2: getParameterByName("codProduto2")
            },
            function( data ) {
                if(data["codErro"] == 0){
                    $("#produto1").html(data['html'][0]['html']);
                    $("#produto2").html(data['html'][1]['html']);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
    
    function listaMenu(){
        $.post( "../service/MenuService.php", {
                action:'lista_menu_index'
            },
            function( data ) {
                if(data["codErro"] == 0){
                    $("#menu").html(data["htmlMenu"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});