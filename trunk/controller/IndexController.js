$(document).ready(function(){
	
	var produtosComparados = [];
    
    $("#footer").load("include/Footer.html");
    
    listaMenu();
    listaProDesqMemoria();
    
    $(document).off("keypress", "#txtPesquisaProduto");
    $(document).on("keypress", "#txtPesquisaProduto", function(e){
        if(e.which == 13){
            var str = "view/PesquisaProduto.html?pesquisa="+$("#txtPesquisaProduto").val()
            window.location = str;
        }
    });
    
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
    
    $(document).on('click', '#divLoginIndex', function (event) {
        $(this).parent().addClass('open');
        event.stopPropagation();
    });
    
    $(document).on("click", "#btnComparaProduto", function(){
    	$("#contentComparaProduto").show(200);
    	if(produtosComparados.length > 0){
    		$("#comparaProdutoSecond").show();
    		produtosComparados[1] = $(this).attr("data_cod_produto");
    		$("#contentNomeProdComparaSecond").html($(this).parent().parent().find("#nomeProduto").html());
        	$("#contentDescProdComparaSecond").html($(this).parent().parent().find("#descProduto").html());
        	$("#contentImgProdComparaSecond").html($(this).parent().parent().find("#imgProduto").html());
    	}else{
    		produtosComparados[0] = $(this).attr("data_cod_produto");
    		$("#contentNomeProdComparaFirst").html($(this).parent().parent().find("#nomeProduto").html());
        	$("#contentDescProdComparaFirst").html($(this).parent().parent().find("#descProduto").html());
        	$("#contentImgProdComparaFirst").html($(this).parent().parent().find("#imgProduto").html());
    	}
    });
    
    function listaMenu(){
        $.post( "service/MenuService.php", {
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

//LOGIN GOOGLE

(function() {
       var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
       po.src = 'https://apis.google.com/js/client:plusone.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
     
function signinCallback(authResult) {
    if (authResult['access_token']) {
    // Autorizado com sucesso
    // Ocultar o bot�o de login agora que o usu�rio est� autorizado, por exemplo:
    //document.getElementById('signinButton').setAttribute('style', 'display: none');
    } else if (authResult['error']) {
    // Ocorreu um erro.
    // Poss�veis c�digos de erro:
    //  "access_denied" - o usu�rio negou o acesso a seu aplicativo
    //   "immediate_failed" - n�o foi poss�vel fazer o login do usu�rio automaticamente
    // console.log('There was an error: ' + authResult['error']);
    }
}