<?php


/**
 * 
 */
require_once 'connect.php';

class Relatorio extends Connect
{

	public function qtdeItensEstoqueTotal($perm)
	{
		if ($perm == 1) {

			$query = "SELECT SUM(`QuantItens`) AS QuantItens , SUM(`QuantItensVend`) AS QuantItensVend FROM `itens`";

			$result = mysqli_query($this->SQL, $query);

			if ($row = mysqli_fetch_assoc($result)) {

				$qi = $row['QuantItens'];
				$qiv = $row['QuantItensVend'];
				$r = $qi - $qiv;
				return $r;
			}
		}
	}

	public function qtdeItensEstoque($perm, $status = null, $idProdutor = null)
	{
		if ($perm == 1) {

			if ($idProdutor != null) {
				$AND = "AND `Equip_CodRefEquip` = '$idProdutor' AND `Ativo` = '$status'";
			} elseif ($status != null) {
				$AND = "AND `Ativo` = '$status'";
			} else {
				$AND = "";
			}


			$query = "SELECT `Equip_CodRefEquip`, `NomeEquip`, SUM(`QuantItens`) AS QuantItens , SUM(`QuantItensVend`) AS QuantItensVend FROM `itens`, `maq`
				WHERE `Equip_CodRefEquip` = `CodRefEquip`
				$AND
				GROUP BY `Equip_CodRefEquip`";

			$result = mysqli_query($this->SQL, $query);

			while ($row[] = mysqli_fetch_assoc($result));
			return json_encode($row);
		}
	}

	public function selectProdutor($perm)
	{
		if ($perm == 1) {

			$query = "SELECT `idProdutor`,`NomeProdutor` FROM `fornecedores`";
			$result = mysqli_query($this->SQL, $query);
			while ($row[] = mysqli_fetch_assoc($result));
			return json_encode($row);
		}
	}

	public function selectMaq($perm, $status = null)
	{
		if ($perm == 1) {

			if ($status != null) {
				$where = "WHERE `Ativo` = '$status'";
			} else {
				$where = "";
			}

			$query = "SELECT `CodRefEquip`,`NomeProdutor` FROM `maq` $where";
			$result = mysqli_query($this->SQL, $query);
			while ($row[] = mysqli_fetch_assoc($result));

			return json_encode($row);
		}
	}

	public function vendascliente($perm, $idEquip = null, $idCliente = null)
	{
		if ($perm == 1) {
			if ($idEquip != null && $idCliente != null) {
				$AND = "AND `Equip_CodRefEquip` = '$idEquip' AND `idCliente` = '$idCliente'";
			} elseif ($idEquip != null) {
				$AND = "AND `Equip_CodRefEquip` = '$idEquip'";
			} elseif ($idCliente != null) {
				$AND = "AND `idCliente` = '$idCliente'";
			} else {
				$AND = "";
			}
			$query = "SELECT * FROM requisicao,cliente, itens, maq WHERE cliente_idCliente = idCliente AND idItem = iditens AND Equip_CodRefEquip = Equip_CodRefEquip $AND ORDER BY idVendas DESC";
			$result = mysqli_query($this->SQL, $query);
			while ($row[] = mysqli_fetch_assoc($result));

			return json_encode($row);
		}
	}
}
