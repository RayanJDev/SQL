create schema if not exists AulaJuncao;
use AulaJuncao;
create table nomeA(
idNomeA int Primary Key auto_increment,
nome varchar(50) null
);
create table nomeB(
idNomeB int Primary Key auto_increment,
nome varchar(50) null
);
alter table nomeA
drop idNomeA;
alter table nomeB
drop idNomeB;

insert into nomeA values('Aline');
insert into nomeA values('Alice');
insert into nomeA values('Ana Carolina');
insert into nomeA values('Abaldina');
insert into nomeB values('Aline');
insert into nomeB values('Bruno');
insert into nomeB values('Breno');
insert into nomeB values('Bianca');
insert into nomeB values('Beletti');

select * from nomeA;
select * from nomeB;

select a.Nome, b.Nome
from nomeA as A
inner join nomeB as B
on a.Nome = b.Nome;

select a.Nome as TabelaA, b.Nome as TabelaB
from nomeA as A
left join nomeB as B
on a.Nome = b.Nome;

select a.Nome as TabelaA, b.Nome as TabelaB
from nomeA as A
right join nomeB as B
on a.Nome = b.Nome;