select * from lojainformatica2.clientes;
select * from produtos;
select nome from clientes;
select nome, cpf from clientes;
select nome, cpf from clientes
where limiteCredito = 5000;
select idCliente,nome,cpf from clientes;
select * from produtos 
where precoVenda > 1000 and precoVenda < 5000; 
select * from produtos 
where precoVenda > 100 limit 3;
select * from produtos 
where precoVenda > 100 order by precoVenda limit 2;

select idProduto, descricao, precoVenda from produtos
where precoVenda between 100 and 2000
order by precoVenda desc;

select idCliente,nome from clientes where nome like '%dr%'; -- pesquisa trechos dentro de linhas utilizando o LIKE
-- Atividade
select * from clientes;
select nome, cpf from clientes;
select nome, email from clientes;
select nome, limiteCredito from clientes;

select * from enderecos;
select logradouro, cep from enderecos;
select bairro, cidade from enderecos; 
