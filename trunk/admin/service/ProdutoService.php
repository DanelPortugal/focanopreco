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
                    $dados["html"] .= '   <td><img width="50px" height="50px" src="../../'.$result['produto_img_peq'].'"/></td>';
                    $dados["html"] .= '   <td>'.$result['nom_produto'].'</td>';
                    $dados["html"] .= '   <td>'.$result['des_produto'].'</td>';
                    $dados["html"] .= '   <td>'.$result['nom_categoria'].'</td>';
                    $dados["html"] .= '<td style="text-align:center; word-wrap:normal;" class="dropdown">
                                            <a href="#" id="optUser" data-toggle="dropdown" class="dropdown-toggle btn">
                                                <span class="glyphicon glyphicon-cog"></span>
                								<b class="caret"/></a>
                								<ul class="dropdown-menu dropdown-menu-right dropDownMenuCustomTd">
                									<li>
                                                        <a href="#" id="optEditProduto" class="glyphicon glyphicon-pencil optTd"
                    									   data_cod_produto="'.$result['cod_produto'].'"
                                                           data-toggle="modal" data-target=".modalProduto">&nbsp;Editar</a>
                    									</a>
                                                        <a href="#" id="optRemoveProduto" class="glyphicon glyphicon-trash optTd"
                    									   data_cod_produto="'.$result['cod_produto'].'">&nbsp;Excluir</a>
                    									</a>
                                                    </li>
                                                </ul>
                                            </a>
            							</td>';
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
            
        case "listar_produto_selecionado":
            $DataBse = new DataBase();
            $DataBse->sql = "call listar_produto_selecionado(".intval($_POST["codProduto"]).");";
            $DataBse->ExecutListQuery();
            
            if($DataBse->returnQuery->num_rows >= 0){
                
                while($result = $DataBse->returnQuery->fetch_assoc()){
                    $dados["cod_produto"] = $result['cod_produto'];
                    $dados["nom_produto"] = $result['nom_produto'];
                    $dados["des_produto"] = $result['des_produto'];
                    $dados["nom_categoria"] = $result['nom_categoria'];
                    $dados["cod_categoria"] = $result['cod_categoria'];
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
        
        case "editar_produto":
            $DataBse = new DataBase();
            $DataBse->sql = "call editar_produto(".intval($_POST["codProduto"]).", '".htmlentities($_POST["nomProduto"])."', '".htmlentities($_POST["desProduto"])."');";
            $DataBse->ExecutListQuery();
                
            $dados["codErro"] = 0;
            $dados["sessao"] = intval($_SESSION["codUsuario"]);

            $DataBse->Close();
            echo json_encode($dados);
            break;
        
        case "inserir_produto":
            $DataBse = new DataBase();
            $DataBse->sql = "call inserir_produto_usuario(
                                '".htmlentities($_POST["nomProduto"])."', 
                                '".htmlentities($_POST["desProduto"])."',
                                ".intval($_SESSION["codUsuario"]).",
                                ".intval($_POST["codCategoria"]).",
                                ".$_POST["preProduto"].",
                                ".intval($_POST["codSubCategoria"])."
                            )";
            
            $DataBse->ExecutListQuery();
            
            $dados["codErro"] = 0;
            $dados["msg"] = utf8_decode("PRODUTO INSERIDO COM SUCESSO !");

            $DataBse->Close();
            echo json_encode($dados);
            break;
            
        case "listar_produto_inserido":
            $DataBse = new DataBase();
            $DataBse->sql = "call listar_produto_inserido_usuario(".intval($_SESSION["codUsuario"]).");";
            $DataBse->ExecutListQuery();
            if($DataBse->returnQuery->num_rows >= 0){
                while($result = $DataBse->returnQuery->fetch_assoc()){
                    $dados["cod_produto"] = $result['cod_produto'];
                }
                $dados["codErro"] = 0;
            }else{
                $dados["codErro"] = 0;
                $dados["msgErro"] = "Ocorreu um erro ao consultar produtos";
                $dados["msgDescription"] = $DataBse->returnQuery->error;
            }
            $DataBse->Close();
            echo json_encode($dados);
            break;
        
        case "inserir_imagem_produto":
            /**/
            $DataBse = new DataBase();
            $DataBse->sql = "call inserir_imagem_produto(
                                '".$_POST["imgPeq"]."', 
                                '".$_POST["imgGrd"]."',
                                ".$_POST["codProduto"]."
                            );";
            $DataBse->ExecutListQuery();
                
            $dados["codErro"] = 0;
            $dados["msg"] = "PRODUTO INSERÍDO COM SUCESSO !";

            $DataBse->Close();
            echo json_encode($dados);
            break;
        
        case "listar_categoria":
            $DataBse = new DataBase();
            $DataBse->sql = "call listar_categoria();";
            $DataBse->ExecutListQuery();
                
            if($DataBse->returnQuery->num_rows >= 0){
                $html = "<option value=''>Selecione uma Categoria</option>";
                while($result = $DataBse->returnQuery->fetch_assoc()){
                    $html .= "<option value=".$result['cod_categoria'].">".$result['nom_categoria']."</option>";
                }
                
                $dados["codErro"] = 0;
                $dados["html"] = $html;
            }else{
                $dados["codErro"] = 0;
                $dados["msgErro"] = "Ocorreu um erro ao consultar produtos";
                $dados["msgDescription"] = $DataBse->returnQuery->error;
            }
            $DataBse->returnQuery->free();
            $DataBse->Close();
            echo json_encode($dados);
            break;
            
        case "listar_sub_categoria":
            $DataBse = new DataBase();
            $DataBse->sql = "call listar_sub_categoria(".$_POST['cod_categoria'].");";
            $DataBse->ExecutListQuery();
                
            if($DataBse->returnQuery->num_rows >= 0){
                $html = "<option value=''>Selecione uma Sub Categoria</option>";
                while($result = $DataBse->returnQuery->fetch_assoc()){
                    $html .= "<option value=".$result['cod_sub_categoria'].">".$result['nom_sub_categoria']."</option>";
                }
                
                $dados["codErro"] = 0;
                $dados["html"] = $html;
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