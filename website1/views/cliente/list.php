<?php
require_once '../../App/auth.php';
require_once '../../layout/script.php';
require_once '../../App/Models/cliente.class.php';

echo $head;
echo $header;
echo $aside;
echo '<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        CADASTRO DE PRODUTORES 
      </h1>
      <ol class="breadcrumb">
        <li><a href="../"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Produtores Cadastrados</li>
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
            <div class="box-header">
              <i class="ion ion-clipboard"></i>
              <h3 class="box-title">Lista de PROD</h3>
              
            </div>

              ';

               $resp = $cliente->index2($perm);


        echo '</tbody>
        </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix no-border">
             <a href="addusuarios.php" type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add Usuários</a>
            </div>
          </div>
   
';
echo '</div>';
echo '</section>';
      
       
    

echo '</div>';

echo  $footer;
echo $javascript;
?>