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
                            <div class="navbar-header">
                              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                              </button>
                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                              <ul class="nav navbar-nav">
                                    <li class="dropdown pull-left">
                                        <a href="#" class="btn dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">
                                            <span class="glyphicon glyphicon-align-justify fa-2x"></span>
                                            <span>Cidades</span>
                                        </a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="#">Rio de Janeiro</a>
                                            </li>
                                        </ul>
                                    </li>
                              </ul>
                                <ul class="nav nav-pills navbar-right">
                                    <li class="dropdown pull-left">';
        if(isset($_SESSION["logged"])){
            $htmlProd .= '              <span>Bem vindo: '.$_SESSION["nome_usuario"].'</span>';
        }else{
            $htmlProd .= ' 
                                        <a href="#" class="btn dropdown-toggle fa fa-user fa-2x" data-toggle="dropdown" role="button" aria-expanded="false">
                                            <span class="caret fa-2x"></span>
                                        </a>
                                        <div class="dropdown-menu" role="menu" id="divLoginIndex">
                                            <div class="col-md-12">
                                                <br/>
                                                <div class="form-group">
                                                    <input class="form-control" type="text" id="txtLogin" placeholder="Login" autofocus>
                                                </div>
                                                <div class="form-group">
                                                    <input class="form-control" type="password" placeholder="Senha" id="txtSenha">
                                                </div>
                                                <a id="btnLogin" class="btn btn-lg btn-success btn-block">Entrar</a>
                                            </div>
                                            <div class="col-md-12">
                                                <br/>
                                                <b>Cadastre-se</b> <a href="#" class="btn">Aqui</a>
                                            </div>
                                            <div class="col-md-12">
                                                <br/>
                                                <a class="btn btn-block btn-social btn-facebook" href="https://www.facebook.com/dialog/oauth?client_id=898030020238477&redirect_uri=http://bloomfieldserver.no-ip.info/focanopreco/trunk/social_network/fbLogin.php&scope=email,user_website,user_location">
                                                    <i class="fa fa-facebook"></i><span class="pull-right" style="padding-left: 25px;">Login Facebook</span>
                                                </a>
                                            </div>
                                            <div class="col-md-12">
                                                <br/>
                                                <span id="signinButton">
                                                  <span
                                                    class="g-signin"
                                                    data-callback="signinCallback"
                                                    data-clientid="63476639202-gk0k9atfgo8p2hoqlo1ocd1d5n3t8b83.apps.googleusercontent.com"
                                                    data-cookiepolicy="single_host_origin"
                                                    data-requestvisibleactions="http://schemas.google.com/AddActivity"
                                                    data-scope="https://www.googleapis.com/auth/plus.login">
                                                  </span>
                                                </span>
                                            </div>
                                        </div>';
        }
        $htmlProd .= '              </li>
                                </ul>
                            </div>
                        </div>
                    </nav>';
        return $htmlProd;
    }
?>