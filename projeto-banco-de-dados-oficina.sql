-- Criação do banco de dados
DROP DATABASE IF EXISTS oficina;
CREATE DATABASE oficina;
USE oficina;  -- Seleciona o banco de dados para uso

-- Criação das tabelas
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45),
    Telefone VARCHAR(45)
);

CREATE TABLE veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45),
    Marca VARCHAR(45),
    ano DATE,
    Cliente_idCliente INT NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES cliente (idCliente)
);

CREATE TABLE mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Especialidade VARCHAR(45)
);

CREATE TABLE equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    Mecanicos VARCHAR(45)
);

CREATE TABLE servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45),
    valor_mao_de_obra DECIMAL(10, 2)
);

CREATE TABLE peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    valor_unitario DECIMAL(10, 2)
);

CREATE TABLE ordem_de_servico (
    idOrdemDeServico INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(45),
    Data_Conclusao DATE,
    Cliente_idCliente INT NOT NULL,
    Veiculo_idVeiculo INT NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES cliente (idCliente),
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES veiculo (idVeiculo)
);

CREATE TABLE itens_da_os (
    OrdemDeServico_idOrdemDeServico INT NOT NULL,
    Peca_idPeca INT NOT NULL,
    quantidade INT,
    especialidade VARCHAR(45),
    PRIMARY KEY (OrdemDeServico_idOrdemDeServico, Peca_idPeca),
    FOREIGN KEY (OrdemDeServico_idOrdemDeServico) REFERENCES ordem_de_servico (idOrdemDeServico),
    FOREIGN KEY (Peca_idPeca) REFERENCES peca (idPeca)
);

CREATE TABLE servico_has_ordem_de_servico (
    Servico_idServico INT NOT NULL,
    OrdemDeServico_idOrdemDeServico INT NOT NULL,
    OrdemDeServico_Cliente_idCliente INT NOT NULL,
    PRIMARY KEY (Servico_idServico, OrdemDeServico_idOrdemDeServico, OrdemDeServico_Cliente_idCliente),
    FOREIGN KEY (Servico_idServico) REFERENCES servico (idServico),
    FOREIGN KEY (OrdemDeServico_idOrdemDeServico) REFERENCES ordem_de_servico (idOrdemDeServico),
    FOREIGN KEY (OrdemDeServico_Cliente_idCliente) REFERENCES cliente (idCliente)
);

CREATE TABLE mecanico_has_ordem_de_servico (
    Mecanico_idMecanico INT NOT NULL,
    OrdemDeServico_idOrdemDeServico INT NOT NULL,
    PRIMARY KEY (Mecanico_idMecanico, OrdemDeServico_idOrdemDeServico),
    FOREIGN KEY (Mecanico_idMecanico) REFERENCES mecanico (idMecanico),
    FOREIGN KEY (OrdemDeServico_idOrdemDeServico) REFERENCES ordem_de_servico (idOrdemDeServico)
);

CREATE TABLE equipe_has_ordem_de_servico (
    Equipe_idEquipe INT NOT NULL,
    OrdemDeServico_idOrdemDeServico INT NOT NULL,
    PRIMARY KEY (Equipe_idEquipe, OrdemDeServico_idOrdemDeServico),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES equipe (idEquipe),
    FOREIGN KEY (OrdemDeServico_idOrdemDeServico) REFERENCES ordem_de_servico (idOrdemDeServico)
);
  
  
