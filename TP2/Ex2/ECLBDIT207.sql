insert into pessoa values (1, 'Regina', '27/02/1951', null, null);
insert into pessoa values (2, 'Ken', '10/01/1950', null, null);
insert into pessoa values (3, 'Laura', '17/11/1952', null, null);
insert into pessoa values (4, 'John', '03/03/1948', null, null);
insert into pessoa values (5, 'Tina', '17/02/1972', null, null);
insert into pessoa values (6, 'Adam', '03/11/1972', 2, 1);
insert into pessoa values (7, 'Eva', '01/07/1973', 2, 1);
insert into pessoa values (8, 'Tomas', '15/12/1973', 4, 3);
insert into pessoa values (9, 'Caty', '21/06/1972', 4, 3);
insert into pessoa values (10, 'Sean', '10/05/1972', null, null);
insert into pessoa values (11, 'Jonas', '27/08/2003', 6, 5);
insert into pessoa values (12, 'Charlie', '02/03/2003', 8, 7);
insert into pessoa values (13, 'Addison', '22/02/2004', 8, 7);
insert into pessoa values (14, 'Dixie', '10/10/2005', 8, 7);
insert into pessoa values (15, 'George', '17/11/2003', 6, 5);

insert into casamento values (1, 2,'29/03/1971');
insert into casamento values (3, 4, '11/11/1972');
insert into casamento values (5, 6, '01/02/1992');
insert into casamento values (7, 8, '17/12/1993');
insert into casamento values (9, 10, '04/04/1992');

select p.nome_pessoa, pai.nome_pessoa as nome_pai, mae.nome_pessoa as nome_mae
from Pessoa p
left join Pessoa pai on p.id_pai = pai.id_pessoa
left join Pessoa mae on p.id_mae = mae.id_pessoa;

select p.nome_pessoa, filho.nome_pessoa as nome_filho
from Pessoa p
left join Pessoa filho on (p.id_pessoa = filho.id_pai OR p.id_pessoa = filho.id_mae);

SELECT p1.nome_pessoa AS conjuge1, p2.nome_pessoa AS conjuge2, c.data_casamento 
FROM pessoa p1
JOIN casamento c ON p1.id_pessoa = c.id_conjuge1
JOIN pessoa p2 ON p2.id_pessoa = c.id_conjuge2;
 