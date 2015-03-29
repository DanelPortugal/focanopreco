<?php
    require_once("../repository/DataBase.class.php");
    session_start("usuario");
    
    switch($_POST['action']){
        
        case "lista_menu_index":
            try{
                $dados["htmlMenu"] = retornaHtml();
                $dados["codErro"] = 0;
            }catch (Exception $e){
                $dados["codErro"] = 0;
                $dados["msgErro"] = "Ocorreu um erro ao consultar produtos";
                $dados["msgDescription"] = $e->getMessage();
            }
            echo json_encode($dados);
            break;
    }
    
    function retornaHtml(){
        $htmlProd = '<nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                        
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        
                                <ul class="nav navbar-nav navbar-left>
                                    <li class="dropdown">
                                        <a href="#" class="btn dropdown-toggle fa fa-user fa-2x" data-toggle="dropdown" role="button" aria-expanded="false"><span class="caret fa-2x"></span></a>
                                    </li>
                                </ul>
                                    
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown">';
        if(isset($_SESSION["logged"])){
            $htmlProd .= '<span>Bem vindo: '.$_SESSION["nome_usuario"].'</span>';
        }else{
            $htmlProd .= ' 
                            <a href="#" class="btn dropdown-toggle fa fa-user fa-2x" data-toggle="dropdown" role="button" aria-expanded="false"><span class="caret fa-2x"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li class="col-md-12">
                                    <br/>
                                    <form role="form">
                                        <fieldset>
                                            <div class="form-group">
                                                <input class="form-control" type="text" id="txtLogin" placeholder="Login" autofocus>
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control" type="password" placeholder="Senha" id="txtSenha">
                                            </div>
                                            <!-- Change this to a button or input when using this as a form -->
                                            <a id="btnLogin" class="btn btn-lg btn-success btn-block">Entrar</a>
                                        </fieldset>
                                    </form>
                                </li>
                                <li class="col-md-12">
                                    <br/>
                                    <a class="btn btn-block btn-social btn-facebook" href="https://www.facebook.com/dialog/oauth?client_id=898030020238477&redirect_uri=http://bloomfieldserver.no-ip.info/focanopreco/trunk/social_network/fbLogin.php&scope=email,user_website,user_location">
                                        <i class="fa fa-facebook"></i><span class="pull-right" style="padding-left: 25px;">Login Facebook</span>
                                    </a>
                                    <br/>
                                </li>
                            </ul>';
        }
        $htmlProd .= '</li></ul></div></div></nav>';
        return $htmlProd;
    }
?>