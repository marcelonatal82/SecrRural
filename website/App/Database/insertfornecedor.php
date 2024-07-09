<?php
require_once '../auth.php';
require_once '../Models/fornecedor.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

//--Fornecedor--//
$NomeFornecedor = $_POST['NomeFornecedor'];
$TelefoneFornecedor = $_POST['TelefoneFornecedor'];
$EmailFornecedor = $_POST['EmailFornecedor'];
$idFabricante = $_POST['idFabricante'];



if($idUsuario != NULL && $idFabricante != NULL && $NomeFornecedor != NULL && $TelefoneFornecedor != NULL && $EmailFornecedor != NULL){

		if (isset($_POST['idFornecedor'])){

			$idFornecedor = $_POST['idFornecedor'];

			$fornecedor->UpdateFornecedor($idFornecedor, $NomeFornecedor, $TelefoneFornecedor, $EmailFornecedor, $idUsuario);
			
		}elseif($_POST['iduser'] == $idUsuario){
			
			$fornecedor->InsertFornecedor($NomeFornecedor, $TelefoneFornecedor, $EmailFornecedor, $idFabricante, $idUsuario);
		}

	}else{
		header('Location: ../../views/fornecedores/index.php?alert=3');
	}


 }else{
	header('Location: ../../views/fornecedores/index.php');
}