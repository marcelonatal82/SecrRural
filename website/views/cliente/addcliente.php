  <?php
  require_once '../../App/auth.php';
  require_once '../../layout/script.php';

  echo $head;
  echo $header;
  echo $aside;


        

  echo '<div class="content-wrapper">';
 
 require '../../layout/alert.php';

if($perm != 1){
          echo "Você não tem permissão! </div>";

          exit();
        }

  echo '<!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Adicionar <small>Cadastro Prod</small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="../"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Produtor</li>
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
                <h3 class="box-title">Cadastro</h3>
              </div>
              <!-- /.box-header -->
              <!-- form start -->
              <form role="form" action="../../App/Database/insertcliente.php" method="POST">
                <div class="box-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nome Produtor</label>
                    <input type="text" name="NomeCliente" class="form-control" id="exampleInputEmail1" placeholder="Nome Produtor">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">CPF</label>
                    <input type="text" name="cpfCliente" class="form-control" id="exampleInputEmail1" placeholder="CPF">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nome da Mãe</label>
                    <input type="text" name="nome_mae" class="form-control" id="exampleInputEmail1" placeholder="Nome da Mãe">
                  </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Sexo</label>
                    <input type="text" name="sexo" class="form-control" id="exampleInputEmail1" placeholder="sexo">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Data de Nascimento</label>
                    <input type="text" name="data_nascimento" class="form-control" id="exampleInputEmail1" placeholder="Data Nascimento">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Naturalidade</label>
                    <input type="text" name="naturalidade" class="form-control" id="exampleInputEmail1" placeholder="naturalidade">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nacionalidade</label>
                    <input type="text" name="nacionalidade" class="form-control" id="exampleInputEmail1" placeholder="nacionalidade">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Estado Civil</label>
                    <input type="text" name="estado_civil" class="form-control" id="exampleInputEmail1" placeholder="Estado Civil">
                  </div>                                 
                  <div class="form-group">
                    <label for="exampleInputEmail1">Telefone</label>
                    <input type="text" name="telefone" class="form-control" id="exampleInputEmail1" placeholder="telefone">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">E-mail</label>
                    <input type="text" name="emailCliente" class="form-control" id="exampleInputEmail1" placeholder="E-mail">
                  </div>

                  
                <!-- /.box-body -->

                <div class="box-footer">
                  <button type="submit" name="upload" class="btn btn-primary" value="Cadastrar">Cadastrar</button>
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