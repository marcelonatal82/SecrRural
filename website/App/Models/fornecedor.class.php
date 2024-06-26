  <?php

  /*
   Class produtos
  */

   require_once 'connect.php';

    class Produtor extends Connect
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
          <form class="label" name="ativ'.$row['idProdutor'].'" action="../../App/Database/action.php" method="post">
                    <input type="hidden" name="id" id="id" value="'.$row['idProdutor'].'">
                    <input type="hidden" name="status" id="status" value="'.$row['repAtivo'].'">
                    <input type="hidden" name="tabela" id="tabela" value="fornecedores">                  
                    <input type="checkbox" id="status" name="status" ';
                     if($row['repAtivo'] == 1){ echo 'checked'; } 
                    echo ' value="'.$row['repAtivo'].'" onclick="this.form.submit();" /></form>

                    <!-- todo text -->
                    <span class="text"><span class="badge left">'.$row['NomeFabricante'].' </span> '.$row['NomeProdutor'].'</span>
                    <!-- Emphasis label -->
                    <!-- <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small> -->
                    <!-- General tools such as edit or delete-->
                     <div class="tools right">

                      <a href="" data-toggle="modal" data-target="#myModalup'.$row['idProdutor'].'"><i class="fa fa-edit"></i></a> 
                    
                      <!-- Button trigger modal -->
                    <a href="" data-toggle="modal" data-target="#myModal'.$row['idProdutor'].'">';

                    if($row['repPublic'] == 0){echo '<i class="glyphicon glyphicon-remove" aria-hidden="true"></i>';}else{ echo '<i class="glyphicon glyphicon-ok" aria-hidden="true"></i>';}

                    echo '</a> </div>

    <!-- Modal -->

  <div class="modal fade" id="myModal'.$row['idProdutor'].'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form id="delRep'.$row['idProdutor'].'" name="delRep'.$row['idProdutor']. '" action="../Database/delProdutor.php" method="post" style="color:#000;">
    
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Você tem certeza que deseja alterar o status deste item na sua lista.</h4>
          </div>
          <div class="modal-body">
            Nome: ' .$row['NomeProdutor'].'
          </div>
          <input type="hidden" id="idProdutor" name="idProdutor" value="'.$row['idProdutor'].'">
          <div class="modal-footer">
            <button type="submit" value="Cancelar" class="btn btn-default">Não</button>
            <button type="submit" name="update" value="Cadastrar" class="btn btn-primary">Sim</button>
          </div>
        </div>
      </div>
      
    </form>
    </div>

    <!-- Modal UPDATE -->
  <div class="modal fade" id="myModalup'.$row['idProdutor'].'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form id="Up'.$row['idProdutor'].'" name="Up'.$row['idProdutor']. '" action="../Database/insertfornecedor.php" method="post" style="color:#000;">
    
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Atualização de dados.</h4>
          </div>
          <div class="modal-body">
            Nome Atual:
            <input type="text" id="NomeProdutor" name="NomeProdutor" value="' .$row['NomeProdutor'].'">
          </div>
          <div class="modal-body">
            Nome Atual:
            <input type="text" id="TelefoneProdutor" name="TelefoneProdutor" value="'.$row['TelefoneProdutor'].'">
          </div>
          <div class="modal-body">
            Nome Atual:
            <input type="text" id="EmailProdutor" name="EmailProdutor" value="'.$row['EmailProdutor'].'">
          </div>        
          <input type="hidden" id="idFabricante" name="idFabricante" value="'.$row['Fabricante_idFabricante'].'">

          <input type="hidden" id="idProdutor" name="idProdutor" value="'.$row['idProdutor'].'">
                   
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

   	public function listProdutores(){

   		$this->query = "SELECT *FROM `fornecedores`";
   		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

   		if($this->result){
   		
   			while ($row = mysqli_fetch_array($this->result)) {
   				echo '<option value="'.$row['EmailProdutor'].'">'.$row['NomeProdutor'].'</option>';
   			}

   	}
   }

   	public function InsertProdutor($NomeProdutor, $TelefoneProdutor, $EmailProdutor, $Fabricante_idFabricante, $idUsuario){

   		$this->query = "INSERT INTO `fornecedores`(`idProdutor`, `NomeProdutor`, `TelefoneProdutor`, `EmailProdutor`,`repAtivo`,`repPublic`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES (NULL, '$NomeProdutor', '$TelefoneProdutor', '$EmailProdutor', 1, 1, '$Fabricante_idFabricante', '$idUsuario')";
   		if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

   			header('Location: ../../views/fornecedores/index1.php?alert=1');
   		}else{
   			header('Location: ../../views/fornecedores/index1.php?alert=0');
   		}


   	}

    public function UpdateProdutor($idProdutor, $NomeProdutor, $TelefoneProdutor, $EmailProdutor, $idUsuario)
    {
      $this->query = "UPDATE `fornecedores` SET `NomeProdutor`='$NomeProdutor',`TelefoneProdutor`='$TelefoneProdutor',`EmailProdutor`='$EmailProdutor',`Usuario_idUser`='$idUsuario' WHERE `idProdutor` = '$idProdutor'";

      if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

        header('Location: ../../views/fornecedores/index1.php?alert=1');
      }else{
        header('Location: ../../views/fornecedores/index1.php?alert=0');
      }

    }

    public function DelProdutor($id)
    {
        $this->query = "SELECT * FROM `fornecedores` WHERE `idProdutor` = '$id'";
        $this->result = mysqli_query($this->SQL, $this->query);
        if($row = mysqli_fetch_array($this->result)){

                $id = $row['idProdutor'];
                $public = $row['repPublic'];

                if($public == 1){
                  $p = 0;
                }else{
                  $p = 1;
                }

                mysqli_query($this->SQL, "UPDATE `fornecedores` SET `repPublic` = '$p' WHERE `idProdutor` = '$id'") or die(mysqli_error($this->SQL));
                header('Location: ../../views/fornecedores/index1.php?alert=1');
        }else{
                header('Location: ../../views/fornecedores/index1.php?alert=0');
              } 

    }

    public function Ativo($value, $id)
  {

    if($value == 0){ $v = 1; }else{ $v = 0; }

    $this->query = "UPDATE `fornecedores` SET `repAtivo` = '$v' WHERE `idProdutor` = '$id'";
    $this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL));

    header('Location: ../../views/fornecedores/');


    }//Ativo
    
   }

   $produtor = new Produtor;