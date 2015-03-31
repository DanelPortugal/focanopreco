<?php
    require_once("../repository/DataBase.class.php");
    session_start("usuario");
    
    switch($_POST['action']){
        
        case "listar_produto_destaque_memoria":
            try{
                $DataBse = new DataBase();
                //MEMÓRIAS
                $DataBse->sql = "call listar_produto_destaque_index(".intval($_POST["codCatMemoria"]).")";
                $DataBse->ExecutListQuery();
                $html = '';
                while($dados = $DataBse->returnQuery->fetch_assoc())
                {
                    $html .= retornaHtmlProduto($dados);
                }
                $dados["htmlMemoria"] = $html;
                $dados["codErro"] = 0;
            }catch (Exception $e){
                $dados["codErro"] = 0;
                $dados["msgErro"] = "Ocorreu um erro ao consultar produtos";
                $dados["msgDescription"] = $e->getMessage();
            }
            
            $DataBse->Close();
            echo json_encode($dados);
            break;
    }
    
    function retornaHtmlProduto($dado){
        $htmlProd = '';
        $htmlProd .= '<div class="panel panel-default col-md-3">
                            <div class="panel-body">
                                <div class="col-md-12">';
        $htmlProd  .= '           <img src="'.$dado['produto_img_peq'].'" class="img-responsive"/>';
        $htmlProd  .= '       </div>';
        $htmlProd  .= '       <div class="col-md-12"><b>'.utf8_encode($dado['nom_produto']).'</b></div>';
        $htmlProd  .= '       <div class="col-md-12">'.utf8_encode($dado['des_produto']).'</div>';
        $htmlProd  .= '       <div class="col-md-12"><b>R$</b> '.$dado['pre_produto'].'</div>';
        $htmlProd  .= '       <div class="col-md-12"><button class="btn btn-default" id="btnDetalheProduto" data_cod_produto="'.$dado['cod_produto'].'">Ver Detalhes</button></div>';
        $htmlProd  .= '    </div>
                        </div>';
        return $htmlProd;
    }
?>