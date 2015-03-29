$(document).ready(function(){
    var files;
    var data = new FormData();
    var $btn;
    
    $("#menu").load("../includes/Menu.html", function(){
        $("#superMenu").load("../includes/SuperMenu.html", function(){
            $("#pleaseWait").hide();
        });
    });
    
    $("#preProdutoInsert").maskMoney();
    
    $(document).off("click", "#btnInserirProd");
    $(document).on("click", "#btnInserirProd", function(){
        $("#stlSubCatProdInsert").html("");
        $("#sucessInsert").hide();
        $("#errorInsert").hide();
        $("#sucessUploadInsert").hide();
        $("#errorUploadInsert").hide();
        listarCategoria("#stlCatProdInsert");
    });
    
    $(document).off("click", "#btnSalvaInserProduto");
    $(document).on("click", "#btnSalvaInserProduto", function(){
        $btn = $(this).button('loading');
        doUpload();
    });

    $(document).off("click", "#optEditProduto");
    $(document).on("click", "#optEditProduto", function(){
        listaProdutoSelecionado($(this).attr("data_cod_produto"));
    });

    $(document).off("click", "#btnSalvaEditProduto");
    $(document).on("click", "#btnSalvaEditProduto", function(){
        editaProduto();
    });
    
    $("#stlCatProdInsert").change(function(){
        $("#stlSubCatProdInsert").html("");
        listarSubCategoria("#stlSubCatProdInsert", $(this).val());
    });
    
    listaProduto();

    function listaProduto(){
        $.post( "../service/ProdutoService.php", {
                action:'listar_produto_usuario'
            },
            function(data) {
                if(data["codErro"] == 0){
                    $("#tbdProduto").html(data["html"]);
                    
                    if($("#tbdProduto").html() != ""){
                        $('#tblProduto').addClass('no-wrap');

                        $('#tblProduto').DataTable( {
                            responsive: true
                        } );
                    }
                    
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
    
    function listarCategoria(element){
        $.post( "../service/ProdutoService.php", {
                action:'listar_categoria'
            },
            function(data) {
                if(data["codErro"] == 0){
                    $(element).html(data["html"]);
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
    
    function listarSubCategoria(element, codCat){
        $.post( "../service/ProdutoService.php", {
                action:'listar_sub_categoria',
                cod_categoria: codCat
            },
            function(data) {
                if(data["codErro"] == 0){
                    $(element).html(data["html"]);
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
    
    function inserirProduto(){
        $.post( "../service/ProdutoService.php", {
                action:'inserir_produto',
                nomProduto: $("#nomProdutoInsert").val(),
                desProduto: $("#desProdutoInsert").val(),
                codCategoria: $("#stlCatProdInsert").val(),
                preProduto: $("#preProdutoInsert").val().slice(3).replace(',', '').replace('.', ''),
                codSubCategoria: $("#stlSubCatProdInsert").val()
            },
            function(data) {
                if(data["codErro"] == 0){
                    listaProdutoInserido();
                }else{
                    alert("nao foi");
                }
            }
        ,"json");
    }
    
    function listaProdutoInserido(){
        $.post( "../service/ProdutoService.php", {
                action:'listar_produto_inserido'
            },
            function(data) {
                if(data["codErro"] == 0){
                    $("#codProdInsert").val(data["cod_produto"]);
                    inserirImgProduto();
                }else{
                    window.location = "pages/login.html";
                }
            }
        ,"json");
    }
    
    function inserirImgProduto(){
        $.post( "../service/ProdutoService.php", {
                action: 'inserir_imagem_produto',
                imgPeq: $("#iptCaminhoImagem").val(),
                imgGrd: $("#iptCaminhoImagem").val(),
                codProduto: $("#codProdInsert").val()
            },
            function(data) {
                if(data["codErro"] == 0){
                    $("#sucessInsert").show();
                    $("#descSucessnsert").html(data['msg']);
                    listaProduto();
                    $btn.button('reset');
                }else{
                    $("#errorInsert").show();
                    $("#descErrorInsert").html(data['msg']);
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
    
    $('#uploadFileInsert').off("change");
    $('#uploadFileInsert').on("change", prepareUpload);

	function prepareUpload(event)
	{
        $("#sucessUploadInsert").hide();
        $("#errorUploadInsert").hide();
        
		files = event.target.files;
        
        if(files.length > 1){
            $("#errorUploadInsert").show();
            $("#descErrorUploadInsert").html("SELECIONE APENAS UMA (1) IMAGEM !");
        }else{
    		$.each(files, function(key, value)
    		{
    			data.append(key, value);
    		});
        }
	}
    
    function doUpload()
    {
        $("#lblFeedbackUploadInsert").show();
    
        $.ajax({
            url: '../service/UploadProdutoService.php?files',
            type: 'POST',
            data: data,
            cache: false,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function(data, textStatus, jqXHR)
            {
                $("#lblFeedbackUploadInsert").hide();
                
                if(typeof data.error === 'undefined')
            	{
                    var files = "";
                    for (i = 0; i < data.files.length; i++) { 
                        files += data.files[i];
                    }
                    
                    $("#iptCaminhoImagem").val(files.slice(6));
            		$("#sucessUploadInsert").show();
                    $("#descSucessUploadInsert").html("UPLOAD CONCLU&Iacute;DO COM SUCESSO !");
                    
                    inserirProduto();
            	}
            	else
            	{
            		$("#errorUploadInsert").show();
                    $("#descErrorUploadInsert").html("ERRO COM UPLOAD, CONTATO O ADMINISTRADOR !");
            	}
                
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                $("#errorUploadInsert").show();
                $("#descErrorUploadInsert").html("ERRO COM UPLOAD, CONTATO O ADMINISTRADOR !");
                console.log('ERRORS: ' + textStatus);
            }
        });
    }
});