insert into departamento values (10, 'Vendas');
insert into departamento values (20, 'Técnico');

insert into localizacao_departamento values ('BH', 10);
insert into localizacao_departamento values ('SP', 10);
insert into localizacao_departamento values ('BH', 20);
insert into localizacao_departamento values ('RJ', 20);

insert into funcionario values 
(10000, 'Antonio', 'Pereira', 'Silva', 'M', 'Rua A, 10', '01/12/2000', 10);
insert into funcionario values 
(20000, 'Ana', 'Miranda', 'Sales', 'F', 'Rua B, 10', '01/12/2000', 10);
insert into funcionario values 
(30000, 'Maria', 'Fernandes', 'Souza', 'M', 'Rua C, 20', '01/12/2000', 20);

select d.nome_departamento, f.pnome
from departamento d join funcionario f on f.numero_departamento=d.numero_departamento;
