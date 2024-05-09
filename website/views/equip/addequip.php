<?php
require_once '../../App/auth.php';
require_once '../../layout/script.php';

echo $head;
echo $header;
echo $aside;
echo '<div class="content-wrapper">';
echo '<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Adicionar <small>Maquinario</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="../"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Maquinario</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">';

echo ' <a href="./" class="btn btn-success">Voltar</a>
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"> Maquinario</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="../../App/Database/insertequip.php" method="POST">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nome do Maquinario</label>
                  <input type="text" name="nomeEquip" class="form-control" id="exampleInputEmail1" placeholder="Nome Maquinario">
                </div>
                 <input type="hidden" name="iduser" value="'.$idUsuario. '">
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" name="update" class="btn btn-primary" value="Cadastrar">Cadastrar</button>
                <a class="btn btn-danger" href="">Cancelar</a>
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
?>