-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/11/2024 às 00:23
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `faculdade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aulas`
--

CREATE TABLE `aulas` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `turno` enum('manhã','tarde','noite') NOT NULL,
  `curso` enum('administracao','analise_e_desenvolvimento_de_sistemas','arquitetura','biomedicina','ciencias_contabeis','direito','educacao_fisica_bacharelado','educacao_fisica_licenciatura','enfermagem','engenharia_civil','estetica_cosmetica','farmacia','fisioterapia','gestao_recursos_humanos','medicina_veterinaria','nutricao','odontologia','psicologia') NOT NULL,
  `disciplina` varchar(100) NOT NULL,
  `safra` enum('calouro','veterano') NOT NULL,
  `modalidade` enum('presencial','semi_presencial','ead','flex') NOT NULL,
  `professor` varchar(100) NOT NULL,
  `sala` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aulas`
--

INSERT INTO `aulas` (`id`, `data`, `turno`, `curso`, `disciplina`, `safra`, `modalidade`, `professor`, `sala`) VALUES
(47, '2024-11-21', 'manhã', 'administracao', '1', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(49, '2024-11-21', 'manhã', 'arquitetura', '3', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(51, '2024-11-21', 'manhã', 'biomedicina', '4', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(52, '2024-11-21', 'manhã', 'ciencias_contabeis', '5', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(53, '2024-11-21', 'manhã', 'direito', '6', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(54, '2024-11-21', 'manhã', 'educacao_fisica_bacharelado', '7', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(55, '2024-11-21', 'manhã', 'educacao_fisica_licenciatura', '8', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(56, '2024-11-21', 'manhã', 'enfermagem', '9', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(57, '2024-11-21', 'manhã', 'engenharia_civil', '10', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(58, '2024-11-21', 'manhã', 'estetica_cosmetica', '11', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(59, '2024-11-21', 'manhã', 'farmacia', '12', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(60, '2024-11-21', 'manhã', 'fisioterapia', '13', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(61, '2024-11-21', 'manhã', 'gestao_recursos_humanos', '14', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(62, '2024-11-21', 'manhã', 'medicina_veterinaria', '15', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(63, '2024-11-21', 'manhã', 'nutricao', '16', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(64, '2024-11-21', 'manhã', 'odontologia', '17', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(65, '2024-11-21', 'manhã', 'psicologia', '18', 'calouro', 'presencial', 'Enilda', 'Sala B303 / 3º andar'),
(67, '2024-11-21', 'manhã', 'analise_e_desenvolvimento_de_sistemas', 'teste 2', 'calouro', 'presencial', 'Enilda', 'Lab Infor 7'),
(68, '2024-11-21', 'manhã', 'administracao', 'teste 2', 'calouro', 'semi_presencial', 'Enilda', 'Lab Infor 7');

-- --------------------------------------------------------

--
-- Estrutura para tabela `propagandas`
--

CREATE TABLE `propagandas` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `propagandas`
--

INSERT INTO `propagandas` (`id`, `nome`, `imagem`, `created_at`) VALUES
(1, 'Lucas Dias Alves', '673e57f9e48d8.png', '2024-11-20 21:43:21'),
(2, 'Lucas Dias Alves', '673e61119c321.png', '2024-11-20 22:22:09'),
(3, 'Lucas Dias Alves', '673e65fa60aa5.png', '2024-11-20 22:43:06'),
(4, 'Lucas Dias Alves', '673e67fac113f.png', '2024-11-20 22:51:38'),
(5, 'Lucas Dias Alves', '673e6802b5823.png', '2024-11-20 22:51:46'),
(6, 'teste', '673e680e4e738.png', '2024-11-20 22:51:58'),
(7, 'teste', '673e682465bd0.png', '2024-11-20 22:52:20'),
(8, 'teste44', '673e6a74887b2.png', '2024-11-20 23:02:12'),
(9, 'teste3', '673e6ec1315b4.png', '2024-11-20 23:20:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `matricula` int(20) NOT NULL,
  `senha` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `matricula`, `senha`) VALUES
(9, 'Lucas Dias Alves', 'lucasdias2884@gmail.com', 12345, '$2y$10$1uKOOqvlx2gzqbz7IRKg0Oec8/2cJaK6U9aYxpWIz.sJkKzIoQ.EO'),
(17, 'teste', 'teste@gmail.com', 123, '$2y$10$QpVOtvk1O/nUXZjuCnJBxesYBM7qJ7UYMpJjgByGTIj6frC6HLtUe'),
(20, 'teste2', 'teste2@gmail.com', 2, '$2y$10$9/4APFGc2DtVN6Z9oInXyuw.aBOpWUxbxOh8xYGDPHj9C/00GgaT6'),
(21, 'teste3', 'teste3@gmail.com', 3, '$2y$10$tUTPxW/4gCCKTh40GRkVKeoZFx3t9BJrNXrlzF9x6iDecD6PQezBe'),
(22, 'teste44', 'teste44@gmail.com', 4, '$2y$10$R.b8Mfn1AlI/YGsP9R3l0uxjBXw6yDW4ebUnRhjwNsjkq.gjZ3oh6');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `propagandas`
--
ALTER TABLE `propagandas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `propagandas`
--
ALTER TABLE `propagandas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
