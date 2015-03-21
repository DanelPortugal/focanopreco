<?php
    require_once("../repository/DataBase.class.php");
    
    session_start("usuario");
    
    switch($_POST['action']){
        case "login":
            $DataBse = new DataBase();
            $DataBse->sql = "call logar_usuario('".$_POST["nomLogin"]."','".$_POST["nomSenha"]."');";
            $DataBse->ExecutListQuery();
            
            if($DataBse->returnQuery->num_rows > 0){
                $result = mysqli_fetch_assoc($DataBse->returnQuery);
                $dados["codErro"] = 0;
                $dados["codUsuario"] = $result["cod_usuario"];
                $dados["nomUsuario"] = $result["nom_usuario"];
                $dados["sobNomUsuario"] = $result["sob_nom_usuario"];
                $dados["indUsuario"] = $result["ind_usuario"];
                $dados["codPerfilUsuario"] = $result["cod_perfil"];
                
                $_SESSION["codUsuario"] = $result["cod_usuario"];
                $_SESSION["nomUsuario"] = $result["nom_usuario"];
                $_SESSION["sobNomUsuario"] = $result["sob_nom_usuario"];
                $_SESSION["indUsuario"] = $result["ind_usuario"];
                $_SESSION["codPerfilUsuario"] = $result["cod_perfil"];
            }
            
            $DataBse->Close();
            echo json_encode($dados);
            break;
    }
?>