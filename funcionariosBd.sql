create database Empresa;
use empresa;

create table Departamentos(
	id int primary key auto_increment,
    nome varchar(100) not null
);

create table Cargos(
	id int primary key auto_increment,
    nome varchar(100) not null,
    nivel varchar(50) not null
);

create table Funcionarios(
	id int primary key auto_increment,
    nome varchar(100) not null,
    data_nascimento date not null,
    salario decimal(10,2) not null,
    departamento_id int not null,
    cargo_id int not null,
    foreign key (departamento_id) references Departamentos(id),
    foreign key (cargo_id)	references Cargos(id)
);

INSERT INTO Departamentos (nome) VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

INSERT INTO Cargos (nome, nivel) VALUES 
('Analista', 'Pleno'), 
('Gerente', 'Sênior'), 
('Assistente', 'Júnior'), 
('Coordenador', 'Sênior'), 
('Desenvolvedor', 'Pleno');


INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);

-- 1 - Encontre o maior salário. --
select * from Funcionarios order by salario desc;

-- 2 - Encontrar o menor salário --
select * from Funcionarios order by salario asc;

-- 3 - Qual a quantidade de funcionários? --
select count(id) from funcionarios;

-- 4 - Filtre os funcionários nascidos a partir de 1990 --
select * from funcionarios where data_nascimento >= '1990-01-01';

-- 5 - Encontre a média salarial --
select avg(salario) as media_salarial from funcionarios;

-- 6 - Extraia os 3 primeiros caracteres do nome --
select substring(nome, 4, 3) from funcionarios;

-- 7 Contar quantos funcionários por departamento --
select departamentos.nome, count(funcionarios.departamento_id)
from funcionarios
inner join departamentos on funcionarios.departamento_id = departamentos.id
group by Departamentos.nome;

-- 8 - Contar quantos funcionários existem por cargo --
select cargos.nome, count(funcionarios.cargo_id)
from cargos
inner join funcionarios on cargos.id = funcionarios.cargo_id
group by cargos.nome;