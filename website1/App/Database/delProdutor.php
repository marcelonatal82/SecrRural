<?php
require_once '../auth.php';
require_once '../Models/produtor.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

$id = $_POST['idProdutor'];

$produtor->DelProdutor($id);

}else{
	header('Location: ../../views/produtor/index.php');
}

?>