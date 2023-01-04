create database curso_sql;

use curso_sql;

create table funcionarios
(
id int unsigned not null auto_increment,
nome varchar(50) not null,
salario double not null default '0',
departamento varchar(45) not null,
primary key (id)
);

create table veiculos
(
	id int unsigned not null auto_increment,
	funcionario_id int unsigned null,
	veiculo varchar(45)not null default '',
	placa varchar (10) not null default '',
	PRIMARY KEY(id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id) 
);

create table salarios (
	faixa varchar(50) not null,
    inicio double not null,
    fim double not null,
    primary key (faixa)
);

alter table funcionarios change column nome nome_func varchar(40) not null;

alter table funcionarios change column nome_func nome varchar(50) not null;

drop table salarios; 
drop table pilotos;

create index departamentos on funcionarios(departamento);

create index nomes on funcionarios (nome(6));

alter table funcionarios add data_nascimento varchar(10);

alter table funcionarios change column data_nascimento nascimento date; 

create index veiculos on veiculos(veiculo(10));

alter table funcionarios add EMAIL varchar(100);

alter table funcionarios drop EMAIL; 


INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (1, 'Kleber', 1900, 'TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Renan', 2500, 'Liderança');
INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (3, 'Diogo', 2200, 'Negocios');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Pouca Telha', 2900, 'Pagamento');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Rioner', 4000, 'T.I');

SELECT * FROM funcionarios;

SELECT * FROM veiculos;

select * from funcionarios where salario > 3000;
select * from funcionarios where nome = 'Renan';
select * from funcionarios where id = 1;


SET SQL_SAFE_UPDATES = 0;
UPDATE funcionarios SET salario = salario * 1.1;

UPDATE funcionarios SET salario = round(salario * 1.1, 2);

DELETE FROM funcionarios WHERE id = 3;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'ECC-2312');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'DCK-7322');

UPDATE veiculos SET funcionario_id = 4 WHERE id = 2;

INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista JR', '5000', '7000');
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Pleno', '7000', '9000');
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Senior', '8000', '15000');

select * from salarios;

SELECT nome AS 'Funcionário', salario FROM funcionarios f WHERE f.salario > 3500;

SELECT * FROM funcionarios WHERE nome = 'Rioner'
UNION 
SELECT * FROM funcionarios WHERE id = 5;


DELETE FROM VEICULOS ID = 1;

SELECT FROM VEICULOS ID, VEICULO;
SELECT *, ID FROM VEICULOS;

INSERT INTO VEICULOS (ID, VEICULO) VALUES (1, 'Automóvel') WHERE ID = 0;

INSERT INTO VEICULOS (ID, VEICULO) VALUES (1, 'Automóvel');




SELECT * FROM VEICULOS;

SELECT * FROM VEICULOS WHERE VEICULO IS NULL;

UPDATE VEICULOS SET VEICULO = 'Automóvel' WHERE ID = 1;



select * FROM veiculos;
select * from funcionarios;

SELECT * FROM funcionarios inner join veiculos on veiculos.funcionario_id = funcionarios.id;

SELECT * FROM funcionarios f inner join veiculos v on v.funcionario_id = f.id;

INSERT INTO veiculos (funcionario_id, veiculo, placa) values (4, "Lambretaa", null);

insert into funcionarios (nome, salario, departamento, nascimento) values("Joao", 1800, "Logistica", null);

SELECT * FROM funcionarios f left join veiculos v on v.funcionario_id = f.id; 

SELECT * FROM funcionarios f right join veiculos v on v.funcionario_id = f.id; 

 

SELECT * FROM funcionarios f left join veiculos v on v.funcionario_id = f.id
union 
SELECT * FROM funcionarios f right join veiculos v on v.funcionario_id = f.id; 


CREATE TABLE cpfs 
(
	id int unsigned not null,
    cpf varchar(14) not null,
    primary key (id),
    constraint fk_cpf foreign key (id) references funcionarios (id)
);
INSERT INTO cpfs (id, cpf) VALUES (1, '413,949,058-66');
INSERT INTO cpfs (id, cpf) VALUES (2, '222,222,222-22');
INSERT INTO cpfs (id, cpf) VALUES (4, '444,444,444-44');
INSERT INTO cpfs (id, cpf) VALUES (5, '555,555,555-55');

select * from cpfs;
select * from funcionarios;
select * from funcionarios inner join cpfs on funcionarios.id = cpfs.id;

select * from funcionarios full join cpfs cpfs using(id);


CREATE table clientes 
(
	id int unsigned not null auto_increment,
    nome varchar (45),
    quem_indicou int unsigned,
    primary key (id),
    constraint fk_quem_indicou foreign key (quem_indicou) references clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'Andre', null);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Juliano', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Fernando', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Pierre', 1);


select * from clientes;


select a.nome AS CLIENTE, b.nome AS "QUEM INDICOU" from clientes join clientes b on a.quem_indicou = b.id;

select * from full join funcionarios on veiculos.funcionario_id = veiculo.id;

SELECT * FROM funcionarios
 inner join veiculos on veiculos.funcionario_id = funcionarios.id 
 inner join cpfs on cpfs.id = funcionarios.id;
create view Funcionarios_a AS select * from funcionarios where salario >= 2000;

select * from funcionarios_a;

UPDATE funcionarios SET salario = 1500 where id = 4;


drop view funcionarios_a;



SELECT * FROM funcionarios FULL JOIN veiculos ON funcionario_id = veiculo.id;

select * from funcionarios;
select count(*) from funcionarios;
select count(*) from funcionarios where salario > 2000 AND departamento = 'TI';


select avg(salario) from funcionarios;

select sum(salario) from funcionarios where departamento in ('TI','T.I');

select max(salario) from funcionarios;

select max(salario) from funcionarios where departamento in ('TI','T.I');

select min(salario) from funcionarios;

select min(salario) from funcionarios where departamento in ('TI','T.I');

select distinct(departamento) from funcionarios;

select * from funcionarios;

select * from funcionarios ORDER BY nome;

select * from funcionarios ORDER BY nome DESC;

select * from funcionarios ORDER BY salario;
select * from funcionarios ORDER BY departamento;

select * from funcionarios limit 2;

select * from funcionarios limit 2 offset 1;

select * from funcionarios limit 1, 2;

select avg(salario) from funcionarios where departamento = 'T.I';

select departamento, avg(salario) from funcionarios group by departamento;

select departamento, avg(salario) from funcionarios group by departamento having avg(salario) > 2000;

select departamento, count(*) from funcionarios group by departamento;


select departamento, avg(salario) from funcionarios group by departamento;
select nome from funcionarios where departamento = 'TI';

select nome from funcionarios where departamento IN (select departamento from funcionarios GROUP BY departamento having avg(salario)> 2000);


select * from funcionarios;

select * from funcionarios ORDER BY salario desc limit 1;





CREATE table Pilotos 
(
	id int unsigned not null auto_increment,
    nome varchar (45),
    equipe varchar (10),
    pontos int,
    primary key (id)
);

INSERT INTO Pilotos (id, nome, equipe, pontos) VALUES (1, 'Fernando', 'A', 2);
INSERT INTO Pilotos (id, nome, equipe, pontos) VALUES (2, 'Paulo', 'B', 5);
INSERT INTO Pilotos (id, nome, equipe, pontos) VALUES (3, 'Richa', 'A', 3);
INSERT INTO Pilotos (id, nome, equipe, pontos) VALUES (4, 'Gomes', 'C', 6);
INSERT INTO Pilotos (id, nome, equipe, pontos) VALUES (5, 'Fred', 'B', 7);

select * from pilotos;
SELECT * FROM PILOTOS ORDER BY PONTOS DESC LIMIT 1;

SELECT * FROM PILOTOS WHERE EQUIPE IN
  (SELECT EQUIPE FROM PILOTOS GROUP BY EQUIPE HAVING SUM(PONTOS) > 5);

SELECT COUNT(PONTOS) FROM PILOTOS WHERE EQUIPE = 'B';

SELECT COUNT(*) FROM PILOTOS WHERE EQUIPE != 'C';

SELECT MAX(PONTOS) FROM PILOTOS WHERE EQUIPE != 'B';


/*prova relacionamento*/


CREATE table INSTRUTORES 
(
	ID int unsigned not null auto_increment,
    NOME varchar (45),
    primary key (ID)
);

CREATE table CURSOS 
(
	ID int unsigned not null auto_increment,
    INS int, 
    TITULO varchar (45),
    primary key (ID)
);

INSERT INTO INSTRUTORES (ID, NOME) VALUES (1, 'Andre');
INSERT INTO INSTRUTORES (ID, NOME) VALUES (2, 'Carlos');
INSERT INTO INSTRUTORES (ID, NOME) VALUES (3, 'Samuel');
INSERT INTO INSTRUTORES (ID, NOME) VALUES (4, 'Fabio');

select * from INSTRUTORES;
select * from CURSOS;

INSERT INTO CURSOS (ID, INS, TITULO) VALUES (1, 1,'java');
INSERT INTO CURSOS (ID, INS, TITULO) VALUES (2, null,'PHP');
INSERT INTO CURSOS (ID, INS, TITULO) VALUES (3, 1,'MySQL');
INSERT INTO CURSOS (ID, INS, TITULO) VALUES (4, 3,'SQL');
INSERT INTO CURSOS (ID, INS, TITULO) VALUES (5, 2,'C++');

SELECT * FROM INSTRUTORES RIGHT JOIN CURSOS ON INSTRUTORES.ID = CURSOS.INS;
SELECT * FROM INSTRUTORES INNER JOIN CURSOS ON INSTRUTORES.ID = CURSOS.INS;
SELECT * FROM INSTRUTORES INNER JOIN CURSOS USING (ID);



/*DCL Controle de acesso*/

CREATE USER 'andre'@ '200.200.190.190' identified BY 'milani123456'; /*Acesso somente do IP*/
CREATE USER 'andre'@ 'localhost' identified BY 'milani123456'; /*Endereço IP local da maquina*/
CREATE USER 'andre'@ '%' identified BY 'milani123456'; /*tem acesso a qualquer endereço IP*/


CREATE USER 'andre'@'localhost' identified BY 'milani123456'; /*Endereço IP local da maquina*/
grant all on curso_sql.* to 'andre'@'localhost';

create user 'andre'@'%' identified by 'andreviagem';
grant select on curso_sql.* to 'andre'@'%';

grant insert on curso_sql.funcionarios to 'andre'@'%';

revoke insert on curso_sql.funcionarios from 'andre'@'%';
revoke select on curso_sql.* from 'andre'@'%';

revoke all on curso_sql.* from 'andre'@'localhost';
drop user 'andre'@'%';
drop user 'andre'@'localhost';


select user from mysql.user;
show grants for 'andre'@'%';

GRANT SELECT ON VEICULOS TO 'André';

GRANT ALL ON VEICULOS TO 'André';

REVOKE UPDATE ON VEICULOS FROM 'André';

GRANT * TO VEICULOS ON 'André';

REVOKE ALL ON VEICULOS TO 'André';




