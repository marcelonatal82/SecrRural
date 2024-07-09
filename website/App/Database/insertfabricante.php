<?php
require_once '../auth.php';
require_once '../Models/fabricante.class.php';

if(isset($_POST['upload']) == 'Cadastrar'){

$NomeFabricante = $_POST['NomeFabricante'];

//---Fabricante---//
$CNPJFabricante = $_POST['CNPJFabricante'];
$EmailFabricante = $_POST['EmailFabricante'];
$EnderecoFabricante = $_POST['EnderecoFabricante'];
$TelefoneFabricante = $_POST['TelefoneFabricante'];
$Public = $_POST['Public'];
$status = 1;

//--Fabricante--//


$iduser = $_POST['iduser'];

if($iduser == $idUsuario && $NomeFabricante != NULL){

		if (!isset($_POST['idFabricante'])){

			$NomeFornecedor = $_POST['NomeFornecedor'];
			$TelefoneFornecedor = $_POST['TelefoneFornecedor'];
			$EmailFornecedor = $_POST['EmailFornecedor'];
			$fabricante->InsertFabricante($NomeFabricante, $CNPJFabricante, $EmailFabricante, $EnderecoFabricante, $TelefoneFabricante, $idUsuario,  $NomeFornecedor, $TelefoneFornecedor, $EmailFornecedor, $status, $perm);
		

	}else{

		
			$idFabricante = $_POST['idFabricante'];
			$fabricante->UpdateFabricante($idFabricante, $NomeFabricante, $CNPJFabricante, $EmailFabricante, $EnderecoFabricante, $TelefoneFabricante, $Public, $idUsuario , $perm);		
			
		}
	}else{
			header('Location: ../../views/fabricante/index.php?alert=3');
		}
		
	
 }else{
	header('Location: ../../views/fabricante/index.php');
}