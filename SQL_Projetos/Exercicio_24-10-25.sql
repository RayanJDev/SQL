CREATE SCHEMA VendaPacotes;
use VendaPacotes;
CREATE TABLE voos(
idvoo INTEGER PRIMARY KEY auto_increment,
companhia VARCHAR(100) NOT NULL,
codvoo char(7),
embarque datetime ,
desembarque datetime ,
poltrona char(3),
idvenda int
);

CREATE TABLE clientes(
idcliente INTEGER PRIMARY KEY auto_increment,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(15) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(2) NOT NULL,
pais VARCHAR(50) NOT NULL
);

CREATE TABLE hoteis(
idhotel INTEGER PRIMARY KEY auto_increment,
nome VARCHAR(100) NOT NULL,
checkin datetime,
checkout datetime,
diarias int(2),
quarto int(3),
idvenda int
);

CREATE TABLE destinos(
iddestino INTEGER PRIMARY KEY auto_increment,
descricao VARCHAR(100) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL
);

CREATE TABLE passeios(
idpasseio INTEGER PRIMARY KEY auto_increment,
descricao VARCHAR(100) NOT NULL,
saida datetime,
chegada datetime,
observacoes text,
idvenda int
);

CREATE TABLE vendas (
    idvenda int PRIMARY KEY auto_increment,
    idcliente int,
    iddestino int,
    idpagamento int
);

CREATE TABLE pagamentos (
    idpagamento int PRIMARY KEY auto_increment,
    valorTotal float,
    tipo varchar(50)
);

ALTER TABLE vendas ADD CONSTRAINT FK_cliente
    FOREIGN KEY (idcliente)REFERENCES clientes (idcliente);
    
ALTER TABLE vendas ADD CONSTRAINT FK_pagamento
    FOREIGN KEY (idpagamento)REFERENCES pagamentos (idpagamento);
    
ALTER TABLE passeios ADD CONSTRAINT FK_passeio
    FOREIGN KEY (idvenda)REFERENCES vendas (idvenda);
    
ALTER TABLE hoteis ADD CONSTRAINT FK_venda
    FOREIGN KEY (idvenda)REFERENCES vendas (idvenda); 
    
ALTER TABLE vendas ADD CONSTRAINT FK_destino
    FOREIGN KEY (iddestino)REFERENCES destinos (iddestino);
    
ALTER TABLE voos ADD CONSTRAINT FK_venda2
    FOREIGN KEY (idvenda)REFERENCES vendas (idvenda);  
    
 
INSERT INTO clientes(nome,cpf,email,telefone,cidade,estado,pais)VALUES
('Joao da Silva','230123456-65','j@gmail.com','31983433333','Sao Paulo','SP','Brasil'),
('Maria Santos','148923456-97','ms@gmail.com','31973433222','Rio de Janeiro','RJ','Brasil'),
('Clodoaldo Junior','654123456-44','clo@gmail.com','31993433768','Sao Paulo','SP','Brasil'),
('Matilda Linz','322123456-30','mlinz@gmail.com','31973433988','Belo Horizonte','BH','Brasil'),
('Jose da Casca','566123456-22','casca@gmail.com','31983433543','Sao Paulo','SP','Brasil');
 
 INSERT INTO destinos(descricao,cidade,estado)VALUES
('Porto de Galinhas','Maceió','AL'),
('Itacaré','Salvador','BA'),
('Cristo Redentor','Rio de Janeiro','RJ'),
('Cataratas de Iguaçú','Foz do Iguaçú','SC'),
('Minas de Ouro Preto','Ouro Preto','MG'),
('Pelourinho','Salvador','BA');

 INSERT INTO pagamentos (valorTotal,tipo) VALUES
(5358,'pix'),
(6566,'debito'),
(4555,'credito');

INSERT INTO vendas (idcliente,iddestino,idpagamento) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,3);  

 INSERT INTO voos(companhia,codvoo,embarque,desembarque,poltrona,idvenda) VALUES
('AZUL','AZ-3232','2022-02-10:10:45','2022-02-15:14:45','A44',1),
('GOL','GO-2121','2022-02-10:10:45','2022-02-15:14:45','G24',2),
('AZUL','AZ-1277','2022-02-10:10:45','2022-02-15:19:45','A21',3),
('LATAM','LT-7676','2022-02-10:10:45','2022-02-15:18:45','L36',4);
   
INSERT INTO passeios (descricao,saida,chegada,observacoes,idvenda) VALUES
('Andar nas trilhas','2022-02-11:12:45','2022-02-11:14:45','Usar roupas leves',1);
  
INSERT INTO hoteis (nome,checkin,checkout,diarias,quarto,idvenda) VALUES
('Solar Andino','2022-02-10:12:45','2022-02-15:14:45',5,405,1),
('Summer Alto','2022-02-10:12:45','2022-02-15:14:45',5,405,2),
('Castro Luvrier','2022-02-10:12:45','2022-02-15:14:45',5,405,3),
('Vilas del Mar','2022-02-10:12:45','2022-02-15:14:45',5,405,4);

/*
Quantos clientes estão cadastrados no sistema? Resposta: 5
Qual é o valor total de todas as vendas realizadas? Resposta: 16479
Qual é o valor médio dos pagamentos realizados? Resposta: 5493

Qual é o maior valor de pagamento registrado? Resposta: 6566

Quantos destinos turísticos estão disponíveis no catálogo? Resposta: 6
Quantos voos foram vendidos no total? Resposta: 3

Nível Intermediário (GROUP BY) 
Quantos clientes existem por estado? 
Qual é a quantidade de vendas por tipo de pagamento?
Quantos voos cada companhia aérea vendeu?
Qual é o valor total de vendas para cada tipo de pagamento?
Quantas vendas foram realizadas para cada destino?
Qual é a média de diárias por hotel?
Quantos hotéis estão associados a cada venda?
Nível Avançado (GROUP BY + HAVING, múltiplas tabelas)
Quais estados possuem mais de 1 cliente cadastrado?
Quais companhias aéreas têm mais de 1 voo vendido?
Qual destino possui o maior número de vendas?
Qual cliente (nome) gastou mais dinheiro em pacotes de viagem?

Quais cidades de destino têm mais de 1 atração turística cadastrada?

Qual é o valor médio gasto por cliente que já comprou algum pacote?

Quantos passeios, hotéis e voos estão incluídos em cada venda? (mostrar apenas vendas que tenham pelo menos um item de cada categoria)

*/

select valorTotal from pagamentos;

select sum(valorTotal) from pagamentos;

select avg(valorTotal) from pagamentos;

select max(valorTotal) from pagamentos;

select iddestino from destinos;

select idpagamento, count(*) , sum(idpagamento) 
from pagamentos
group by idpagamento;

select estado from clientes;

-- Encontre o nome do cliente que realizou uma compra
-- CLIENTES X VENDAS
select nome,cpf,v.idcliente,pay.tipo
from clientes
inner join vendas as v
on clientes.idcliente = v.idcliente
inner join pagamentos as pay
on v.idpagamento = pay.idpagamento;

select idvenda from vendas;

select * from vendas;