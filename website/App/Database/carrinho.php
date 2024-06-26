<?php
require_once '../auth.php';
require_once '../../App/Models/requisicao.class.php';

if (isset($_POST['maqSubmit']) != null && $_POST['maqSubmit'] == "carrinho") {

	$idItem = $_POST['idItem'];
	$qtde = $_POST['qtde'];
	$nameEquip = $_POST['nameequip'];

	if (!empty($idItem) && !empty($qtde)) {

		$var = array('idItem' => $idItem, 'qtde' => $qtde, 'nameequip' => $nameEquip);

		if (!isset($_SESSION['itens'][$idItem])) {
			$_SESSION['itens'][$idItem] = $var;
		} else {
			$_SESSION['itens'][$idItem] = $var;
		}
	}
	$pkCount = (is_array($_SESSION['itens']) ? count($_SESSION['itens']) : 0);

	if ($pkCount == 0) {
		echo ' Carrinho Vazios</br> ';
	} else {

		$cont = 1;

		foreach ($_SESSION['itens'] as $maq) {

			$idItem = $maq['idItem'];
			$qtde = $maq['qtde'];
			$nameEquip = $maq['nameequip'];

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
