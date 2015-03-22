<?php
    require_once("../repository/DataBase.class.php");
    session_start("usuario");
    
    switch($_POST['action']){
        
        case "listar_produto_usuario":
            $DataBse = new DataBase();
            $DataBse->sql = "call listar_produto_usuario(".intval($_SESSION["codUsuario"]).");";
            $DataBse->ExecutListQuery();
            
            if($DataBse->returnQuery->num_rows >= 0){
                $dados["codErro"] = 0;
                $dados["countProduto"] = $DataBse->returnQuery->num_rows;
                $dados["sessao"] = intval($_SESSION["codUsuario"]);
            }else{
                $dados["codErro"] = 0;
                $dados["msgErro"] = "Ocorreu um erro ao consultar produtos";
                $dados["msgDescription"] = $DataBse->returnQuery->error;
            }
            
            $DataBse->Close();
            echo json_encode($dados);
            break;
    }
?>