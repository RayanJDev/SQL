-- BANCO DE DADOS: SISTEMA DE APOSTAS ESPORTIVAS
CREATE SCHEMA SAE;
USE SAE;
-- ============================================
-- TABELA: USUARIOS
-- ============================================

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    saldo DECIMAL(10,2) DEFAULT 0.00,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ============================================
-- TABELA: TIMES
-- ============================================
CREATE TABLE times (
    id_time INT PRIMARY KEY AUTO_INCREMENT,
    nome_time VARCHAR(100) NOT NULL,
    esporte ENUM('futebol', 'basquete', 'vôlei') NOT NULL,
    pais VARCHAR(50)
);
-- ============================================
-- TABELA: PARTIDAS
-- ============================================
CREATE TABLE partidas (
    id_partida INT PRIMARY KEY AUTO_INCREMENT,
    id_time_casa INT NOT NULL,
    id_time_visitante INT NOT NULL,
    data_partida DATETIME NOT NULL,
    placar_casa INT DEFAULT NULL,
    placar_visitante INT DEFAULT NULL,
    status_partida ENUM('agendada', 'ao_vivo', 'finalizada') DEFAULT 'agendada',
    FOREIGN KEY (id_time_casa) REFERENCES times(id_time),
    FOREIGN KEY (id_time_visitante) REFERENCES times(id_time)
);
-- ============================================
-- TABELA: APOSTAS
-- ============================================
CREATE TABLE apostas (
    id_aposta INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_partida INT NOT NULL,
    tipo_aposta ENUM('vitoria_casa', 'empate', 'vitoria_visitante') NOT NULL,
    valor_apostado DECIMAL(10,2) NOT NULL,
    multiplicador DECIMAL(4,2) NOT NULL,
    valor_retorno DECIMAL(10,2) AS (valor_apostado * multiplicador) STORED,
    status_aposta ENUM('pendente', 'ganhou', 'perdeu') DEFAULT 'pendente',
    data_aposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_partida) REFERENCES partidas(id_partida)
) ;
-- ============================================
-- TABELA: TRANSACOES
-- ============================================
CREATE TABLE transacoes (
    id_transacao INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    tipo ENUM('deposito', 'saque', 'aposta', 'premio') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
-- ============================================
-- INSERIR DADOS DE EXEMPLO
-- ============================================
-- Usuários
INSERT INTO usuarios (nome, email, saldo) VALUES
('João Silva', 'joao@email.com', 500.00),
('Maria Santos', 'maria@email.com', 1200.00),
('Pedro Costa', 'pedro@email.com', 300.00),
('Ana Lima', 'ana@email.com', 800.00);

-- Times
INSERT INTO times (nome_time, esporte, pais) VALUES
('Flamengo', 'futebol', 'Brasil'),
('Palmeiras', 'futebol', 'Brasil'),
('Corinthians', 'futebol', 'Brasil'),
('São Paulo', 'futebol', 'Brasil'),
('Lakers', 'basquete', 'EUA'),
('Warriors', 'basquete', 'EUA');

-- Partidas
INSERT INTO partidas (id_time_casa, id_time_visitante, data_partida, placar_casa, placar_visitante, status_partida) VALUES
(1, 2, '2025-11-01 16:00:00', 2, 1, 'finalizada'),      -- id_partida = 1
(3, 4, '2025-11-02 18:00:00', 1, 1, 'finalizada'),      -- id_partida = 2
(1, 3, '2025-11-05 20:00:00', NULL, NULL, 'agendada'),  -- id_partida = 3
(2, 4, '2025-11-06 16:00:00', NULL, NULL, 'agendada'),  -- id_partida = 4
(5, 6, '2025-11-03 21:00:00', 98, 102, 'finalizada');   -- id_partida = 5 

-- Apostas
-- O multiplicador da aposta significa o quanto ela paga se o palpite estiver correto
INSERT INTO apostas (id_usuario, id_partida, tipo_aposta, valor_apostado, multiplicador, status_aposta) VALUES
(1, 1, 'vitoria_casa', 50.00, 1.85, 'ganhou'),
(1, 2, 'empate', 30.00, 3.20, 'ganhou'),
(2, 1, 'vitoria_visitante', 100.00, 2.10, 'perdeu'),
(2, 5, 'vitoria_visitante', 200.00, 1.95, 'ganhou'), 
(3, 1, 'vitoria_casa', 25.00, 1.85, 'ganhou'),
(3, 2, 'vitoria_casa', 40.00, 2.00, 'perdeu'),
(4, 3, 'vitoria_casa', 60.00, 1.75, 'pendente'),
(4, 4, 'empate', 50.00, 3.00, 'pendente');

-- Transações
INSERT INTO transacoes (id_usuario, tipo, valor) VALUES
(1, 'deposito', 500.00),
(1, 'aposta', -50.00),
(1, 'premio', 92.50),
(2, 'deposito', 1000.00),
(2, 'aposta', -100.00),
(2, 'aposta', -200.00),
(2, 'premio', 390.00),
(3, 'deposito', 300.00),
(4, 'deposito', 800.00);


-- 1 Crie uma consulta que exiba o ID da aposta, nome do usuário, valor apostado, multiplicador e status da aposta. 
-- Ordene pelos valores apostados do maior para o menor.

select a.id_aposta,u.nome, a.valor_apostado, a.multiplicador, a.status_aposta
from usuarios as u
join apostas as a
on u.id_usuario = a.id_usuario
order by a.valor_apostado desc;

-- 2 Liste todas as apostas mostrando o nome do usuário que fez a aposta e o valor apostado.

select losers.id_aposta, users.nome, losers.valor_apostado
from usuarios as users
join apostas as losers
on users.id_usuario = losers.id_usuario
order by losers.valor_apostado desc;

-- 3  Exiba todas as transações com o nome do usuário que realizou cada transação.

select trans.id_transacao, users.nome, trans.valor
from usuarios as users
join transacoes as trans
on users.id_usuario = trans.id_usuario;

-- 4 Liste todas as apostas mostrando o nome do usuário e o status da aposta.

select losers.id_aposta, users.nome, losers.status_aposta
from usuarios as users
join apostas as losers
on users.id_usuario = losers.id_usuario;

-- 5 Liste o nome dos usuários e o total de transações que cada um realizou.

select count(users.id_usuario), users.nome, trans.valor
from usuarios as users
join transacoes as trans
on users.id_usuario = trans.id_usuario;

-- 6 Liste os depósitos mostrando o nome do usuário e o valor depositado.

select trans.id_transacao, trans.tipo, users.nome, trans.valor
from usuarios as users
join transacoes as trans
on users.id_usuario = trans.id_usuario;

    -- 7 Mostre todas as partidas com o nome do time da casa e o nome do time visitante.
    
    select party.id_partida, teams.nome_time, party.id_time_casa, party.id_time_visitante
    from partidas as party
    join times as teams
    on party.id_time_casa = teams.id_time
    join times as t
    on party.id_time_visitante = t.id_time
    where t.esporte = "futebol";
    
    -- 8 Mostre todas as partidas de futebol com os nomes dos times jogando. ***ANULADA***
    
    
    -- 9 Mostre todas as apostas com o nome do time da casa da partida apostada
    
    select losers.id_aposta, a.valor_apostado, party.id_time_casa, teams.nome_time
    from apostas as losers 
    join times as teams
    on party.id_time_casa = teams.id_time
    join partidas as party
    on losers.id_partida = party.id_partida
    join apostas as a
    on p.id_partida = a.id_partida;
    
-- left join
 -- 1 Liste todos os usuários e quantas apostas cada um fez (incluindo usuários sem apostas).
 -- 2 Mostre todos os times e quantas partidas cada time jogou como mandante (incluindo times que não jogaram).
 -- 3 Liste todos os usuários com seu saldo e quantas transações fizeram (incluindo quem não tem transações).
 -- 4 Mostre todas as partidas e quantas apostas receberam (incluindo partidas sem apostas).
 
 
 /*ESTRUTURA LEFT JOIN
 SELECT "COLUNAS"
 FROM "TABELA ESQUERDA"
 LEFT JOIN "TABELA DIREITA"
 ON "CONDIÇÃO"
 WHERE "FILTROS"*/
 
 select u.id_usuario,u.nome,u.email,u.saldo,
 a.id_aposta,a.valor_apostado,a.tipo_aposta,a.status_aposta
 from usuarios u
 left join apostas a 
 on u.id_usuario = a.id_usuario
 order by u.id_usuario,a.id_aposta;
 
 select u.id_usuario, u.nome,u.email,
 count(a.id_aposta) as total_apostas,
 coalesce(sum(a.valor_apostado), 0) as total_investidos,
 coalesce(sum(case when a.status_aposta = 'ganhou' then a.valor_retorno else 0 end), 0)
 as total_ganho
 from usuarios u
 left join apostas a on u.id_usuario = a.id_usuario
 group by u.id_usuario, u.nome, u.email
 order by total_apostas desc;
 
 select * from partidas;
