<?php
    require_once("../repository/DataBase.class.php");
    session_start("usuario");
    
    switch($_POST['action']){
        
        case "listar_produto":
            try{
                $DataBse = new DataBase();
                //MEMÓRIAS
                $DataBse->sql = "call listar_produto_selecionado(".intval($_POST["codProduto"]).")";
                $DataBse->ExecutListQuery();
                $html = '';
                while($dados = $DataBse->returnQuery->fetch_assoc())
                {
                    $html .= retornaHtmlProduto($dados);
                }
                $dados["html"] = $html;
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
            
        $htmlProd .= '<div class="col-md-4"><br/>';
        $htmlProd .= '  <img src="../'.$dado['produto_img_peq'].'" class="img-responsive"/>';
        $htmlProd .= '</div>';
        $htmlProd .= '<div class="col-md-6"><br/>';
        $htmlProd .= '  <div class="col-md-12"><h3>'.utf8_encode($dado['nom_produto']).'</h3></div>';
        $htmlProd .= '  <div class="col-md-12"><h5>'.utf8_encode($dado['des_produto']).'</h5></div>';
        $htmlProd .= '  <div class="col-md-12"><h3><b>R$</b> '.$dado['pre_produto'].'</h3></div>';
        $htmlProd .= '</div>';
        return $htmlProd;
    }
?>