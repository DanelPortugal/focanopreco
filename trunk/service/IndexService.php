<?php
    require_once("../repository/DataBase.class.php");
    session_start("usuario");
    
    switch($_POST['action']){
        
        case "listar_produto_destaque_memoria":
            try{
                $DataBse = new DataBase();
                //MEM�RIAS
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
        
        case "listar_produto_destaque_computador":
            try{
                $DataBse = new DataBase();
                
                //COMPUTADORES
                $DataBse->sql = "call listar_produto_destaque_index(".intval($_POST["codCatComput"]).")";
                $DataBse->ExecutListQuery();
                $html = '';
                while($dados = $DataBse->returnQuery->fetch_assoc())
                {
                    $html .= retornaHtmlProduto($dados);
                }
                $dados["htmlComput"] = $html;
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
                                <div class="col-md-12" id="imgProduto">';
        $htmlProd  .= '           <img src="'.$dado['produto_img_peq'].'" class="img-responsive"/>';
        $htmlProd  .= '       </div>';
        $htmlProd  .= '       <div class="col-md-12" id="nomeProduto"><b>'.utf8_encode($dado['nom_produto']).'</b></div>';
        $htmlProd  .= '       <div class="col-md-12" id="descProduto">'.utf8_encode($dado['des_produto']).'</div>';
        $htmlProd  .= '       <div class="col-md-12"><b>R$</b> '.$dado['pre_produto'].'</div>';
        $htmlProd  .= '       <div class="col-md-12"><button class="btn btn-default" id="btnDetalheProduto" data_cod_produto="'.$dado['cod_produto'].'">Ver Detalhes</button></div>';
        $htmlProd  .= '       <div class="col-md-6"><a href="#" class="glyphicon glyphicon-star" id="btnFavoritoProduto" data_cod_produto="'.$dado['cod_produto'].'">Favoritos</a></div>';
        $htmlProd  .= '       <div class="col-md-6"><input type="checkbox" id="btnComparaProduto" data_cod_produto="'.$dado['cod_produto'].'"/>Comparar</div>';
        $htmlProd  .= '    </div>
                        </div>';
        return $htmlProd;
    }
?>