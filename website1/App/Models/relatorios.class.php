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


			$query = "SELECT `Equip_CodRefEquip`, `NomeProdutor`, SUM(`QuantItens`) AS QuantItens , SUM(`QuantItensVend`) AS QuantItensVend FROM `itens`, `equip`
				WHERE `Produto_CodRefProduto` = `CodRefProduto`
				$AND
				GROUP BY `Equip_CodRefEquip`";

			$result = mysqli_query($this->SQL, $query);

			while ($row[] = mysqli_fetch_assoc($result));
			return json_encode($row);
		}
	}

	public function selectCliente($perm)
	{
		if ($perm == 1) {

			$query = "SELECT `idCliente`,`NomeCliente` FROM `cliente`";
			$result = mysqli_query($this->SQL, $query);
			while ($row[] = mysqli_fetch_assoc($result));
			return json_encode($row);
		}
	}

	public function selectEquip($perm, $status = null)
	{
		if ($perm == 1) {

			if ($status != null) {
				$where = "WHERE `Ativo` = '$status'";
			} else {
				$where = "";
			}

			$query = "SELECT `CodRefEquip`,`NomeProdutor` FROM `equip` $where";
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
			$query = "SELECT * FROM vendas,cliente, itens, equip WHERE cliente_idCliente = idCliente AND idItem = iditens AND Equip_CodRefEquip = Equip_CodRefEquip $AND ORDER BY idVendas DESC";
			$result = mysqli_query($this->SQL, $query);
			while ($row[] = mysqli_fetch_assoc($result));

			return json_encode($row);
		}
	}
}
