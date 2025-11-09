INSERT INTO ENDERECOS(Logradouro,numero,complemento,cep,bairro,cidade,estado)
VALUES
('Av dos Magnatas',123,'casa','12.333-234','CENTRO','BH','MG'),
('Rua da Glória',23,'ap303','99.333-111','GLÓRIA','BH','MG'),
('Rua Carmo Sintra',10,'casa','22.311-111','LOURDES','BH','MG'),
('Praça do forró',19,'casa','34.566-665','GUTIERREZ','BH','MG'),
('AV Amazonas',290,'Praça 10','45.988-666','CAMARGOS','BH','MG'),
('Rua da Placa Quebrada',23,'ap 405','44.555-231','CENTRO','BH','MG'),
('Av do Contorno',98,'ap 303','77.344-766','CENTRO','BH','MG'),
('Rua Melo Azevedo',66,'casa','32.455-345','VENDA NOVA','BH','MG');
INSERT INTO CLIENTES(nome,email,cpf,limiteCredito,fk_idEndereco)
VALUES
('Leandro Silva','ls@gmail.com','123.123.123-99',5000,1),
('Marcus Santos','ms@gmail.com','333.222.111-33',5000,2),
('Moacir Raposo','mr@gmail.com','444.232.123-22',5000,3),
('Marina Santos','ms@gmail.com','321.321.444-22',5000,4),
('Mariana Gonçalves','mg@gmail.com','222.333.555-66',5000,5),
('Maria Silva','mas@gmail.com','266.666.666-43',5000,6),
('Ana Maria Santos','ams@gmail.com','777.655.722-88',5000,7),
('Teclaudio da Silva','ts@gmail.com','444.876.555-77',5000,8);

INSERT INTO PRODUTOS(descricao,tipo,precoCompra,precoVenda)
VALUES 
('Mouse s/Fio','Acessorios',50,100),
('Teclado s/Fio','Acessorios',149,249),
('CPU-Intel I7','Processador',1299,1899),
('Gabinete Gamer 4 Baias','Acessorios',350,450),
('Memoria DDR4 - 8GB','Memoria',150,230),
('Memoria DDR4 - 16GB','Memoria',200,289),
('Notebook ACCER I7-16GB','Notebook',2300,2899);
INSERT INTO VENDAS(fk_idCliente,valorTotal,dataVenda)
VALUES 
(1,100,'2024-10-08'),
(2,100,'2024-10-08'),
(3,249,'2024-10-08'),
(2,230,'2024-10-09'),
(4,799,NOW()),
(3,100,'2024-10-10');
INSERT INTO itemsVendas(fk_idVenda,fk_idProduto,quantidade)
VALUES
(1,1,1),
(2,1,1),
(3,2,1),
(4,5,1),
(5,1,1),
(5,2,1),
(5,4,1),
(6,1,1);


















