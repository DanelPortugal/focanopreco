$(document).ready(function(){
    
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
    // Ocultar o botão de login agora que o usuário está autorizado, por exemplo:
    //document.getElementById('signinButton').setAttribute('style', 'display: none');
    } else if (authResult['error']) {
    // Ocorreu um erro.
    // Possíveis códigos de erro:
    //  "access_denied" - o usuário negou o acesso a seu aplicativo
    //   "immediate_failed" - não foi possível fazer o login do usuário automaticamente
    // console.log('There was an error: ' + authResult['error']);
    }
}