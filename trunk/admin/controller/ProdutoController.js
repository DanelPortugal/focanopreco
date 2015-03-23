$(document).ready(function(){

    $("#menu").load("../includes/Menu.html", function(){
        $("#superMenu").load("../includes/SuperMenu.html", function(){
            $("#pleaseWait").hide();
        });
    });

    $(document).off("click", "#optEditProduto");
    $(document).on("click", "#optEditProduto", function(){
        listaProdutoSelecionado($(this).attr("data_cod_produto"));
    });

    $(document).off("click", "#btnSalvaEditProduto");
    $(document).on("click", "#btnSalvaEditProduto", function(){
        editaProduto();
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

    function listaProdutoSelecionado(codProduto){
        $.post( "../service/ProdutoService.php", {
                action:'listar_produto_selecionado',
                codProduto: codProduto
            },
            function(data) {
                if(data["codErro"] == 0){
                    $("#nomProdutoEdit").val(data["nom_produto"]);
                    $("#desProdutoEdit").val(data["des_produto"]);
                    $("#codProdutoModal").val(codProduto);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }

    function editaProduto(){
        $.post( "../service/ProdutoService.php", {
                action:'editar_produto',
                codProduto: $("#codProdutoModal").val(),
                nomProduto: $("#nomProdutoEdit").val(),
                desProduto: $("#desProdutoEdit").val()
            },
            function(data) {
                if(data["codErro"] == 0){
                    $('.modal').modal('hide');
                    listaProduto();
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
});