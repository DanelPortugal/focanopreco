$(document).ready(function(){
    
    $("#footer").load("../include/Footer.html");
    
    listaMenu();
    
    $(document).off("click", "#rdoPF");
    $(document).on("click", "#rdoPF", function(){
        $("#frmCadastroPessoaFisica").show(300);
        $("#frmCadastroPessoaJuridica").hide(300);
    });
    
    $(document).off("click", "#rdoPJ");
    $(document).on("click", "#rdoPJ", function(){
        $("#frmCadastroPessoaFisica").hide(300);
        $("#frmCadastroPessoaJuridica").show(300);
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
});