<?php
require_once '../auth.php';
require_once '../Models/equip.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

$id = $_POST['id'];

$equip->DelEquip($id);

}else{
	header('Location: ../../views/equip/');
}

?>