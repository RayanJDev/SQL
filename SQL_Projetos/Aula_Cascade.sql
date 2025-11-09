create schema AulaCascade;
use AulaCascade;

create table Categorias(
idCategorias int primary key auto_increment,
nome varchar(50) not null
);
create table Produtos(
idProdutos int primary key auto_increment,
descricao varchar(50) not null,
fkCategorias int not null,
foreign key (fkCategorias) references
Categorias(idCategorias)
on delete cascade
on update cascade
);
insert into Categorias(nome)values
('Material de Limpeza'),
('Eletronicos'),
('Alimentos');

insert into produtos(descricao, fkCategorias) values
('Amaciante de Roupas', 1),
('Água Sanitaria', 1),
('Mouse s/ fio', 2),
('Teclado s/ fio', 2),
('Arroz 5 kilos', 3),
('Feijão 3 kilos',3);

delete from Categorias where idCategoria = 3;
update Categorias set idCategorias = 20 where idCategorias = 2;