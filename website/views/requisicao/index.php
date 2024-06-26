<?php
require_once '../../App/auth.php';
require_once '../../layout/script.php';
require_once '../../App/Models/requisicao.class.php';
require_once '../../App/Models/cliente.class.php';

echo $head;
echo $header;
echo $aside;

echo '<div class="content-wrapper">
		<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Itens cadastrados
      </h1>
      <ol class="breadcrumb">
        <li><a href="../"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Itens</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    ';
require '../../layout/alert.php';
echo '
      <!-- Small boxes (Stat box) -->
      <div class="row">
      	<div class="box box-primary">
            
            <!-- /.box-header -->
            <div class="box-body">';

if (!empty($_SESSION['msg'])) {
  echo ' <div class="col-xs-12 col-md-12 text-success">' . $_SESSION['msg'] . '</div>';
  unset($_SESSION['msg']);
}
?>

<!-- Cliente list PHP -->
<?php

if (isset($_POST['CPF'])) {

  $cliente = new Cliente;
  $resps = $cliente->searchdata($_POST["CPF"]);

  if ($resps > 0 && $_POST['CPF'] != NULL) {

    foreach ($resps['data'] as $resp) {

      $_SESSION['CPF'] = $resp['cpfCliente'];
      $_SESSION['Cliente'] = $resp['NomeCliente'];
      $_SESSION['Email'] = $resp['EmailCliente'];
      $_SESSION['cart'] = MD5('@?#' . $resp['cpfCliente'] . '@' . date("d-m-Y H:i:s"));
    }
  }

  unset($_POST['CPF']);
}

?>
<!-- Cliente list PHP -->


<!-- Cliente list -->
<div class="row">

  <form id="form1" action="index.php" method="post">
    <div class="box-body">
      <div class="col-lg-6">
        <div class="input-group">
          <input type="text" class="form-control" id="cpfCliente" name="CPF" placeholder="Digite o CPF ou Nome" autocomplete="off">
          <span class="input-group-btn">
            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-floppy-save"></span></button>
          </span>
        </div><!-- /input-group -->
        <div id="Listdata"></div>
      </div><!-- /.col-lg-6 -->
    </div>
  </form>
</div>
<!-- Cliente list FIM -->

<form id="form2" action="../../App/Database/insertRequisicao.php" method="POST">
  <div class="box-body">
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="exampleInputEmail1">Nome Produtor</label>
          <input type="text" name="nomeCliente" class="form-control" id="exampleInputnome1" placeholder="Nome Cliente" value="<?php if (isset($_SESSION['Cliente'])) {
                                                                                                                                echo $_SESSION['Cliente'];
                                                                                                                              } ?>" />
        </div>
        <div class="form-group">
          <label for="exampleInputEmail1">E-mail</label>
          <input type="text" name="emailCliente" class="form-control" id="exampleInputEmail1" placeholder="E-mail" value="<?php if (isset($_SESSION['Email'])) {
                                                                                                                            echo $_SESSION['Email'];
                                                                                                                          } ?>" />
        </div>
        <div class="form-group">
          <label for="exampleInputEmail1">CPF</label>
          <input type="number" name="cpfcliente" class="form-control col-sm-6" id="exampleInputcpf1" placeholder="CPF" value="<?php if (isset($_SESSION['CPF'])) {
                                                                                                                                echo $_SESSION['CPF'];
                                                                                                                              } ?>" />
        </div>
        <hr />
        <div class="form-group">
          <label for="block" class="btn label-info"><b>Bloquear compras por produto.</b>
            <input type="checkbox" id="block" name="block" checked />
          </label>
        </div>

      </div>
      <!-- Tabela de produtos -->
      <div class="col-md-12">
        <h3 class="box-title">Lista de Maquinarios</h3>
      </div>

      <div class="form-group col-xs-12 col-sm-4">
        <input type="text" id="idItem" name="item" class="form-control" placeholder="Código ou nome do Produto" autocomplete="off">
        <div id="ListProd"></div>
      </div>


      <div class="form-group col-xs-12 col-sm-4">

        <input type="number" id="qtd" name="qtde" class="form-control" placeholder="Quantidade">
      </div>

      <div class="form-group col-xs-12 col-sm-4">
        <button type="button" id="maqSubmit" name="maqSubmit" onclick="maqSubmit" value="carrinho" class="btn btn-primary col-xs-12">Registrar</button>
      </div>
    </div>

    <table class="table table-bordered" id="products-table">

      <tr>
        <th style="width: 10px">#</th>
        <th>Cod.</th>
        <th>Equipamentos</th>
        <th>Qtde</th>
        <th style="width:40px" title="Remover">Del</th>
      </tr>


      <tbody id="listable">

        <?php

        $pkCount = (isset($_SESSION['itens']) ? count($_SESSION['itens']) : 0);
        if ($pkCount == 0) { // Alterado conforme descrito
          echo '<tr>
              		<td colspan="6">
              		<b>Carrinho Vazio</b>
              		</td>
              	</tr>';
        } else {

          $cont = 1;

          foreach ($_SESSION['itens'] as $maq) {
            $idItem = $maq['idItem'];
            $qtde = $maq['qtde'];
            $nameequip = $maq['nameequip'];


            echo '<tr>
                <td>' . $cont . '</td>
			<td>' . $idItem . '</td>
			<td>' . $nameequip . '</td>
			<td>
			<input type="hidden" id="idItem" name="idItem[' . $idItem . ']" value="' . $idItem . '" />
			<input type="hidden" id="qtd" name="qtd[' . $idItem . ']" value="' . $qtde . '" /> ' . $qtde . '
			<td><a href="../../App/Database/remover.php?remover=carrinho&id=' . $idItem . '"><i class="fa fa-trash text-danger"></i></a></td>
			</td>
			</td>
                </tr>';
            $cont = $cont + 1;
          }
        }
        ?>
      </tbody>
    </table>

  </div><!-- /.box-body -->


  <!-- Tabela de produtos -->

  <input type="hidden" name="iduser" value="<?php echo $idUsuario; ?>">
  <!-- /.box-body -->
  <div class="col-md-12">
    <div class="box-footer">
      <button type="submit" name="comprar" class="btn btn-primary" value="Cadastrar">Comprar</button>
      <a class="btn btn-danger" href="/clean.php?clean=cancelar">Cancelar</a>
    </div>
  </div>
</form>

<?php


echo '
          </div>
	 
';
echo '</div>';
echo '</section>';




echo '</div>';
unset($_SESSION['notavd'], $_SESSION['msg']);
echo  $footer;
echo $javascript;
?>