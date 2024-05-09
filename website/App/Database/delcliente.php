<?php
require_once '../auth.php';
require_once '../Models/cliente.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

$idCliente = $_POST['id'];

$cliente->deleteCliente($idCliente);

    header('Location: ../../views/cliente/index.php');
}else{
	header('Location: ../../views/cliente/index.php');
}

?>