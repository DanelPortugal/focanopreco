<?php
    require_once("../repository/DataBase.class.php");
    session_start("usuario");
    
    switch($_POST['action']){
        
        case "listar_produto_pesquisa":
            try{
                $DataBse = new DataBase();
                //MEMÓRIAS
                $DataBse->sql = "call listar_produto_comparacao(".$_POST["codProduto1"].", ".$_POST["codProduto2"].")";
                $DataBse->ExecutListQuery();
                $html = '';
                $produto = array();
                while($dados = $DataBse->returnQuery->fetch_assoc())
                {
                	$b = array("html" => retornaHtmlProduto($dados));
                	array_push($produto, $b);
                }
                $dados["html"] = $produto;
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
        $htmlProd = '<div class="divProduto panel panel-default col-md-12">
						<div class="panel-body">
							<div class="divImgProd">
								<div class="col-md-12">           
									<img src="../'.$dado['produto_img_peq'].'" class="img-responsive" />       
								</div>
							</div>
							<div class="divDescProd">
								<div class="col-md-12">
									<b>'.$dado['nom_produto'].'</b>
								</div>       
								<div class="col-md-12">'.$dado['des_produto'].'</div>       
								<div class="col-md-12"><b>R$</b> '.$dado['pre_produto'].'</div>
							</div>
						</div>
					</div>';
        return $htmlProd;
    }
?>