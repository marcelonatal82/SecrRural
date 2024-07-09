-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 07-Jul-2024 às 23:47
-- Versão do servidor: 8.0.33
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controlestoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `NomeCliente` varchar(100) NOT NULL,
  `EmailCliente` varchar(100) NOT NULL,
  `cpfCliente` text NOT NULL,
  `statusCliente` int NOT NULL,
  `Usuario_idUsuario` int NOT NULL,
  `dataRegCliente` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sexo` varchar(10) NOT NULL,
  `naturalidade` varchar(15) NOT NULL,
  `data_nascimento` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nacionalidade` varchar(100) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `nome_mae` varchar(100) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `NomeCliente`, `EmailCliente`, `cpfCliente`, `statusCliente`, `Usuario_idUsuario`, `dataRegCliente`, `sexo`, `naturalidade`, `data_nascimento`, `nacionalidade`, `estado_civil`, `nome_mae`) VALUES
(7, 'Thiago augusto SANTOS', 'augustosantos@teste.com', '11119999119', 1, 3, '2019-03-20 21:45:01', 'MASCULINO', 'BRASILEIRO', '14/04/2024', 'JATAI-GOIAS', 'CASADO', 'MAE DELE'),
(8, 'Wesley xxxxx', 'teste4@teste.com', '33344455567', 1, 1, '2019-03-25 21:00:06', 'masculino', 'brasileiro', '29/08/1983', 'goias', 'casado', 'MARIA NATAL'),
(20, 'ALEXANDRE NATAL', 'alexandre@alexandre.com..br', '111111222525', 1, 3, '2024-04-23 00:11:54', 'MASCULINO', 'ARGENTINO', '29/01/1986', 'JATAI GOIAS', 'SOLTEIRO', 'MAE DO ALEXANDRE'),
(33, 'MARCELO NATAL', 'ALVES@ALVES.COM', '00165588820', 1, 1, '2024-05-14 00:15:23', 'MASCULINO', 'JATAIGO', '01/01/2008', 'BRASILEIRO', 'CASADO', 'JOSANE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
CREATE TABLE IF NOT EXISTS `fabricante` (
  `idFabricante` int NOT NULL AUTO_INCREMENT,
  `NomeFabricante` varchar(75) NOT NULL,
  `CNPJFabricante` varchar(75) NOT NULL,
  `EmailFabricante` varchar(75) NOT NULL,
  `EnderecoFabricante` varchar(75) NOT NULL,
  `TelefoneFabricante` varchar(75) NOT NULL,
  `Public` int NOT NULL,
  `Ativo` int NOT NULL,
  `Usuario_idUser` int NOT NULL,
  PRIMARY KEY (`idFabricante`),
  KEY `fk_Fabricante_Usuario1_idx` (`Usuario_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`idFabricante`, `NomeFabricante`, `CNPJFabricante`, `EmailFabricante`, `EnderecoFabricante`, `TelefoneFabricante`, `Public`, `Ativo`, `Usuario_idUser`) VALUES
(1, 'Compaq', '212221211212211', 'ibm@ibm.com', 'Rua Central do Brasil - nÂº 200', '11 34343-4334', 1, 1, 1),
(2, 'Intel', '11111111111111', 'intel@intel.com', 'Rua 3', '121212212', 1, 1, 1),
(3, 'DELL', '2222222222222', 'dell@dell.com', 'Rua Central do Brasil - nÂº 203', '+5531988848700', 0, 0, 1),
(4, 'CaderbrÃ¡s Bico Internacional Ltda', '05.117571/002-05', 'nadir@distribuidoradistrioeste.com.br', 'Av Germano Dix - 4800 Pirassununga - SP', '(19)3561-3092', 1, 1, 1),
(6, 'Lenovo', '11111111111112', 'lenovo@lenovo.com', 'Rua 4', '333333333333', 1, 1, 1),
(7, 'Microsoft', '000099998989898', 'microsoft@microsoft.com', 'Rua 1', '44444444', 1, 1, 1),
(8, 'Microsoft 2', '000099998989898', 'microsoft@microsoft.com', 'Rua 1', '44444444', 1, 1, 1),
(9, 'Chevrolet', '009999999900000', 'teste@teste.com', 'Rua 1', '334544343', 1, 1, 1),
(10, 'Spal Industria Brasileira de Bebidas', '61186888000193', 'N/S', 'Avenida Francisco Ferreira Lopes - 4303', '08000212121', 1, 1, 1),
(11, 'JOHN DEERE', '', '', '', '', 1, 1, 1),
(12, 'MASSEY FERGUSON ', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `NomeFornecedor` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TelefoneFornecedor` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EmailFornecedor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `repAtivo` int NOT NULL,
  `repPublic` int NOT NULL,
  `Fabricante_idFabricante` int NOT NULL,
  `Usuario_idUser` int NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  KEY `fk_Representante_Fabricante1_idx` (`Fabricante_idFabricante`),
  KEY `fk_Representante_Usuario1_idx` (`Usuario_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`idFornecedor`, `NomeFornecedor`, `TelefoneFornecedor`, `EmailFornecedor`, `repAtivo`, `repPublic`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES
(1, 'Francisco Algusto', '11 9999-9999', 'franciscoalgusto@ibm.com', 1, 1, 1, 1),
(2, 'FabrÃ­cio PaixÃ£o ', '31 98888-8888', 'fabriciotp@ibm.com', 1, 1, 1, 1),
(3, 'Marcos Rafael', '43434343', 'marcosrafael@intel.com', 1, 1, 2, 1),
(4, 'Antonio Carlos ', '31988848780', 'antoniocarlos@dell.com', 0, 0, 3, 1),
(5, 'Distrioeste - Distribuidora e atacadista', '49 3331-3122', 'nadir@distribuidoradistrioeste.com.br', 1, 1, 4, 1),
(6, 'Thiago Rui', '55555555555', 'thiagorui@lenovo.com', 1, 1, 6, 1),
(7, 'Thiago', '33333444', 'thiago@microsoft.com', 1, 1, 7, 1),
(8, 'Thiago 2', '33333444', 'thiago2@microsoft.com', 1, 1, 8, 1),
(9, 'Thiago 22', '1000000', 'thiago@chevrolet.com', 1, 1, 9, 1),
(10, 'Spal Industria Brasileira de Bebidas', '08000212121', 'N/S', 1, 1, 10, 1),
(11, '', '', '', 1, 1, 11, 1),
(12, '', '', '', 1, 1, 11, 1),
(13, '', '', '', 1, 1, 11, 1),
(14, '', '', '', 1, 1, 11, 1),
(15, '', '', '', 1, 1, 11, 1),
(16, '', '', '', 1, 1, 12, 1),
(17, '', '', '', 1, 1, 12, 1),
(18, '', '', '', 1, 1, 12, 1),
(19, 'dd', 'dd', 'dd', 1, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

DROP TABLE IF EXISTS `itens`;
CREATE TABLE IF NOT EXISTS `itens` (
  `idItens` int NOT NULL AUTO_INCREMENT,
  `Image` varchar(250) NOT NULL,
  `QuantItens` decimal(10,0) NOT NULL,
  `QuantItensVend` decimal(10,0) NOT NULL,
  `ValCompItens` decimal(10,2) NOT NULL,
  `ValVendItens` decimal(10,2) NOT NULL,
  `DataCompraItens` date NOT NULL,
  `DataVenci_Itens` date DEFAULT NULL,
  `ItensAtivo` tinyint NOT NULL,
  `ItensPublic` int NOT NULL,
  `Equip_CodRefEquip` int NOT NULL,
  `Fabricante_idFabricante` int NOT NULL,
  `Usuario_idUser` int NOT NULL,
  `DataRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idItens`),
  KEY `fk_Itens_Produto1_idx` (`Equip_CodRefEquip`),
  KEY `fk_Itens_Fabricante1_idx` (`Fabricante_idFabricante`),
  KEY `fk_Itens_Usuario1_idx` (`Usuario_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`idItens`, `Image`, `QuantItens`, `QuantItensVend`, `ValCompItens`, `ValVendItens`, `DataCompraItens`, `DataVenci_Itens`, `ItensAtivo`, `ItensPublic`, `Equip_CodRefEquip`, `Fabricante_idFabricante`, `Usuario_idUser`, `DataRegistro`) VALUES
(15, 'dist/img/products/transferir.jfif', '58', '12', '0.30', '1.00', '2019-09-17', '2020-09-17', 1, 1, 6, 4, 1, '2019-09-17 21:29:33'),
(16, 'dist/img/products/oie_pNFPNYDlDJlz.png', '56', '0', '1.00', '1.00', '2024-07-07', '2024-08-02', 1, 1, 26, 6, 1, '2024-07-07 22:22:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `maq`
--

DROP TABLE IF EXISTS `maq`;
CREATE TABLE IF NOT EXISTS `maq` (
  `CodRefEquip` int NOT NULL AUTO_INCREMENT,
  `NomeEquip` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Ativo` int NOT NULL,
  `PublicEquip` int NOT NULL,
  `Usuario_idUser` int NOT NULL,
  PRIMARY KEY (`CodRefEquip`),
  KEY `fk_Produto_Usuario_idx` (`Usuario_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `maq`
--

INSERT INTO `maq` (`CodRefEquip`, `NomeEquip`, `Ativo`, `PublicEquip`, `Usuario_idUser`) VALUES
(1, 'CAM TRUQUE', 1, 1, 3),
(2, 'PA-CARREG', 1, 1, 3),
(3, 'CAM CAÇAMBA', 1, 1, 3),
(4, 'Pulverizadores', 1, 1, 1),
(5, 'Semeadoras', 1, 1, 1),
(6, 'Arados', 1, 1, 1),
(7, 'Trator de traç simpl', 1, 1, 3),
(9, 'trator esteira', 1, 1, 3),
(21, 'TRATORESTEIRA', 1, 1, 3),
(24, 'CARRETA', 1, 1, 1),
(25, 'COLHEITADEIRA', 1, 1, 1),
(26, 'PATROLA DE CORRENTE', 1, 1, 1),
(27, 'MASSEY FERGUSON', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(75) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Password` varchar(75) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `Dataregistro` date NOT NULL,
  `Permissao` tinyint NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `Username`, `Email`, `Password`, `imagem`, `Dataregistro`, `Permissao`) VALUES
(1, 'admin', 'admin@estoque.com', '21232f297a57a5a743894a0e4a801fc3', 'dist/img/fabriciopaixao.jpg', '2017-04-03', 1),
(2, 'CACHORRO', 'vendedor@estoque.com', '21232f297a57a5a743894a0e4a801fc3', '././././dist/img/fabriciopaixao.jpg', '2017-04-03', 2),
(3, 'Marcelo ', 'alves@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', './dist/img/1634946064804.jfif', '2023-08-22', 1),
(5, 'testando', 'teste@test.com', 'e10adc3949ba59abbe56e057f20f883e', '././dist/img/avatar.png', '2024-02-26', 1),
(7, 'MARCELO NATAL', 'teste1@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'dist/img/Captura de tela 2022-04-23 145554.png', '2024-03-06', 1),
(16, 'mais1', 'mais@mais', 'e10adc3949ba59abbe56e057f20f883e', './dist/img/avatar.png', '2024-05-22', 2),
(17, 'BELINHA', 'BELINHA@BELINHA', '156d88df3c13690787f61037bafd7280', 'dist/img/avatar.png', '2024-05-22', 2),
(18, 'vendedor', 'vendedor@vendedor', 'e10adc3949ba59abbe56e057f20f883e', 'dist/img/avatar.png', '2024-05-22', 2),
(19, 'novo', 'novo', '202cb962ac59075b964b07152d234b70', 'dist/img/avatar.png', '2024-05-22', 2),
(20, 'JOSANE oliveira', 'josane@josane', 'e10adc3949ba59abbe56e057f20f883e', './dist/img/avatar.png', '2024-06-04', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `idvendas` int NOT NULL AUTO_INCREMENT,
  `quantitens` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `iditem` int NOT NULL,
  `cart` varchar(255) NOT NULL,
  `cliente_idCliente` int NOT NULL,
  `idusuario` int NOT NULL,
  `datareg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idvendas`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`idvendas`, `quantitens`, `valor`, `iditem`, `cart`, `cliente_idCliente`, `idusuario`, `datareg`) VALUES
(1, 10, '11000.00', 12, '', 1, 2, '2019-02-21 21:27:12'),
(2, 15, '16500.00', 12, '', 1, 2, '2019-02-21 21:28:09'),
(3, 20, '220.00', 11, '', 2, 2, '2019-02-21 21:28:57'),
(4, 5, '5500.00', 12, '', 3, 2, '2019-02-28 20:23:18'),
(5, 2, '2200.00', 12, '', 3, 2, '2019-02-28 20:29:20'),
(6, 5, '5500.00', 12, '', 3, 2, '2019-02-28 20:32:09'),
(7, 2, '2200.00', 12, '', 3, 2, '2019-02-28 20:35:40'),
(8, 2, '2200.00', 12, '', 4, 2, '2019-03-01 19:33:37'),
(9, 2, '2200.00', 12, '', 5, 1, '2019-03-01 19:42:30'),
(10, 2, '2200.00', 12, '', 6, 1, '2019-03-01 19:46:54'),
(11, 2, '2200.00', 12, '', 5, 1, '2019-03-01 19:48:02'),
(12, 1, '1100.00', 12, '', 1, 2, '2019-03-13 21:50:14'),
(13, 1, '11.00', 11, '', 1, 2, '2019-03-13 21:50:15'),
(14, 50, '550.00', 11, '', 1, 2, '2019-03-13 21:51:44'),
(15, 5, '55.00', 11, '', 1, 2, '2019-03-13 21:54:41'),
(16, 50, '550.00', 11, '', 1, 2, '2019-03-20 20:40:05'),
(17, 20, '220.00', 11, '', 1, 2, '2019-03-20 21:00:24'),
(18, 20, '22000.00', 12, '', 1, 2, '2019-03-20 21:00:24'),
(19, 10, '11000.00', 12, '', 7, 2, '2019-03-20 21:45:01'),
(20, 11, '121.00', 11, '', 7, 2, '2019-03-20 21:45:01'),
(21, 80, '880.00', 11, '', 1, 2, '2019-03-20 22:09:38'),
(22, 2, '22.00', 11, '', 1, 2, '2019-03-20 22:10:51'),
(23, 2, '22.00', 11, '', 1, 2, '2019-03-20 22:13:00'),
(24, 2, '22.00', 11, '', 1, 2, '2019-03-20 22:13:34'),
(25, 11, '12100.00', 12, '', 1, 2, '2019-03-25 20:52:37'),
(26, 11, '12100.00', 12, '', 1, 2, '2019-03-25 20:59:45'),
(27, 20, '220.00', 11, '', 8, 2, '2019-03-25 21:00:06'),
(28, 11, '121.00', 11, '', 8, 2, '2019-03-25 21:00:50'),
(29, 3, '33.00', 11, '', 8, 2, '2019-03-25 21:03:28'),
(30, 23, '253.00', 11, '', 8, 2, '2019-03-25 21:05:26'),
(31, 11, '121.00', 11, '', 8, 2, '2019-03-25 21:08:45'),
(32, 1, '1100.00', 12, '', 1, 2, '2019-04-10 22:08:50'),
(33, 12, '132.00', 11, '', 1, 2, '2019-04-10 22:08:50'),
(34, 10, '1980.00', 12, '', 5, 2, '2019-04-10 22:14:18'),
(35, 15, '165.00', 11, '', 5, 2, '2019-04-10 22:14:18'),
(36, 2, '22.00', 11, '', 7, 2, '2019-09-14 00:16:09'),
(37, 3, '33.00', 11, '', 2, 2, '2019-09-14 00:18:05'),
(38, 3, '594.00', 12, '', 2, 2, '2019-09-14 00:18:06'),
(39, 2, '396.00', 12, '', 3, 2, '2019-09-14 00:23:23'),
(40, 3, '33.00', 11, '', 3, 2, '2019-09-14 00:23:23'),
(41, 3, '594.00', 12, '', 3, 2, '2019-09-14 00:51:06'),
(42, 2, '396.00', 12, '', 3, 2, '2019-09-16 21:46:25'),
(43, 2, '22.00', 11, '', 3, 2, '2019-09-16 21:46:25'),
(44, 5, '990.00', 12, '', 1, 2, '2019-09-16 21:47:21'),
(45, 10, '110.00', 11, '', 1, 2, '2019-09-16 21:47:21'),
(46, 2, '22.00', 11, '', 2, 2, '2019-09-16 21:48:01'),
(47, 2, '396.00', 12, '', 2, 2, '2019-09-17 20:47:52'),
(48, 2, '396.00', 12, '', 3, 2, '2019-09-17 21:31:36'),
(49, 10, '10.00', 15, '', 3, 2, '2019-09-17 21:31:36'),
(50, 1, '3900.00', 14, '', 3, 2, '2019-09-17 21:31:36'),
(51, 2, '396.00', 12, '', 2, 2, '2019-09-20 20:39:09'),
(52, 2, '5780.00', 13, '', 2, 2, '2019-09-20 20:39:11'),
(53, 3, '594.00', 12, '', 3, 2, '2019-09-20 20:48:09'),
(54, 1, '1.00', 15, '', 2, 2, '2019-09-20 21:00:32'),
(55, 1, '3900.00', 14, '', 7, 2, '2019-09-20 21:19:35'),
(56, 1, '198.00', 12, '', 1, 2, '2019-09-20 21:32:03'),
(57, 1, '2890.00', 13, '', 3, 2, '2019-09-20 21:33:47'),
(58, 1, '3900.00', 14, '', 3, 2, '2019-09-20 21:33:47'),
(59, 1, '11.00', 11, '', 1, 2, '2019-10-08 00:10:02'),
(60, 1, '2890.00', 13, '', 1, 2, '2019-10-08 00:10:02'),
(61, 1, '3900.00', 14, '', 1, 2, '2019-10-08 00:10:02'),
(62, 1, '11.00', 11, '', 1, 2, '2019-10-09 20:58:06'),
(63, 2, '396.00', 12, '', 1, 2, '2019-10-09 20:58:06'),
(64, 1, '2890.00', 13, '', 1, 2, '2019-10-10 20:15:38'),
(65, 1, '3900.00', 14, '', 1, 2, '2019-10-10 20:15:38'),
(66, 1, '198.00', 12, '', 1, 2, '2019-10-10 20:15:38'),
(67, 5, '45.00', 12, '', 2, 2, '2019-10-10 20:50:45'),
(68, 1, '9.50', 13, '', 2, 2, '2019-10-10 20:50:45'),
(69, 1, '3900.00', 14, '', 2, 2, '2019-10-10 20:50:45'),
(70, 1, '2100.00', 11, '', 8, 2, '2019-10-10 21:07:31'),
(71, 10, '95.00', 13, '', 8, 2, '2019-10-10 21:07:32'),
(72, 1, '9.50', 13, '', 2, 2, '2019-10-11 13:08:36'),
(73, 5, '45.00', 12, '', 2, 2, '2019-10-11 13:08:36'),
(74, 1, '3900.00', 14, '', 2, 2, '2019-10-11 13:08:36'),
(75, 1, '9.00', 12, '', 3, 2, '2019-10-11 21:07:49'),
(76, 1, '2100.00', 11, '', 5, 1, '2019-10-12 00:14:20'),
(77, 5, '45.00', 12, '', 4, 2, '2019-10-12 03:06:03'),
(78, 1, '2100.00', 11, '', 7, 1, '2019-10-12 03:20:28'),
(79, 15, '142.50', 13, '', 7, 1, '2019-10-12 03:20:28'),
(80, 2, '4200.00', 11, '', 2, 2, '2019-10-12 22:42:58'),
(81, 2, '18.00', 12, '', 2, 2, '2019-10-12 22:42:58'),
(82, 1, '9.00', 12, '', 6, 2, '2019-10-19 19:59:39'),
(83, 1, '2100.00', 11, '', 6, 2, '2019-10-19 19:59:39'),
(84, 2, '18.00', 12, '', 6, 2, '2019-10-19 20:05:03'),
(85, 1, '2100.00', 11, '', 6, 2, '2019-10-19 20:05:03'),
(86, 2, '18.00', 12, '', 2, 2, '2019-10-19 20:06:17'),
(87, 1, '2100.00', 11, '', 2, 2, '2019-10-19 20:06:18'),
(88, 1, '2100.00', 11, '7fd0446034d7d2364710337f8ae77176', 5, 1, '2019-10-22 21:11:58'),
(89, 4, '36.00', 12, '7fd0446034d7d2364710337f8ae77176', 5, 1, '2019-10-22 21:11:59'),
(90, 1, '3900.00', 14, '7fd0446034d7d2364710337f8ae77176', 5, 1, '2019-10-22 21:11:59'),
(91, 1, '2100.00', 11, '055e6b42f4acd384dc304d6b87eaec6e', 1, 1, '2019-11-14 20:38:25'),
(92, 1, '1.00', 15, 'ae899f50e049178297f39a0f3f486358', 20, 1, '2024-05-20 23:52:50'),
(93, 5, '47.50', 13, 'ae899f50e049178297f39a0f3f486358', 20, 1, '2024-05-20 23:52:51');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD CONSTRAINT `fk_Fabricante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD CONSTRAINT `fk_Representante_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`),
  ADD CONSTRAINT `fk_Representante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_Itens_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`),
  ADD CONSTRAINT `fk_Itens_Produto1` FOREIGN KEY (`Equip_CodRefEquip`) REFERENCES `maq` (`CodRefEquip`),
  ADD CONSTRAINT `fk_Itens_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `maq`
--
ALTER TABLE `maq`
  ADD CONSTRAINT `fk_Produto_Usuario` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
