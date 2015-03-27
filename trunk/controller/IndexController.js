$(document).ready(function(){

    listaProDesqMemoria();
    
    $(document).off("click", "#tabMemoria");
    $(document).on("click", "#tabMemoria", function(){
        listaProDesqMemoria();
    });
    
    $(document).off("click", "#tabComput");
    $(document).on("click", "#tabComput", function(){
        listaProDesqComput();
    });
    
    function listaProDesqMemoria(){
        $.post( "service/IndexService.php", {
                action:'listar_produto_destaque_memoria',
                codCatMemoria: 1
            },
            function( data ) {
                if(data["codErro"] == 0){
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
                    $("#contentComput").html(data["htmlComput"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});