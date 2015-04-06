$(document).ready(function(){
    
    $("#footer").load("../include/FooterView.html");
    
    listaMenu();
    listaProdRequest();
    
    $(document).off("click", "#toogleDivProduto");
    $(document).on("click", "#toogleDivProduto", function(){
        $(".divProduto").removeClass("col-md-3");
        $(".divProduto").addClass("col-md-12");
        $(".divImgProd").addClass("col-md-8");
        $(".divDescProd").addClass("col-md-4");
    });
    
    $(document).off("click", "#unToogleDivProduto");
    $(document).on("click", "#unToogleDivProduto", function(){
        $(".divProduto").addClass("col-md-3");
        $(".divProduto").removeClass("col-md-12");
        $(".divImgProd").removeClass("col-md-8");
        $(".divDescProd").removeClass("col-md-4");
    });
    
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
    
    function listaProdRequest(){
        $.post( "../service/PesquisaProdutoService.php", {
                action:'listar_produto_pesquisa',
                nomProduto: getParameterByName("pesquisa")
            },
            function( data ) {
                if(data["codErro"] == 0){
                    $("#divPesquisaProduto").html(data['html']);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});