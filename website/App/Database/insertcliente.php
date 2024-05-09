<?php
require_once '../auth.php';
require_once '../Models/cliente.class.php';

if(isset($_POST['upload']) == 'Cadastrar') {

    $NomeCliente = $_POST['NomeCliente'];
    $cpfCliente = $_POST['cpfCliente'];
    $EmailCliente = $_POST['EmailCliente'];
    $nome_mae = $_POST['nome_mae'];
    $sexo = $_POST['sexo'];
    $naturalidade = $_POST['naturalidade'];
    $data_nascimento = $_POST['data_nascimento'];
    $nacionalidade = $_POST['nacionalidade'];
    $estado_civil = $_POST['estado_civil'];
    //$idCliente = $_POST['idCliente'];

    $cliente = new Cliente;

    if ($NomeCliente != NULL && $cpfCliente != NULL && $EmailCliente != NULL) {

        if (!isset($_POST['idCliente'])) {

                        $result = $cliente->InsertCliente($NomeCliente, $cpfCliente, $EmailCliente, $nome_mae, $sexo, $data_nascimento, $naturalidade, $nacionalidade, $estado_civil, $idUsuario, $perm);

            } else {

                        $idCliente = $_POST['idCliente'];
                        $result = $cliente->UpdateCliente($idCliente, $NomeCliente, $cpfCliente, $EmailCliente, $nome_mae, $sexo, $data_nascimento, $naturalidade, $nacionalidade, $estado_civil, $idUsuario, $perm);

        }
        $_SESSION['alert'] = $result;
        header('Location: ../../views/cliente/index.php');

    } else {
        header('Location: ../../views/cliente/index.php?alert=3');
    }
}