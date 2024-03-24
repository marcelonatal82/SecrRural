<?php
require_once '../auth.php';
require_once '../../App/Models/vendas.class.php';

if (isset($_POST['equipSubmit']) != null && $_POST['equipSubmit'] == "carrinho") {

	$idEquip = $_POST['idItem'];
	$qtde = $_POST['qtde'];
	$nameEquip = $_POST['nameequip'];

	if (!empty($idEquip) && !empty($qtde)) {

		$var = array('idItem' => $idEquip, 'qtde' => $qtde, 'nameequip' => $nameEquip);

		if (!isset($_SESSION['itens'][$idEquip])) {
			$_SESSION['itens'][$idEquip] = $var;
		} else {
			$_SESSION['itens'][$idEquip] = $var;
		}
	}
	$pkCount = (is_array($_SESSION['itens']) ? count($_SESSION['itens']) : 0);

	if ($pkCount == 0) {
		echo ' Carrinho Vazios</br> ';
	} else {

		$cont = 1;

		foreach ($_SESSION['itens'] as $equip) {

			$idItem = $equip['idItem'];
			$qtde = $equip['qtde'];
			$nameEquip = $equip['nameproduto'];

			echo '<tr>
					<td>' . $cont . '</td>
					<td>' . $idItem . '</td>
					<td>' . $nameEquip . '</td>
					<td><input type="hidden" id="idItem" name="idItem[' . $idItem . ']" value="' . $idItem . '" />
					<input type="hidden" id="qtd" name="qtd[' . $idItem . ']" value="' . $qtde . '" />' . $qtde . '
					<a href="../../App/Database/remover.php?remover=carrinho&id=' . $idItem . '"><i class="fa fa-trash text-danger"></i></a></td>
					</tr>';
			$cont = $cont + 1;
		}
	}
}
