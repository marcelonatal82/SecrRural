<?php
require_once '../../App/auth.php';
require_once '../../layout/script.php';
require_once '../../App/Models/relatorios.class.php';

echo $head;
echo $header;
echo $aside;
?>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Relatorio de Solicitações
    </h1>
    <ol class="breadcrumb">
      <li><a href="../"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Relatórios</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <?php
    require '../../layout/alert.php';
    ?>
    <!-- Small boxes (Stat box) -->
    <div class="row">
      <div class="box">
        <div class="box-header">
          <i class="ion ion-clipboard"></i>

          <h3 class="box-title">Produtor</h3>
        </div>


        <!-- /.box-header -->

        <div class="box-body">
          <div class="col-md-12">
            <section class="row">


              <?php
              if ($perm == 1) {
              ?>
                <form action="" method="POST" class="col-md-6 well">
                  <div class="col-md-7">

                    <select name="produtor" class="form-control">

                      <option value="">Nenhum</option>
                      <?php

                      $relatorio = new Relatorio();
                      $resps = $relatorio->selectProdutor($perm);
                      $resps = json_decode($resps, true);
                      foreach ($resps as $resp) {
                        echo '<option value="' . $resp['CodRefEquip'] . '">' . $resp['NomeEquip'] . '</option>';
                      }

                      ?>
                    </select>
                  </div>
                  <div class="col-md-3">
                    <select name="status" class="form-control">
                      <option value="1">Ativo</option>
                      <option value="0">Inativo</option>
                      <option value="">Todos</option>
                    </select>
                  </div>
                  <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">Ver</button>
                  </div>
                </form>


                <div id="ul-result" class="col-md-12">
                  <?php
                  if (isset($_POST['fornecedores']) != null) {
                    $idProdutor = $_POST['fornecedores'];
                    $status = $_POST['status'];
                  ?>
                    <form id="produtos_selecionados" action="gerarcsv.php" method="post">
                      <input type="hidden" name="idprodutor" value="<?php echo $idProdutor; ?>">
                      <input type="hidden" name="statusR" value="<?php echo $status; ?>">
                      <button type="submit" class="btn btn-default">Imprimir CSV</button>
                    </form>

                  <?php
                  } else {

                    echo ' <form id="todos_produtos" action="gerarcsv.php" method="post">
                          <input type="hidden" name="idprodutor">
                          <button type="submit">Imprimir CSV</button>
                        </form>';
                  }
                  ?>
            </section>

            <section>
              <table id="mytable" class="table table-striped">
                <thead>
                  <tr>
                    <th>Cód.:</th>
                    <th>Nome</th>
                    <th>Qtde Adquirido</th>
                    <th>Qtde Emprestada</th>
                    <th>Qtde em estoque</th>
                  </tr>
                </thead>
                <tbody>

                  <?php
                  if (isset($_POST['fornecedores']) != null) {
                    $idProdutor = $_POST['fornecedores'];
                    $status = $_POST['status'];

                    $rows = $relatorio->qtdeItensEstoque($perm, $status, $idProdutor);
                  } else {
                    $rows = $relatorio->qtdeItensEstoque($perm);
                  }

                  $rows = json_decode($rows, true);
                  foreach ($rows as $row) {
                    if (isset($row['QuantItens']) != null) {

                      $qi = $row['QuantItens'];
                      $qiv = $row['QuantItensVend'];
                      $r = $qi - $qiv;
                      echo '<tr> 
                                <td>' . $row['Equip_CodRefEquip'] . '</td>
                                <td>' . $row['NomeEquip'] . '</td>
                                <td>' . $qi . '</td>
                                <td>' . $qiv . '</td>
                                <td>' . $r . '</td>
                              </tr>';
                    }
                    unset($_POST);
                  }
                  ?>


                </tbody>
              </table>
            </section>
          </div> <!--result -->
        <?php } else {
                echo "<p>Você não tem permissão para visualizar este conteúdo!</p>";
              } ?>
        </div><!-- col-md-12 -->
      </div> <!-- box-body -->
    </div><!--box-->
</div><!--row -->
</section> <!--content -->

</div><!-- content-wrapper -->

<?php
echo  $footer;
echo $javascript;
?>