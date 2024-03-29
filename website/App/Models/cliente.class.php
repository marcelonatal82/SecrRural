<?php

/**
 * Class Cliente
 */

require_once 'connect.php';

class Cliente extends Connect
{
	
	function index($value, $perm)
	{
		if($perm != 1){
          echo "Você não tem permissão!";
          exit();
        }

        if($value == NULL){
          $value = 1;
        }

     		$this->query = "SELECT * FROM `cliente` WHERE `statusCliente` = '$value'";
     		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

     		if($this->result){
     		
     			while ($row = mysqli_fetch_array($this->result)) {


     				echo '<br />Cliente: '. $row['NomeCliente'];

     			}
     		}
   	}//fim -- index

    function insertCliente($NomeCliente, $EmailCliente, $cpfCliente, $sexo, $data_nascimento, $naturalidade, $nacionalidade, $estado_civil, $nome_mae, $idUsuario, $perm)
    {
       if($perm == 1){

        $cpfCliente = connect::limpaCPF_CNPJ($cpfCliente);

        $idCliente = Cliente::idCliente($cpfCliente);

        if($idCliente > 0){
          return 2;
        }else{

        $NomeCliente = mysqli_real_escape_string($this->SQL, $NomeCliente);
        $EmailCliente = mysqli_real_escape_string($this->SQL, $EmailCliente);
        $cpfCliente = mysqli_real_escape_string($this->SQL, $cpfCliente);
        $sexo = mysqli_real_escape_string($this->SQL, $sexo);
        $data_nascimento = mysqli_real_escape_string($this->SQL, $data_nascimento);
        $naturalidade = mysqli_real_escape_string($this->SQL, $naturalidade);
        $nacionalidade = mysqli_real_escape_string($this->SQL, $nacionalidade);
        $estado_civil = mysqli_real_escape_string($this->SQL, $estado_civil);
        $nome_mae = mysqli_real_escape_string($this->SQL, $nome_mae);


        $query = "INSERT INTO `cliente`(`idCliente`, `NomeCliente`, `EmailCliente`, `cpfCliente`, `sexo`, `data_nascimento`, `naturalidade`, `nacionalidade`,  `estado_civil`, `nome_mae`, `statusCliente`, `Usuario_idUsuario`) VALUES (NULL,'$NomeCliente','$EmailCliente','$cpfCliente','$sexo','$data_nascimento','$naturalidade','$nacionalidade','$estado_civil','$nome_mae',1,'$idUsuario')";
        $result = mysqli_query($this->SQL, $query) or die ( mysqli_error($this->SQL));

        if($result){

            return 1;
          }else{
            return 0;
          }
        }

          mysqli_close($this->SQL);


      }
    }//Insert Cliente

	function updateCliente($idCliente, $NomeCliente, $EmailCliente, $cpfCliente,$sexo, $naturalidade, $Data_Nascimento, $nacionalidade, $estado_civil, $nome_mae, $idUsuario, $perm){

        if($perm == 1){

          $cpfCliente = connect::limpaCPF_CNPJ($cpfCliente);

          $NomeCliente = mysqli_real_escape_string($this->SQL, $NomeCliente);
          $EmailCliente = mysqli_real_escape_string($this->SQL, $EmailCliente);
          $cpfCliente = mysqli_real_escape_string($this->SQL, $cpfCliente);

          $this->query = "UPDATE `cliente` SET `NomeCliente`='$NomeCliente',`EmailCliente`='$EmailCliente',`cpfCliente`='$cpfCliente', `Usuario_idUsuario`= '$idUsuario' WHERE `idCliente`= '$idCliente'";
          $this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

          if($this->result){
            return 1;
          }else{
            return 0;
          }

          mysqli_close($this->SQL);

        }
      }

      function statusCliente($status, $idCliente){

        $this->query = "UPDATE `cliente` SET `statusCliente`= '$status' WHERE `idCliente`= '$idCliente'";

        $this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

        if($this->result){
          return 1;
        }else{
          return 0;
        }

        mysqli_close($this->SQL);

      }

      function deleteCliente($idCliente){

        $this->query = "DELETE FROM `cliente` WHERE `idCliente`= '$idCliente'";
        
        $this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

        if($this->result){
          return 1;
        }else{
          return 0;
        }

        mysqli_close($this->SQL);

      }

      public function idcliente($cpfCliente){

        $this->client = "SELECT * FROM `cliente` WHERE `cpfCliente` = '$cpfCliente'";

            if($this->resultcliente = mysqli_query($this->SQL, $this->client)  or die (mysqli_error($this->SQL))){

                $row = mysqli_fetch_array($this->resultcliente);
                return $idCliente = $row['idCliente'];
            }
    }
    public function index2($value)
    {
        $this->query = "SELECT * FROM `cliente`,`fabricante`,`equip` WHERE (`Fabricante_idFabricante` = `idFabricante` AND `Equip_CodRefEquip` = `CodRefEquip`) AND `itensPublic` = '$value'";
        $this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL));

        if ($this->result) {

            echo '<table id="example1" class="table">
        <thead class="thead-inverse">
          <tr>
            <th>Ativo</th>
            <th>Image</th>
            <th>Nome Equipamento</th>
            <th>Fabricante</th>
            <th>Quant. Estoque</th>
            <th>Quant. Vendido</th>
            <th>V. Compra.</th>
            <th>V. Vendido</th>
            <th>Data Compra</th>
            <th>Data Vencimento</th>
            <th>Edit</th>
            <th>Public</th>
          </tr>
        </thead>
        <tbody>';

            while ($row = mysqli_fetch_array($this->result)) {

                if ($row['ItensAtivo'] == 0) {
                    $c = 'class="label-warning"';
                } else {
                    $c = " ";
                }
                echo '<tr ' . $c . '><th>
          <!-- drag handle -->
          <span class="handle">
            <i class="fa fa-ellipsis-v"></i>
            <i class="fa fa-ellipsis-v"></i>
          </span>

          <!-- checkbox -->';
                $id = $row['idItens'];
                $Ativo = $row['ItensAtivo'];

                echo '<form class="label" name="ativ' . $id . '" enctype="multipart/form-data"  action="../../App/Database/action.php" method="post">
          <input type="hidden" name="id" id="id_action' . $id . '" value="' . $id . '">          
          <input type="hidden" id="status' . $id . '" name="status" 
          value="' . $Ativo . '">
          <input type="hidden" name="tabela" id="tabela' . $id . '" value="itens">  

          <input type="checkbox" id="checked' . $id . '" name="checked[' . $id . ']" ';
                if ($Ativo == 1) {
                    echo "checked";
                }
                echo ' value="' . $Ativo . '" onclick="this.form.submit();"></form>
          </th><td>
          ';

                if (!empty($row['Image'])) {
                    echo '<img src="../' . $row['Image'] . '" width="50" />';
                }
                echo '</td><td>' . $row['NomeEquip'] . '</td>
          <td>' . $row['NomeFabricante'] . '</td>
          <td>' . $row['QuantItens'] . '</td>
          <td>' . $row['QuantItensVend'] . '</td>
          <td>' . $row['ValCompItens'] . '</td>
          <td>' . $row['ValVendItens'] . '</td>
          <td>' . $row['DataCompraItens'] . '</td>
          <td>' . $row['DataVenci_Itens'] . '</td>        
          
          <td>
                <a href="edititens.php?q=' . $row['idItens'] . '"><i class="fa fa-edit"></i></a>
          </td>
          <td>
              <!-- Button trigger modal -->
                    <a href="" data-toggle="modal" data-target="#myModal' . $row['idItens'] . '">';

                if ($row['Public'] == 0) {
                    echo '<i class="glyphicon glyphicon-remove" aria-hidden="true"></i>';
                } else {
                    echo '<i class="glyphicon glyphicon-ok" aria-hidden="true"></i>';
                }

                echo '</a>


    <!-- Modal -->
  <div>
    <form id="delItens' . $row['idItens'] . '" name="delItens' . $row['idItens'] . '" action="../../App/Database/delItens.php" method="post" style="color:#000;">
    <div class="modal fade" id="myModal' . $row['idItens'] . '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Você tem serteza que deseja alterar o status deste item na sua lista.</h4>
          </div>
          <div class="modal-body">
            Código: ' . $row['idItens'] . ' - ' . $row['NomeEquip'] . ' - ' . $row['NomeFabricante'] . '
          </div>
          <input type="hidden" id="id' . $row['idItens'] . '" name="id" value="' . $row['idItens'] . '">
          <div class="modal-footer">
            <button type="submit" value="Cancelar" class="btn btn-default">Não</button>
            <button type="submit" name="update" value="Cadastrar" class="btn btn-primary">Sim</button>
          </div>
        </div>
      </div>
    </div>
    </form></div>

          </td>
            </tr>';
            }
            echo '</tbody>
  </table>';
        }
    }//UPDATE CLIENTE
	function search($value){

        if(isset($value))  
        {  
          //$output = '';  
          $query = "SELECT * FROM `cliente` WHERE `cpfCliente` LIKE '".$value."%' OR `NomeCliente` LIKE '".$value."%' LIMIT 5";
          $result = mysqli_query($this->SQL, $query); 

          if(mysqli_num_rows($result) > 0)  
          {  

           while($row = mysqli_fetch_array($result))  
           {  
              
            $output[] = $row; 
          } 

          return array('data' => $output);

        }else{

          return 0;
        }  

      }

    }//------

    function searchdata($value){
      
      $value = explode(' ', $value);
      $valor = str_replace("." , "" , $value[0] ); // Primeiro tira os pontos
      $valor = str_replace("-" , "" , $valor); // Depois tira o taço
      $value = $valor;

      if(isset($value))  
      {  
        //$output = '';  
        $query = "SELECT * FROM `cliente` WHERE `cpfCliente` = '$value'";
        $result = mysqli_query($this->SQL, $query);  
        if(mysqli_num_rows($result) > 0)  
        {  

          if($row = mysqli_fetch_array($result))  
          {  
            $output[] = $row; 
          }  
          return array('data' => $output); 
        }else{
          return $value;
        } 
      }  
    }//----searchdata------
    
    public function dadoscliente($idCliente){

        $this->client = "SELECT * FROM `cliente` WHERE `idCliente` = '$idCliente'";

            if($this->resultcliente = mysqli_query($this->SQL, $this->client)  or die (mysqli_error($this->SQL))){

                $row = mysqli_fetch_array($this->resultcliente);
                return $row;
            }
    }

}
