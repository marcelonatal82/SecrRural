-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 23/03/2024 às 18:05
-- Versão do servidor: 8.0.33
-- Versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `carcessionaria`
--
CREATE DATABASE IF NOT EXISTS `carcessionaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `carcessionaria`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `id_veiculo` int NOT NULL,
  `quantidade_estoque` int NOT NULL,
  KEY `fk_id_veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id_veiculo`, `quantidade_estoque`) VALUES
(1, 49),
(2, 15),
(3, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
CREATE TABLE IF NOT EXISTS `veiculos` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `cor` varchar(25) NOT NULL,
  `ano` int NOT NULL,
  `marca` varchar(20) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `veiculos`
--

INSERT INTO `veiculos` (`id_veiculo`, `cor`, `ano`, `marca`, `valor`) VALUES
(1, 'ROSA', 2008, 'FIAT	', 10000),
(2, 'VERMELHA', 2010, 'COROLA', 25000),
(3, 'verde', 2019, 'FIAT', 56000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_veiculo_venda` int NOT NULL,
  `nome_comprador` varchar(50) NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `fk_id_veiculo_venda` (`id_veiculo_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id_venda`, `id_veiculo_venda`, `nome_comprador`, `quantidade`) VALUES
(1, 1, 'marcelo', 1);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_id_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id_veiculo`);

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_id_veiculo_venda` FOREIGN KEY (`id_veiculo_venda`) REFERENCES `veiculos` (`id_veiculo`);
--
-- Banco de dados: `controlestoque`
--
CREATE DATABASE IF NOT EXISTS `controlestoque` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci;
USE `controlestoque`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `NomeCliente`, `EmailCliente`, `cpfCliente`, `statusCliente`, `Usuario_idUsuario`, `dataRegCliente`, `sexo`, `naturalidade`, `data_nascimento`, `nacionalidade`, `estado_civil`, `nome_mae`) VALUES
(1, 'FabrÃ­cio PaixÃ£o', 'fabriciopaixao@teste.com', '99999999910', 1, 2, '2019-02-21 21:27:11', '', '', '', '', '', ''),
(2, 'Thiago Ribeiro', 'thiago@teste.com', '88888888820', 1, 2, '2019-02-21 21:28:57', '', '', '', '', '', ''),
(3, 'Antonio', 'teste2@teste.com', '12345678910', 1, 2, '2019-02-28 20:23:18', '', '', '', '', '', ''),
(4, 'Francisco', 'teste2@teste.com', '88888888889', 1, 2, '2019-03-01 19:33:37', '', '', '', '', '', ''),
(5, 'Carlos', 'fabricio@gmail.com', '99999999999', 1, 1, '2019-03-01 19:42:30', '', '', '', '', '', ''),
(6, 'Matheus', 'fabricio@gmail.com', '99999999998', 1, 1, '2019-03-01 19:46:54', '', '', '', '', '', ''),
(7, 'Thiago augusto santos ', 'augustosantos@teste.com', '11119999119', 1, 2, '2019-03-20 21:45:01', '', '', '', '', '', ''),
(8, 'Wesley Silva', 'teste4@teste.com', '33344455567', 1, 2, '2019-03-25 21:00:06', 'masculino', 'goias', '29/08/1983', 'brasileiro', 'casado', 'maria l a nata'),
(9, 'tste', 'teste@teste.com.br', '123456789', 1, 3, '2024-03-09 23:26:51', 'masc', 'brasileiro', '01012005', 'brasileiro', 'casado', 'lazara');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equip`
--

DROP TABLE IF EXISTS `equip`;
CREATE TABLE IF NOT EXISTS `equip` (
  `CodRefEquip` int NOT NULL AUTO_INCREMENT,
  `NomeEquip` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Ativo` int NOT NULL,
  `PublicEquip` int NOT NULL,
  `Usuario_idUser` int NOT NULL,
  PRIMARY KEY (`CodRefEquip`),
  KEY `fk_Produto_Usuario_idx` (`Usuario_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `equip`
--

INSERT INTO `equip` (`CodRefEquip`, `NomeEquip`, `Ativo`, `PublicEquip`, `Usuario_idUser`) VALUES
(1, 'CAM TRUQUE', 1, 1, 3),
(2, 'PA-CARREG', 1, 1, 3),
(3, 'CAM CAÇAMBA', 1, 1, 3),
(4, 'Pulverizadores', 1, 1, 1),
(5, 'Semeadoras', 1, 1, 1),
(6, 'Arados', 1, 1, 1),
(7, 'Trator de traç simpl', 1, 1, 3),
(8, 'trator de esteira', 1, 1, 3),
(9, 'trator esteira', 1, 1, 3),
(10, 'ddddd', 1, 1, 3),
(11, 'ddd', 1, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fabricante`
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `fabricante`
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
(10, 'Spal Industria Brasileira de Bebidas', '61186888000193', 'N/S', 'Avenida Francisco Ferreira Lopes - 4303', '08000212121', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`idItens`, `Image`, `QuantItens`, `QuantItensVend`, `ValCompItens`, `ValVendItens`, `DataCompraItens`, `DataVenci_Itens`, `ItensAtivo`, `ItensPublic`, `Equip_CodRefEquip`, `Fabricante_idFabricante`, `Usuario_idUser`, `DataRegistro`) VALUES
(11, '', '500', '372', '1700.00', '2100.00', '2018-10-27', '2018-10-31', 1, 1, 5, 1, 2, '2018-10-27 20:38:39'),
(12, '', '200', '166', '3.00', '9.00', '2018-10-27', '2018-10-31', 1, 1, 3, 1, 2, '2018-10-27 20:43:12'),
(13, '', '100', '32', '4.00', '9.50', '2019-09-17', '2019-09-17', 1, 1, 3, 1, 2, '2019-09-17 21:07:25'),
(14, '', '200', '8', '2100.00', '3900.00', '2019-09-17', '2019-09-17', 1, 1, 4, 7, 2, '2019-09-17 21:21:40'),
(15, '', '1000', '11', '0.30', '1.00', '2019-09-17', '2020-09-17', 1, 1, 6, 4, 2, '2019-09-17 21:29:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtor`
--

DROP TABLE IF EXISTS `produtor`;
CREATE TABLE IF NOT EXISTS `produtor` (
  `idProdutor` int NOT NULL AUTO_INCREMENT,
  `NomeProdutor` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TelefoneProdutor` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EmailProdutor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `repAtivo` int NOT NULL,
  `repPublic` int NOT NULL,
  `Fabricante_idFabricante` int NOT NULL,
  `Usuario_idUser` int NOT NULL,
  PRIMARY KEY (`idProdutor`),
  KEY `fk_Representante_Fabricante1_idx` (`Fabricante_idFabricante`),
  KEY `fk_Representante_Usuario1_idx` (`Usuario_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `produtor`
--

INSERT INTO `produtor` (`idProdutor`, `NomeProdutor`, `TelefoneProdutor`, `EmailProdutor`, `repAtivo`, `repPublic`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES
(1, 'Francisco Algusto', '11 9999-9999', 'franciscoalgusto@ibm.com', 1, 1, 1, 1),
(2, 'FabrÃ­cio PaixÃ£o ', '31 98888-8888', 'fabriciotp@ibm.com', 1, 1, 1, 1),
(3, 'Marcos Rafael', '43434343', 'marcosrafael@intel.com', 1, 1, 2, 1),
(4, 'Antonio Carlos ', '31988848780', 'antoniocarlos@dell.com', 0, 0, 3, 1),
(5, 'Distrioeste - Distribuidora e atacadista', '49 3331-3122', 'nadir@distribuidoradistrioeste.com.br', 1, 1, 4, 1),
(6, 'Thiago Rui', '55555555555', 'thiagorui@lenovo.com', 1, 1, 6, 1),
(7, 'Thiago', '33333444', 'thiago@microsoft.com', 1, 1, 7, 1),
(8, 'Thiago 2', '33333444', 'thiago2@microsoft.com', 1, 1, 8, 1),
(9, 'Thiago 22', '1000000', 'thiago@chevrolet.com', 1, 1, 9, 1),
(10, 'Spal Industria Brasileira de Bebidas', '08000212121', 'N/S', 1, 1, 10, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `Username`, `Email`, `Password`, `imagem`, `Dataregistro`, `Permissao`) VALUES
(1, 'admin', 'admin@estoque.com', '21232f297a57a5a743894a0e4a801fc3', 'dist/img/fabriciopaixao.jpg', '2017-04-03', 1),
(2, 'vendedor', 'vendedor@estoque.com', '21232f297a57a5a743894a0e4a801fc3', 'dist/img/fabriciopaixao.jpg', '2017-04-03', 2),
(3, 'Marcelo ', 'alves@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', './dist/img/1634946064804.jfif', '2023-08-22', 1),
(5, 'teste', 'teste@test.com', 'e10adc3949ba59abbe56e057f20f883e', 'dist/img/avatar.png', '2024-02-26', 2),
(7, 'natal', 'teste1@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', './dist/img/EDDDD.png', '2024-03-06', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `vendas`
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
(91, 1, '2100.00', 11, '055e6b42f4acd384dc304d6b87eaec6e', 1, 1, '2019-11-14 20:38:25');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `equip`
--
ALTER TABLE `equip`
  ADD CONSTRAINT `fk_Produto_Usuario` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);

--
-- Restrições para tabelas `fabricante`
--
ALTER TABLE `fabricante`
  ADD CONSTRAINT `fk_Fabricante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);

--
-- Restrições para tabelas `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_Itens_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`),
  ADD CONSTRAINT `fk_Itens_Produto1` FOREIGN KEY (`Equip_CodRefEquip`) REFERENCES `equip` (`CodRefEquip`),
  ADD CONSTRAINT `fk_Itens_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);

--
-- Restrições para tabelas `produtor`
--
ALTER TABLE `produtor`
  ADD CONSTRAINT `fk_Representante_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`),
  ADD CONSTRAINT `fk_Representante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`);
--
-- Banco de dados: `db_estoque_laravel`
--
CREATE DATABASE IF NOT EXISTS `db_estoque_laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_estoque_laravel`;
--
-- Banco de dados: `desenv_rural`
--
CREATE DATABASE IF NOT EXISTS `desenv_rural` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `desenv_rural`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

DROP TABLE IF EXISTS `cidade`;
CREATE TABLE IF NOT EXISTS `cidade` (
  `idcidade` int NOT NULL,
  `cidade_nome` varchar(45) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dados_demograficos`
--

DROP TABLE IF EXISTS `dados_demograficos`;
CREATE TABLE IF NOT EXISTS `dados_demograficos` (
  `id_dados_demograficos` int NOT NULL,
  `demo_grau_escolaridade` varchar(45) DEFAULT NULL,
  `demo_qtd_filhos` varchar(45) DEFAULT NULL,
  `demo_acesso_internet` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_dados_demograficos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `daps`
--

DROP TABLE IF EXISTS `daps`;
CREATE TABLE IF NOT EXISTS `daps` (
  `id_daps` int NOT NULL,
  `numero_daps` int DEFAULT NULL,
  `status_daps` varchar(45) DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `status_fundiario` varchar(45) DEFAULT NULL,
  `grupo_familiar` varchar(45) DEFAULT NULL,
  `produtor_idprodutor` int NOT NULL,
  PRIMARY KEY (`id_daps`),
  KEY `fk_daps_produtor1_idx` (`produtor_idprodutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamentos`
--

DROP TABLE IF EXISTS `equipamentos`;
CREATE TABLE IF NOT EXISTS `equipamentos` (
  `id_equipamento` int NOT NULL,
  `cod_equipamento` varchar(45) DEFAULT NULL,
  `nome_equipamento` varchar(45) DEFAULT NULL,
  `descricao_equipamento` varchar(45) DEFAULT NULL,
  `solicitacao_equipamentos_id_solicitacao_equipamentos` int NOT NULL,
  PRIMARY KEY (`id_equipamento`),
  KEY `fk_equipamentos_solicitacao_equipamentos1_idx` (`solicitacao_equipamentos_id_solicitacao_equipamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinarios`
--

DROP TABLE IF EXISTS `maquinarios`;
CREATE TABLE IF NOT EXISTS `maquinarios` (
  `Cod_maquinario` int NOT NULL,
  `PublicMaquinario` int DEFAULT NULL,
  `Descricao_maquinario` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `solicitacao_maquinarios_id_solicitacao_maquinarios` int NOT NULL,
  `Nomemaquinario` int NOT NULL,
  `Usuario_idUser` int NOT NULL,
  PRIMARY KEY (`Cod_maquinario`),
  KEY `fk_maquinarios_solicitacao_maquinarios1_idx` (`solicitacao_maquinarios_id_solicitacao_maquinarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `producao_animal`
--

DROP TABLE IF EXISTS `producao_animal`;
CREATE TABLE IF NOT EXISTS `producao_animal` (
  `idproducao_animal` int NOT NULL,
  `tipo_cultura` varchar(45) DEFAULT NULL,
  `producao_mensal` int DEFAULT NULL,
  `qtd_comercializada_mensal` int DEFAULT NULL,
  `tipo_complementacao_alimentar` varchar(45) DEFAULT NULL,
  `recur_compl_alimentar` varchar(45) DEFAULT NULL,
  `tipo_de_producao` varchar(45) DEFAULT NULL,
  `produtor_idprodutor` int NOT NULL,
  PRIMARY KEY (`idproducao_animal`,`produtor_idprodutor`),
  KEY `fk_producao_animal_produtor1_idx` (`produtor_idprodutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtor`
--

DROP TABLE IF EXISTS `produtor`;
CREATE TABLE IF NOT EXISTS `produtor` (
  `idprodutor` int NOT NULL,
  `cpfProdutor` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nomeProdutor` int DEFAULT NULL,
  `sexoProdutor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `naturalidadeProdutor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado_civilProdutor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nome_maeProdutor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `emailProdutor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nacionalidadeProdutor` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_nascimentoProdutor` date NOT NULL,
  `produtor_idprodutor` int NOT NULL,
  `dados_demograficosProdutor` int NOT NULL,
  `propriedade_rural_id_propriedade_rural` int NOT NULL,
  PRIMARY KEY (`idprodutor`,`propriedade_rural_id_propriedade_rural`),
  KEY `fk_produtor_produtor_idx` (`produtor_idprodutor`),
  KEY `fk_produtor_dados_demograficos1_idx` (`dados_demograficosProdutor`),
  KEY `fk_produtor_propriedade_rural1_idx` (`propriedade_rural_id_propriedade_rural`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtor_doc`
--

DROP TABLE IF EXISTS `produtor_doc`;
CREATE TABLE IF NOT EXISTS `produtor_doc` (
  `idprodutor_doc` int NOT NULL,
  `prod_rg` int DEFAULT NULL,
  `prod_orgao_emissor` varchar(45) DEFAULT NULL,
  `prod_estado_emissor` varchar(15) DEFAULT NULL,
  `prod_data_emissao` date NOT NULL,
  `produtor_idprodutor` int NOT NULL,
  PRIMARY KEY (`idprodutor_doc`),
  KEY `fk_produtor_doc_produtor1_idx` (`produtor_idprodutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtor_endereco`
--

DROP TABLE IF EXISTS `produtor_endereco`;
CREATE TABLE IF NOT EXISTS `produtor_endereco` (
  `id_prod_endereco` int NOT NULL,
  `prod_logradouro` varchar(45) DEFAULT NULL,
  `prod_numero` varchar(45) DEFAULT NULL,
  `prod_complemento` varchar(45) DEFAULT NULL,
  `prod_bairro` varchar(45) DEFAULT NULL,
  `cep` int DEFAULT NULL,
  `produtor_idprodutor` int NOT NULL,
  PRIMARY KEY (`id_prod_endereco`),
  KEY `fk_produtor_endereco_produtor1_idx` (`produtor_idprodutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtor_endereco_has_cidade`
--

DROP TABLE IF EXISTS `produtor_endereco_has_cidade`;
CREATE TABLE IF NOT EXISTS `produtor_endereco_has_cidade` (
  `produtor_endereco_id_prod_endereco` int NOT NULL,
  `cidade_idcidade` int NOT NULL,
  PRIMARY KEY (`produtor_endereco_id_prod_endereco`,`cidade_idcidade`),
  KEY `fk_produtor_endereco_has_cidade_cidade1_idx` (`cidade_idcidade`),
  KEY `fk_produtor_endereco_has_cidade_produtor_endereco1_idx` (`produtor_endereco_id_prod_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `propriedade_endereco`
--

DROP TABLE IF EXISTS `propriedade_endereco`;
CREATE TABLE IF NOT EXISTS `propriedade_endereco` (
  `id_propriedade_endereco` int NOT NULL,
  `endereco_prop` varchar(45) DEFAULT NULL,
  `cidade_idcidade` int NOT NULL,
  `propriedade_rural_id_propriedade_rural` int NOT NULL,
  PRIMARY KEY (`id_propriedade_endereco`,`cidade_idcidade`),
  KEY `fk_propriedade_endereco_cidade1_idx` (`cidade_idcidade`),
  KEY `fk_propriedade_endereco_propriedade_rural1_idx` (`propriedade_rural_id_propriedade_rural`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `propriedade_rural`
--

DROP TABLE IF EXISTS `propriedade_rural`;
CREATE TABLE IF NOT EXISTS `propriedade_rural` (
  `id_propriedade_rural` int NOT NULL,
  `nome_prop` varchar(45) DEFAULT NULL,
  `area_total` int DEFAULT NULL,
  `inscricao_estadual` int DEFAULT NULL,
  PRIMARY KEY (`id_propriedade_rural`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `renda_familiar`
--

DROP TABLE IF EXISTS `renda_familiar`;
CREATE TABLE IF NOT EXISTS `renda_familiar` (
  `id_renda_familiar` int NOT NULL,
  `renda_mensal` double DEFAULT NULL,
  `fonte_renda` varchar(45) DEFAULT NULL,
  `produtor_idprodutor` int NOT NULL,
  KEY `fk_renda_familiar_produtor1_idx` (`produtor_idprodutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

DROP TABLE IF EXISTS `servicos`;
CREATE TABLE IF NOT EXISTS `servicos` (
  `id_servicos` int NOT NULL,
  `cod_servico` int DEFAULT NULL,
  `solicitacao_servico_id_solicitacao_servico` int NOT NULL,
  PRIMARY KEY (`id_servicos`),
  KEY `fk_servicos_solicitacao_servico1_idx` (`solicitacao_servico_id_solicitacao_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
CREATE TABLE IF NOT EXISTS `solicitacao` (
  `id_solicitacao` int NOT NULL,
  `descricao_servico` varchar(45) DEFAULT NULL,
  `data_solicitacao` date DEFAULT NULL,
  `hora_solicitacao` time DEFAULT NULL,
  `despacho` varchar(45) DEFAULT NULL,
  `data_prevista_devolucao` date DEFAULT NULL,
  `produtor_idprodutor` int NOT NULL,
  `propriedade_rural_id_propriedade_rural` int NOT NULL,
  `solicitacao_maquinarios_id_solicitacao_maquinarios` int NOT NULL,
  `solicitacao_equipamentos_id_solicitacao_equipamentos` int NOT NULL,
  `solicitacao_servico_id_solicitacao_servico` int NOT NULL,
  PRIMARY KEY (`id_solicitacao`,`produtor_idprodutor`),
  KEY `fk_solicitacao_produtor1_idx` (`produtor_idprodutor`),
  KEY `fk_solicitacao_propriedade_rural1_idx` (`propriedade_rural_id_propriedade_rural`),
  KEY `fk_solicitacao_solicitacao_maquinarios1_idx` (`solicitacao_maquinarios_id_solicitacao_maquinarios`),
  KEY `fk_solicitacao_solicitacao_equipamentos1_idx` (`solicitacao_equipamentos_id_solicitacao_equipamentos`),
  KEY `fk_solicitacao_solicitacao_servico1_idx` (`solicitacao_servico_id_solicitacao_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao_equipamentos`
--

DROP TABLE IF EXISTS `solicitacao_equipamentos`;
CREATE TABLE IF NOT EXISTS `solicitacao_equipamentos` (
  `id_solicitacao_equipamentos` int NOT NULL,
  PRIMARY KEY (`id_solicitacao_equipamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao_maquinarios`
--

DROP TABLE IF EXISTS `solicitacao_maquinarios`;
CREATE TABLE IF NOT EXISTS `solicitacao_maquinarios` (
  `id_solicitacao_maquinarios` int NOT NULL,
  PRIMARY KEY (`id_solicitacao_maquinarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao_servico`
--

DROP TABLE IF EXISTS `solicitacao_servico`;
CREATE TABLE IF NOT EXISTS `solicitacao_servico` (
  `id_solicitacao_servico` int NOT NULL,
  PRIMARY KEY (`id_solicitacao_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

DROP TABLE IF EXISTS `telefone`;
CREATE TABLE IF NOT EXISTS `telefone` (
  `id_telefone` int NOT NULL,
  `tel_ ddd` int DEFAULT NULL,
  `tel_numero` int DEFAULT NULL,
  `produtor_idprodutor` int NOT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `fk_telefone_produtor1_idx` (`produtor_idprodutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `Username`, `Email`, `Password`, `imagem`, `Dataregistro`, `Permissao`) VALUES
(1, 'admin', 'admin@estoque.com', '21232f297a57a5a743894a0e4a801fc3', 'dist/img/fabriciopaixao.jpg', '2017-04-03', 1),
(2, 'vendedor', 'vendedor@estoque.com', '21232f297a57a5a743894a0e4a801fc3', 'dist/img/fabriciopaixao.jpg', '2017-04-03', 2);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `daps`
--
ALTER TABLE `daps`
  ADD CONSTRAINT `fk_daps_produtor1` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`);

--
-- Restrições para tabelas `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD CONSTRAINT `fk_equipamentos_solicitacao_equipamentos1` FOREIGN KEY (`solicitacao_equipamentos_id_solicitacao_equipamentos`) REFERENCES `solicitacao_equipamentos` (`id_solicitacao_equipamentos`);

--
-- Restrições para tabelas `maquinarios`
--
ALTER TABLE `maquinarios`
  ADD CONSTRAINT `fk_maquinarios_solicitacao_maquinarios1` FOREIGN KEY (`solicitacao_maquinarios_id_solicitacao_maquinarios`) REFERENCES `solicitacao_maquinarios` (`id_solicitacao_maquinarios`);

--
-- Restrições para tabelas `producao_animal`
--
ALTER TABLE `producao_animal`
  ADD CONSTRAINT `fk_producao_animal_produtor1` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`);

--
-- Restrições para tabelas `produtor`
--
ALTER TABLE `produtor`
  ADD CONSTRAINT `fk_produtor_dados_demograficos1` FOREIGN KEY (`dados_demograficosProdutor`) REFERENCES `dados_demograficos` (`id_dados_demograficos`),
  ADD CONSTRAINT `fk_produtor_produtor` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`),
  ADD CONSTRAINT `fk_produtor_propriedade_rural1` FOREIGN KEY (`propriedade_rural_id_propriedade_rural`) REFERENCES `propriedade_rural` (`id_propriedade_rural`);

--
-- Restrições para tabelas `produtor_doc`
--
ALTER TABLE `produtor_doc`
  ADD CONSTRAINT `fk_produtor_doc_produtor1` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`);

--
-- Restrições para tabelas `produtor_endereco`
--
ALTER TABLE `produtor_endereco`
  ADD CONSTRAINT `fk_produtor_endereco_produtor1` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`);

--
-- Restrições para tabelas `produtor_endereco_has_cidade`
--
ALTER TABLE `produtor_endereco_has_cidade`
  ADD CONSTRAINT `fk_produtor_endereco_has_cidade_cidade1` FOREIGN KEY (`cidade_idcidade`) REFERENCES `cidade` (`idcidade`),
  ADD CONSTRAINT `fk_produtor_endereco_has_cidade_produtor_endereco1` FOREIGN KEY (`produtor_endereco_id_prod_endereco`) REFERENCES `produtor_endereco` (`id_prod_endereco`);

--
-- Restrições para tabelas `propriedade_endereco`
--
ALTER TABLE `propriedade_endereco`
  ADD CONSTRAINT `fk_propriedade_endereco_cidade1` FOREIGN KEY (`cidade_idcidade`) REFERENCES `cidade` (`idcidade`),
  ADD CONSTRAINT `fk_propriedade_endereco_propriedade_rural1` FOREIGN KEY (`propriedade_rural_id_propriedade_rural`) REFERENCES `propriedade_rural` (`id_propriedade_rural`);

--
-- Restrições para tabelas `renda_familiar`
--
ALTER TABLE `renda_familiar`
  ADD CONSTRAINT `fk_renda_familiar_produtor1` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`);

--
-- Restrições para tabelas `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `fk_servicos_solicitacao_servico1` FOREIGN KEY (`solicitacao_servico_id_solicitacao_servico`) REFERENCES `solicitacao_servico` (`id_solicitacao_servico`);

--
-- Restrições para tabelas `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD CONSTRAINT `fk_solicitacao_produtor1` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`),
  ADD CONSTRAINT `fk_solicitacao_propriedade_rural1` FOREIGN KEY (`propriedade_rural_id_propriedade_rural`) REFERENCES `propriedade_rural` (`id_propriedade_rural`),
  ADD CONSTRAINT `fk_solicitacao_solicitacao_equipamentos1` FOREIGN KEY (`solicitacao_equipamentos_id_solicitacao_equipamentos`) REFERENCES `solicitacao_equipamentos` (`id_solicitacao_equipamentos`),
  ADD CONSTRAINT `fk_solicitacao_solicitacao_maquinarios1` FOREIGN KEY (`solicitacao_maquinarios_id_solicitacao_maquinarios`) REFERENCES `solicitacao_maquinarios` (`id_solicitacao_maquinarios`),
  ADD CONSTRAINT `fk_solicitacao_solicitacao_servico1` FOREIGN KEY (`solicitacao_servico_id_solicitacao_servico`) REFERENCES `solicitacao_servico` (`id_solicitacao_servico`);

--
-- Restrições para tabelas `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_telefone_produtor1` FOREIGN KEY (`produtor_idprodutor`) REFERENCES `produtor` (`idprodutor`);
--
-- Banco de dados: `laravel`
--
CREATE DATABASE IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `laravel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_20_231757_create_produtos_table', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Banco de dados: `pi_iii`
--
CREATE DATABASE IF NOT EXISTS `pi_iii` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `pi_iii`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `valor`) VALUES
(1, 'MARCELO	', 456),
(2, 'ALEXANDRE MIGUEL 	', 100),
(3, 'NOVO', 111),
(4, 'TESTE', 569),
(5, 'JO	', 256),
(6, 'TESTE', 58),
(7, 'TESTE', 458),
(8, 'KMK', 125);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto1`
--

DROP TABLE IF EXISTS `produto1`;
CREATE TABLE IF NOT EXISTS `produto1` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `strValor` varchar(10) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `produto1`
--

INSERT INTO `produto1` (`id`, `nome`, `strValor`, `valor`) VALUES
(1, 'ATHUR ', NULL, 256.00),
(2, 'ALEXANDRE', NULL, 567.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
