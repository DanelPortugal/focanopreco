<?php
    require_once("../repository/DataBase.class.php");
    
    session_start("usuario");
    
    switch($_POST['action']){
        case "verfica_logado":
            if(isset($_SESSION["codUsuario"])){
                $dados['logged'] = true;
            }else{
                $dados['logged'] = false;
            }
            echo json_encode($dados);
            break;
    }
?>