$(document).ready(function(){
    
    $("#footer").load("include/Footer.html");
    
    listaProDesqMemoria();
    
    $(document).off("click", "#tabMemoria");
    $(document).on("click", "#tabMemoria", function(){
        $("#pleaseWaitProdutoMemoria").show();
        listaProDesqMemoria();
    });
    
    $(document).off("click", "#tabComput");
    $(document).on("click", "#tabComput", function(){
        $("#pleaseWaitProdutoComput").show();
        listaProDesqComput();
    });
    
    $(document).off("click", "#btnDetalheProduto");
    $(document).on("click", "#btnDetalheProduto", function(){
        window.open("view/detalheproduto.html?produto=" + $(this).attr("data_cod_produto"), "_self");
    });
    
    function listaProDesqMemoria(){
        $.post( "service/IndexService.php", {
                action:'listar_produto_destaque_memoria',
                codCatMemoria: 1
            },
            function( data ) {
                if(data["codErro"] == 0){
                    $("#pleaseWaitProdutoMemoria").hide();
                    $("#pleaseWaitProdutoComput").hide();
                    $("#contentMemoria").html(data["htmlMemoria"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
    
    function listaProDesqComput(){
        $.post( "service/IndexService.php", {
                action:'listar_produto_destaque_computador',
                codCatComput: 2
            },
            function( data ) {
                if(data["codErro"] == 0){
                    $("#pleaseWaitProdutoComput").hide();
                    $("#contentComput").html(data["htmlComput"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});