<?php
require_once '../auth.php';
require_once '../Models/fornecedor.class.php';

if(isset($_POST['update']) == 'Cadastrar'){

$id = $_POST['idFornecedor'];

$fornecedor->DelFornecedor($id);

}else{
	header('Location: ../../views/fornecedores/index.php');
}

?>