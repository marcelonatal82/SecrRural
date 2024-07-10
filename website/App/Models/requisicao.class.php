<?php

/**
 * Requisições
 */

require_once 'connect.php';

class vendas extends Connect
{

  public function itensVerify($iditem, $quant, $perm)
  {

    if ($perm > 2) {
      $_SESSION['msg'] =  'Erro - Você não tem permissão!';
      header('Location: ../../views/requisicao/index.php');
      exit();
    }

    $query = "SELECT * FROM `itens`, `maq` WHERE `idItens` = '$iditem' AND `Equip_CodRefEquip` = `CodRefEquip`";
    $result = mysqli_query($this->SQL, $query) or die(mysqli_error($this->SQL));
    $total = mysqli_num_rows($result);

    if ($total > 0) {

      if ($row = mysqli_fetch_array($result)) {

        $q = $row['QuantItens'];
        $v = $row['QuantItensVend'];
        $quantotal = $v + $quant;

        if ($q >= $quantotal) {

          return array('status' => '1', 'NomeEquip' => $row['NomeEquip'],);
        } else {
          $estoque = $q - $v;
          return array('status' => '0', 'NomeEquip' => $row['NomeEquip'], 'estoque' => $estoque);
        }
      }
    } else {

      $_SESSION['msg'] =  '<div class="alert alert-warning">
      <strong>Ops!</strong> Produto (' . $iditem . ') não encontrado!</div>';

      header('Location: ../../views/requisicao/index.php');
      exit;
    }
  }

  public function itensVendidos($iditem, $quant, $cliente, $email, $cpfcliente, $cart, $idUsuario, $perm, $block = null)
  {

    $cpfcliente = intval(Connect::limpaCPF_CNPJ($cpfcliente));
    $idCliente = vendas::idCliente($cpfcliente); // Verifica se o cliente existe no DB.

    $jaComprou = (new vendas)->jaComprou($idCliente, $iditem, $block);

    if ($perm > 2) {
      $_SESSION['msg'] =  '<div class="alert alert-danger alert-dismissible">
                         <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                         <strong>Erro!</strong> Você não tem permissão! </div>';
      header('Location: ../../views/requisicao/index.php');
      exit();
    } elseif ($cpfcliente == null && $cliente == null && $email == null && $cart == null) {
      $_SESSION['msg'] =  '<div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>Erro!</strong> Cadastre um Cliente! </div>';
      header('Location: ../../views/requisicao/index.php');
      exit();
    } elseif ($jaComprou >= 3) {
      $_SESSION['msg'] =  '<div class="alert alert-danger alert-dismissible">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>Erro!</strong> O Cliente já efetuou "' . $jaComprou . '" compras este ano do produto Cód.:' . $iditem . '! </div>';
      header('Location: ../../views/requisicao/index.php');
      exit();
    }

    $query = "SELECT * FROM `itens` WHERE `idItens`= '$iditem'";
    $result = mysqli_query($this->SQL, $query) or die(mysqli_error($this->SQL));

    if ($result) {

      //------Verificação da Venda-----------

      if ($row = mysqli_fetch_array($result)) {

        $q = $row['QuantItens'];
        $v = $row['QuantItensVend'];

        $quantotal = $v + $quant;

        if ($q >= $quantotal) {

          $valor = ($row['ValVendItens'] * $quant);

          if ($idCliente > 0) { // Se o cliente existir, Retorne o ID do cliente
            $idCliente = $idCliente; // ID do cliente
          } else {

            $novoclient = "INSERT INTO `cliente`(`idCliente`, `NomeCliente`, `EmailCliente`, `cpfCliente`, `statusCliente`, `Usuario_idUsuario`) VALUES (NULL,'$cliente','$email','$cpfcliente',1,'$idUsuario')";

            if (mysqli_query($this->SQL, $novoclient) or die(mysqli_error($this->SQL))) {
              $idCliente = mysqli_insert_id($this->SQL);
            }
          }


          $query = "INSERT INTO `vendas`(`idvendas`, `quantitens`, `valor`, `iditem`, `cart`, `cliente_idCliente`, `idusuario`) VALUES (NULL, '$quant', '$valor', '$iditem', '$cart', '$idCliente', '$idUsuario')";
          if ($result = mysqli_query($this->SQL, $query) or die(mysqli_error($this->SQL))) {


            $query = "UPDATE `itens` SET `QuantItensVend` = '$quantotal' WHERE `idItens`= '$iditem'";
            if ($result = mysqli_query($this->SQL, $query) or die(mysqli_error($this->SQL))) {

              //limpa itens da lista
              unset(
                $_SESSION['itens'],
                $_SESSION['CPF'],
                $_SESSION['Cliente'],
                $_SESSION['Email'],
                $_SESSION['cart']
              );

              $_SESSION['notavd'] = $cart;
              $_SESSION['msg'] = '<div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <strong>Sucesso!</strong> Solicitação efetuada!</div>';
            }
          } else {
            $_SESSION['msg'] =  '<div class="alert alert-danger alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>Erro!</strong> Solicitação não efetuada! </div>';

            header('Location: ../../views/requisicao/');
            exit();
          }
        } else {

          $estoque = $row['QuantItens'] - $row['QuantItensVend'];

          $_SESSION['msg'] =  '<div class="alert alert-warning alert-dismissible">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <strong>Ops!</strong> Quantidade maior do que em estoque! </br> Quantidade em estoque: <b>' . $estoque . '</b></div>';
          header('Location: ../../views/requisicao/');
          exit();
        }

        header('Location: ../../views/requisicao/notavd.php');
      }


      //------------------

    } else {
      $_SESSION['alert'] = 0;
      header('Location: ../../views/requisicao/');
    }
  } // itensVendidos

  public function idcliente($cpfCliente)
  {

    $client = "SELECT * FROM `cliente` WHERE `cpfCliente` = '$cpfCliente'";

    if ($resultcliente = mysqli_query($this->SQL, $client)  or die(mysqli_error($this->SQL))) {

      $row = mysqli_fetch_array($resultcliente);
      return $idCliente = $row['idCliente'];
    }
  }

  //----------itemNome

  public function itemNome($idItens)
  {

    $query = "SELECT * FROM `maq` WHERE `CodRefEquip` IN (SELECT `Equip_CodRefEquip` FROM `itens` WHERE `idItens` = '$idItens' AND `ItensAtivo` = 1 AND `ItensPublic` = 1)";

    $result = mysqli_query($this->SQL, $query)  or die(mysqli_error($this->SQL));

    $row = mysqli_fetch_array($result);

    if ($row['NomeEquip'] != NULL) {
      $resp = $row['NomeEquip'];
    } else {
      $resp = NULL;
    }

    return $resp;
  } //--itemNome

  public function notavd($cart)
  {

    $query = "SELECT * FROM `vendas` WHERE `cart` = '$cart' ";

    if ($result = mysqli_query($this->SQL, $query)  or die(mysqli_error($this->SQL))) {

      while ($row = mysqli_fetch_array($result)) {
        $out[] = $row;
      }
    }

    return $out;
  } //--notavd

  public function dadosItem($idItem)
  {

    $query = "SELECT * FROM `fabricante`, `maq`, `itens` WHERE `idItens` = '$idItem' AND `Equip_CodRefEquip` = `CodRefEquip` AND `Fabricante_idFabricante` = `idFabricante`";

    if ($result = mysqli_query($this->SQL, $query)  or die(mysqli_error($this->SQL))) {

      $row = mysqli_fetch_array($result);

      return $row;
    }
  } //---dadosItem

  public function jaComprou($idCliente, $idItem = null, $block = null)
  {
    if (!empty($block)) {


      $Ano = date('Y');
      $dataAno = $Ano . '-01-01 00:00:00';
      $dataIn = $dataAno;
      $dataFim = date('Y-m-d H:i:s');

      $query = "SELECT COUNT(*) AS TOTAL FROM `vendas` WHERE `cliente_idCliente` = '$idCliente' AND (`datareg` BETWEEN '$dataIn' AND '$dataFim' AND `iditem` = '$idItem')";
      $result = mysqli_query($this->SQL, $query);

      $row = mysqli_fetch_assoc($result);
      return $row['TOTAL'];
    } else {
      return 0;
    }
  }
}//Fim Class Requisição
