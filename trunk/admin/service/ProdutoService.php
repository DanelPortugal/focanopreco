<?php
    require_once("../repository/DataBase.class.php");
    session_start("usuario");
    
    switch($_POST['action']){
        
        case "listar_produto_usuario":
            $DataBse = new DataBase();
            $DataBse->sql = "call listar_produto_usuario(".intval($_SESSION["codUsuario"]).");";
            $DataBse->ExecutListQuery();
            
            if($DataBse->returnQuery->num_rows >= 0){
                $dados["html"] = '';
                while($result = $DataBse->returnQuery->fetch_assoc()){
                    $dados["html"] .= '<tr>';
                    $dados["html"] .= '   <td>'.$result['cod_produto'].'</td>';
                    $dados["html"] .= '   <td>'.$result['nom_produto'].'</td>';
                    $dados["html"] .= '   <td>'.$result['des_produto'].'</td>';
                    $dados["html"] .= '   <td>'.$result['nom_categoria'].'</td>';
                    $dados["html"] .= '   <td>#</td>';
                    $dados["html"] .= '</tr>';
                }
                $dados["codErro"] = 0;
                $dados["sessao"] = intval($_SESSION["codUsuario"]);
            }else{
                $dados["codErro"] = 0;
                $dados["msgErro"] = "Ocorreu um erro ao consultar produtos";
                $dados["msgDescription"] = $DataBse->returnQuery->error;
            }
            $DataBse->returnQuery->free();
            $DataBse->Close();
            echo json_encode($dados);
            break;
    }
?>