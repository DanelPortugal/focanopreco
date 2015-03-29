<?php
    require_once("../repository/DataBase.class.php");
    session_start();
    if($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['code'])){
        $appId = '898030020238477';
        $appSecret = 'b9a3a96f800294a19efe50643c274631';
        $redirectUri = urlencode('http://bloomfieldserver.no-ip.info/focanopreco/trunk/social_network/fbLogin.php');
        $code = $_GET['code'];
        $token_url = "https://graph.facebook.com/oauth/access_token?"
        . "client_id=" . $appId . "&redirect_uri=" . $redirectUri
        . "&client_secret=" . $appSecret . "&code=" . $code;
        //pega os dados
        $response = @file_get_contents($token_url);
        
        if($response){
            $params = null;
            parse_str($response, $params);
            if(isset($params['access_token']) && $params['access_token']){
                $graph_url = "https://graph.facebook.com/me?access_token="
                . $params['access_token'];
                $user = json_decode(file_get_contents($graph_url));
                // nesse IF verificamos se veio os dados corretamente
                if(isset($user->email) && $user->email){
                    $DataBse = new DataBase();
                    $DataBse->sql = "call inserir_usuario_network(
                                            '".$user->name."', 
                                            '".$user->email."')";
                    $DataBse->ExecutListQuery();
                    $DataBse->Close();
                    $_SESSION["logged"] = true;
                    $_SESSION["email_usuario"] = $user->email;
                    $_SESSION["nome_usuario"] = $user->name;
                    header("location:../index.html");
                }
            }else{
                echo "Erro de conexão com Facebook";
                exit(0);
            }
        }else{
            echo "Erro de conexão com Facebook";
            exit(0);
        }
    }else if($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['error'])){
        echo 'Permissão não concedida';
    }
?>