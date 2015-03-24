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
                    $dados["html"] .= '   <td>'.utf8_encode($result['nom_produto']).'</td>';
                    $dados["html"] .= '   <td>'.utf8_encode($result['des_produto']).'</td>';
                    $dados["html"] .= '   <td>'.utf8_encode($result['nom_categoria']).'</td>';
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
            $DataBse->sql = "call editar_produto(".intval($_POST["codProduto"]).", '".$_POST["nomProduto"]."', '".$_POST["desProduto"]."');";
            $DataBse->ExecutListQuery();
                
            $dados["codErro"] = 0;
            $dados["sessao"] = intval($_SESSION["codUsuario"]);

            $DataBse->Close();
            echo json_encode($dados);
            break;
    }
?>