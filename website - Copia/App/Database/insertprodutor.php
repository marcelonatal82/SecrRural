<?php
require_once '../auth.php';
require_once '../Models/produtor.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

//--Representante--//
$NomeProdutor = $_POST['NomeProdutor'];
$TelefoneProdutor = $_POST['TelefoneProdutor'];
$EmailProdutor = $_POST['EmailProdutor'];
$idFabricante = $_POST['idFabricante'];



if($idUsuario != NULL && $idFabricante != NULL && $NomeProdutor != NULL && $TelefoneProdutor != NULL && $EmailProdutor != NULL){

		if (isset($_POST['idProdutor'])){

			$idProdutor = $_POST['idProdutor'];

						$produtor->UpdateRepresentante($idProdutor, $NomeProdutor, $TelefoneProdutor, $EmailProdutor, $idUsuario);
			
		}elseif($_POST['iduser'] == $idUsuario){
			
			$produtor->InsertRepresentante($NomeProdutor, $TelefoneProdutor, $EmailProdutor, $idFabricante, $idUsuario);
		}

	}else{
		header('Location: ../../views/produtor/index.php?alert=3');
	}


 }else{
	header('Location: ../../views/produtor/index.php');
}