  <?php

  /*
   Class produtos
  */

   require_once 'connect.php';

   class Equip extends Connect
   {
   	
   	public function index($value)
   	{
   		$this->query = "SELECT * FROM `equip` WHERE `PublicEquip` = '$value'";
   		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

   		if($this->result){

   			while ($row = mysqli_fetch_array($this->result)) {
   				
          if($row['Ativo'] == 0){ $c ='class="label-warning"'; }else{ $c =" ";}
            echo '<li '.$c.'>

          <!-- drag handle -->
          <span class="handle">
            <i class="fa fa-ellipsis-v"></i>
            <i class="fa fa-ellipsis-v"></i>
          </span>
          <!-- checkbox -->
          <form class="label" name="ativ'.$row['CodRefEquip'].'" action="../../App/Database/action.php" method="post">
                    <input type="hidden" name="id" id="id" value="'.$row['CodRefEquip'].'">
                    <input type="hidden" name="status" id="status" value="'.$row['Ativo'].'">
                    <input type="hidden" name="tabela" id="tabela" value="equip">                  
                    <input type="checkbox" id="status" name="status" ';

                     if($row['Ativo'] == 1){ echo 'checked'; } 
                    
                    echo ' value="'.$row['Ativo'].'" onclick="this.form.submit();" /></form>
          
          <!-- todo text -->
          <span class="text"><span class="badge left">'.$row['CodRefEquip'].'</span> '.$row['NomeEquip'].'</span>
          
          <!-- Emphasis label -->
          <!-- <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small> -->
          <!-- General tools such as edit or delete-->
          <div class="tools right">

                      <a href="" data-toggle="modal" data-target="#myModalup'.$row['CodRefEquip'].'"><i class="fa fa-edit"></i></a> 
                    
                      <!-- Button trigger modal -->
                    <a href="" data-toggle="modal" data-target="#myModal'.$row['CodRefEquip'].'">';

                    if($row['PublicEquip'] == 0){echo '<i class="glyphicon glyphicon-remove" aria-hidden="true"></i>';}else{ echo '<i class="glyphicon glyphicon-ok" aria-hidden="true"></i>';}

                    echo '</a> </div>

    <!-- Modal -->
  <div class="modal fade" id="myModal'.$row['CodRefEquip'].'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form id="delequip'.$row['CodRefEquip'].'" name="delequip'.$row['CodRefEquip']. '" action="../../App/Database/delequip.php" method="post" style="color:#000;">
    
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Você tem certeza que deseja alterar o status deste item na sua lista.</h4>
          </div>
          <div class="modal-body">
            Nome: ' .$row['NomeEquip'].'
          </div>
          <input type="hidden" id="id" name="id" value="'.$row['CodRefEquip'].'">
          <div class="modal-footer">
            <button type="submit" value="Cancelar" class="btn btn-default">Não</button>
            <button type="submit" name="update" value="Cadastrar" class="btn btn-primary">Sim</button>
          </div>
        </div>
      </div>
      </form>
    </div>


      <!-- Modal UPDATE -->
  <div class="modal fade" id="myModalup'.$row['CodRefEquip'].'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <form id="Upequip'.$row['CodRefEquip'].'" name="Upequip'.$row['CodRefEquip'].'" action="../../App/Database/insertequip.php" method="post" style="color:#000;">
    
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Você tem certeza que deseja alterar o status deste item na sua lista.</h4>
          </div>
          <div class="modal-body">
            Nome Atual:
            <input type="text" id="nomeEquip" name="nomeEquip" value="'.$row['NomeEquip'].'">
          </div>
          <input type="hidden" id="id" name="id" value="'.$row['CodRefEquip'].'">
          
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

  public function listProdutos(){

   $this->query = "SELECT *FROM `equip` WHERE `Ativo` = 1 AND `PublicEquip` = 1";
   $this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

   if($this->result){

    while ($row = mysqli_fetch_array($this->result)) {
      if($value == $row['CodRefEquip']){
        $selected = "selected";
      }else{
        $selected = "";
      }
      echo '<option value="'.$row['CodRefEquip'].'" '.$selected.' >'.$row['NomeEquip'].'</option>';
    }

  }
  }

  public function InsertEquip($nomeEquip, $idUsuario){

   $this->query = "INSERT INTO `equip`(`CodRefEquip`, `NomeEquip`,`Ativo` ,`PublicEquip` , `Usuario_idUser`) VALUES (NULL,'$nomeEquip', 1 , 1 ,'$idUsuario')";
   if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

    header('Location: ../../views/equip/index.php?alert=1');
  }else{
    header('Location: ../../views/equip/index.php?alert=0');
  }
  }

  public function UpdateEquip($id, $nomeEquip, $idUsuario)
  {
      if(mysqli_query($this->SQL, "UPDATE `equip` SET `NomeEquip` = '$nomeEquip', `Usuario_idUser` = '$idUsuario' WHERE `CodRefEquip` = '$id'") or die(mysqli_error($this->SQL))){

                header('Location: ../../views/equip/index.php?alert=1');
      }else{
                header('Location: ../../views/equip/index.php?alert=0');
              }
    
  }

  public function DelEquip($value)
      {

        $this->query = "SELECT * FROM `equip` WHERE `CodRefEquip` = '$value'";
        $this->result = mysqli_query($this->SQL, $this->query);
        if($row = mysqli_fetch_array($this->result)){

                $id = $row['CodRefEquip'];
                $public = $row['PublicEquip'];

                if($public == 1){
                  $p = 0;
                }else{
                  $p = 1;
                }

                mysqli_query($this->SQL, "UPDATE `equip` SET `PublicEquip` = '$p' WHERE `CodRefEquip` = '$id'") or die(mysqli_error($this->SQL));
                header('Location: ../../views/equip/index.php?alert=1');
        }else{
                header('Location: ../../views/equip/index.php?alert=0');
              }
    } 

  public function Ativo($value, $id)
  {

    if($value == 0){ $v = 1; }else{ $v = 0; }

    $this->query = "UPDATE `equip` SET `Ativo` = '$v' WHERE `CodRefEquip` = '$id'";
    $this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL));

    header('Location: ../../views/equip/');


    }//Ativo

  }

  $equip = new Equip;