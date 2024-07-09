  <?php

  /*
   Class produtos
  */

   require_once 'connect.php';

    class Fornecedor extends Connect
   {
   	
   	public function index($value = NULL)
      {
        if($value == NULL){
          $value = 1;
        }
   		$this->query = "SELECT * FROM `fornecedores`, `fabricante` WHERE `Fabricante_idFabricante` = `idFabricante` AND (`repPublic` = '$value')";
   		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

   		if($this->result){
   		
   			while ($row = mysqli_fetch_array($this->result)) {
   				
          if($row['repAtivo'] == 0){ $c ='class="label-warning"'; }else{ $c =" ";}
            echo '<li '.$c.'>

          <!-- drag handle -->
          <span class="handle">
            <i class="fa fa-ellipsis-v"></i>
            <i class="fa fa-ellipsis-v"></i>
          </span>
          <!-- checkbox -->
          <form class="label" name="ativ'.$row['idFornecedor'].'" action="../../App/Database/action.php" method="post">
                    <input type="hidden" name="id" id="id" value="'.$row['idFornecedor'].'">
                    <input type="hidden" name="status" id="status" value="'.$row['repAtivo'].'">
                    <input type="hidden" name="tabela" id="tabela" value="fornecedores">                  
                    <input type="checkbox" id="status" name="status" ';
                     if($row['repAtivo'] == 1){ echo 'checked'; } 
                    echo ' value="'.$row['repAtivo'].'" onclick="this.form.submit();" /></form>

                    <!-- todo text -->
                    <span class="text"><span class="badge left">'.$row['NomeFabricante'].' </span> '.$row['NomeFornecedor'].'</span>
                    <!-- Emphasis label -->
                    <!-- <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small> -->
                    <!-- General tools such as edit or delete-->
                     <div class="tools right">

                      <a href="" data-toggle="modal" data-target="#myModalup'.$row['idFornecedor'].'"><i class="fa fa-edit"></i></a> 
                    
                      <!-- Button trigger modal -->
                    <a href="" data-toggle="modal" data-target="#myModal'.$row['idFornecedor'].'">';

                    if($row['repPublic'] == 0){echo '<i class="glyphicon glyphicon-remove" aria-hidden="true"></i>';}else{ echo '<i class="glyphicon glyphicon-ok" aria-hidden="true"></i>';}

                    echo '</a> </div>

    <!-- Modal -->

  <div class="modal fade" id="myModal'.$row['idFornecedor'].'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form id="delRep'.$row['idFornecedor'].'" name="delRep'.$row['idFornecedor']. '" action="../Database/delFornecedor.php" method="post" style="color:#000;">
    
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Você tem certeza que deseja alterar o status deste item na sua lista.</h4>
          </div>
          <div class="modal-body">
            Nome: ' .$row['NomeFornecedor'].'
          </div>
          <input type="hidden" id="idFornecedor" name="idFornecedor" value="'.$row['idFornecedor'].'">
          <div class="modal-footer">
            <button type="submit" value="Cancelar" class="btn btn-default">Não</button>
            <button type="submit" name="update" value="Cadastrar" class="btn btn-primary">Sim</button>
          </div>
        </div>
      </div>
      
    </form>
    </div>

    <!-- Modal UPDATE -->
  <div class="modal fade" id="myModalup'.$row['idFornecedor'].'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form id="Up'.$row['idFornecedor'].'" name="Up'.$row['idFornecedor']. '" action="../Database/insertfornecedor.php" method="post" style="color:#000;">
    
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Atualização de dados.</h4>
          </div>
          <div class="modal-body">
            Nome Atual:
            <input type="text" id="NomeFornecedor" name="NomeFornecedor" value="' .$row['NomeFornecedor'].'">
          </div>
          <div class="modal-body">
            Nome Atual:
            <input type="text" id="TelefoneFornecedor" name="TelefoneFornecedor" value="'.$row['TelefoneFornecedor'].'">
          </div>
          <div class="modal-body">
            Nome Atual:
            <input type="text" id="EmailFornecedor" name="EmailFornecedor" value="'.$row['EmailFornecedor'].'">
          </div>        
          <input type="hidden" id="idFabricante" name="idFabricante" value="'.$row['Fabricante_idFabricante'].'">

          <input type="hidden" id="idFornecedor" name="idFornecedor" value="'.$row['idFornecedor'].'">
                   
          <div class="modal-footer">
            <button type="submit" value="Cancelar" class="btn btn-default">Não</button>
            <button type="submit" name="update" value="Cadastrar" class="btn btn-primary">Sim</button>
          </div>
        </div>
      </div>
      </form>
    </div>
                  </li>';
                   				
   			}
   			
   		}

   	}

   	public function listFornecedor(){

   		$this->query = "SELECT *FROM `fornecedores`";
   		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

   		if($this->result){
   		
   			while ($row = mysqli_fetch_array($this->result)) {
   				echo '<option value="'.$row['EmailFornecedor'].'">'.$row['NomeFornecedor'].'</option>';
   			}

   	}
   }

   	public function InsertFornecedor($NomeFornecedor, $TelefoneFornecedor, $EmailFornecedor, $Fabricante_idFabricante, $idUsuario){

   		$this->query = "INSERT INTO `fornecedores`(`idFornecedor`, `NomeFornecedor`, `TelefoneFornecedor`, `EmailFornecedor`,`repAtivo`,`repPublic`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES (NULL, '$NomeFornecedor', '$TelefoneFornecedor', '$EmailFornecedor', 1, 1, '$Fabricante_idFabricante', '$idUsuario')";
   		if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

   			header('Location: ../../views/fornecedores/index.php?alert=1');
   		}else{
   			header('Location: ../../views/fornecedores/index.php?alert=0');
   		}


   	}

    public function UpdateFornecedor($idFornecedor, $NomeFornecedor, $TelefoneFornecedor, $EmailFornecedor, $idUsuario)
    {
      $this->query = "UPDATE `fornecedores` SET `NomeFornecedor`='$NomeFornecedor',`TelefoneFornecedor`='$TelefoneFornecedor',`EmailFornecedor`='$EmailFornecedor',`Usuario_idUser`='$idUsuario' WHERE `idFornecedor` = '$idFornecedor'";

      if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

        header('Location: ../../views/fornecedores/index.php?alert=1');
      }else{
        header('Location: ../../views/fornecedores/index.php?alert=0');
      }

    }

    public function DelFornecedor($id)
    {
        $this->query = "SELECT * FROM `fornecedores` WHERE `idFornecedor` = '$id'";
        $this->result = mysqli_query($this->SQL, $this->query);
        if($row = mysqli_fetch_array($this->result)){

                $id = $row['idFornecedor'];
                $public = $row['repPublic'];

                if($public == 1){
                  $p = 0;
                }else{
                  $p = 1;
                }

                mysqli_query($this->SQL, "UPDATE `fornecedores` SET `repPublic` = '$p' WHERE `idFornecedor` = '$id'") or die(mysqli_error($this->SQL));
                header('Location: ../../views/fornecedores/index.php?alert=1');
        }else{
                header('Location: ../../views/fornecedores/index.php?alert=0');
              } 

    }

    public function Ativo($value, $id)
  {

    if($value == 0){ $v = 1; }else{ $v = 0; }

    $this->query = "UPDATE `fornecedores` SET `repAtivo` = '$v' WHERE `idFornecedor` = '$id'";
    $this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL));

    header('Location: ../../views/fornecedores/');


    }//Ativo
    
   }

   $fornecedor = new Fornecedor;