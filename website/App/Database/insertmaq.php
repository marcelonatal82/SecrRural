<?php
require_once '../auth.php';
require_once '../Models/maq.class.php';

	if(isset($_POST['update']) == 'Cadastrar'){

		$nomeEquip = $_POST['nomeEquip'];

		$iduser = $_POST['iduser'];

		if($nomeEquip != NULL){

			if(isset($_POST['id']) != NULL && $idUsuario != NULL){
				$id = $_POST['id'];
				$maq->UpdateEquip($id, $nomeEquip, $idUsuario);
			}elseif($iduser == $idUsuario){
				$maq->InsertEquip($nomeEquip, $idUsuario);
			}
			


		}else{
			header('Location: ../../views/maq/index.php?alert=0');
		}

	}else{
		header('Location: ../../views/maq/index.php');
	}
