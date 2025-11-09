DROP SCHEMA IF EXISTS ECOMMERCE;
CREATE SCHEMA ECOMMERCE;
USE ECOMMERCE;
CREATE TABLE clientes(
id_clientes INT PRIMARY KEY auto_increment,
nome_clientes VARCHAR(60) NOT NULL,
cpf_clientes VARCHAR(14) NOT NULL,
telefone_clientes VARCHAR (15) NOT NULL,
email_clientes VARCHAR(50) NOT NULL,
dataNascimento DATE NOT NULL,
limiteCredito DECIMAL(10,2)
);
Alter TABLE clientes ADD COLUMN fkEndereco INT NOT NULL;
ALTER TABLE clientes MODIFY COLUMN limiteCredito DECIMAL(10,2) NOT NULL;
ALTER TABLE clientes DROP COLUMN limiteCredito;
DESCRIBE clientes;
ALTER TABLE CLIENTES ADD CONSTRAINT FK_END
FOREIGN KEY (fkendereco) REFERENCES enderecos(id_endereco);

CREATE TABLE ENDERECOS(
id_enderecos INT PRIMARY KEY auto_increment,
logradouro VARCHAR(255) NOT NULL,
numero INT NOT NULL,
bairro VARCHAR(20) NOT NULL,
cep BIGINT NOT NULL,
complemnto VARCHAR(35),
cidade VARCHAR(30) NOT NULL,
estado VARCHAR (255) NOT NULL
);
CREATE TABLE PRODUTOS (
id_produtos INT PRIMARY KEY auto_increment,
nome_produtos VARCHAR(45) NOT NULL,
codigo_produtos VARCHAR(12) NOT NULL,
quantidade_produtos INT NOT NULL
);
DROP TABLE PRODUTOS;

INSERT INTO ENDERECOS(logradouro,numero,bairro,cep,complemnto,cidade,estado)
VALUES
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais'),
('Rua das Flores', 12, 'centro','123123123','perto da igreja','Belo Horizonte','Minas Gerais');

INSERT INTO CLIENTES (nome_clientes,cpf_clientes,telefone_clientes,email_clientes,dataNascimento,fkEndereco)
VALUES('Joao Silva','123.123.123.99','(31)98796-0061','JS@MAIL.COM','2025-09-26',1);

UPDATE enderecos SET numero = 1 WHERE id_enderecos = 1;
UPDATE enderecos SET numero = 2, bairro = 'caicara' WHERE id_enderecos = 2;

DELETE FROM clientes WHERE id_clientes = 1;

TRUNCATE CLIENTES;
