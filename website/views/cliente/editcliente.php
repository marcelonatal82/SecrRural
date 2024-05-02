<?php
require_once '../../App/auth.php';
require_once '../../layout/script.php';
require_once '../../App/Models/cliente.class.php';

if (isset($_GET['q'])) {

  $resp = $cliente->editCliente($_GET['q']);


  echo $head;
  echo $header;
  echo $aside;
  echo '<div class="content-wrapper">';

  echo '<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Editar <small>Produtores</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="../"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Produtores</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">';


  echo ' 
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Produtor</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" enctype="multipart/form-data" action="../../App/Database/insertcliente.php" method="POST">
              <div class="box-body">
              	<div class="form-group">
                  <label for="exampleInputEmail1">Nome do Produtor</label>
                  <input type="text" name="NomeCliente" class="form-control" id="exampleInputEmail1" placeholder="nomeCliente" value="' . $resp['cliente']['NomeCliente'] . '">
            
            ';

  echo '</select>
            </div>

                <div class="form-group">
                <label for="exampleInputEmail1">CPF</label>
                  <input type="text" name="cpfCliente" class="form-control" id="exampleInputEmail1" placeholder="cpfCliente" value="' . $resp['cliente']['cpfCliente'] . '">
                </div>
                
                <div class="form-group">
                <label for="exampleInputEmail1">Nome da Mãe</label>
                  <input type="text" name="nome_mae" class="form-control" id="exampleInputEmail1" placeholder="nome_mae" value="' . $resp['cliente']['nome_mae'] . '">
                </div>

                <div class="form-group">
                  <label for="exampleInputEmail1">Email</label>
                  <input type="text" name="EmailCliente" class="form-control" id="exampleInputEmail1" placeholder="EmailCliente" value="' . $resp['cliente']['EmailCliente'] . '">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Estado civil</label>
                  <input type="text" name="Estado civil" class="form-control" id="exampleInputEmail1" placeholder="Estado civil" value="' . $resp['cliente']['estado_civil'] . '">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Sexo</label>
                  <input type="text" name="sexo" class="form-control" id="exampleInputEmail1" placeholder="sexo" value="' . $resp['cliente']['sexo'] . '">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Data Nascimento</label>
                  <input type="text" name="Data Nascimento" class="form-control" id="exampleInputEmail1" placeholder="Data Nascimento" value="' . $resp['cliente']['data_nascimento'] . '">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Naturalidade</label>
                  <input type="text" name="naturalidade" class="form-control" id="exampleInputEmail1" placeholder="naturalidade" value="' . $resp['cliente']['naturalidade'] . '">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Nacionalidade</label>
                  <input type="text" name="nacionalidade" class="form-control" id="exampleInputEmail1" placeholder="nacionalidade" value="' . $resp['cliente']['nacionalidade'] . '">
                </div>

              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" name="upload" class="btn btn-primary" value="Cadastrar">Cadastrar</button>
                <a class="btn btn-danger" href="../cliente/list.php">Cancelar</a>
              </div>
            </form>
          </div>
          <!-- /.box -->
          </div>
</div>';

  echo '</div>';
  echo '</div>';
  echo '</section>';
  echo '</div>';
  echo  $footer;
  echo $javascript;
} else {
  header('Location: ./');
}
