<?php
require_once '../auth.php';
require_once '../Models/maq.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

$id = $_POST['id'];

$maq->DelEquip($id);

}else{
	header('Location: ../../views/maq/');
}

?>