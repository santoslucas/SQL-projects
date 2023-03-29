-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-03-16 22:46:31 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE departamento (
    nome_departamento   VARCHAR2(50) NOT NULL,
    numero_departamento NUMBER(1) NOT NULL,
    cpf_gerente         NUMBER(11),
    data_inicio_gerente DATE NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( numero_departamento );

ALTER TABLE departamento ADD CONSTRAINT departamento_nome_un UNIQUE ( nome_departamento );

ALTER TABLE departamento ADD CONSTRAINT departamento_cpf_gerente_un UNIQUE ( cpf_gerente );

CREATE TABLE dependente (
    cpf_funcionario NUMBER(11) NOT NULL,
    nome_dependente VARCHAR2(50) NOT NULL,
    sexo            VARCHAR2(1) NOT NULL,
    data_nascimento DATE NOT NULL,
    parentesco      VARCHAR2(20) NOT NULL
);

ALTER TABLE dependente
    ADD CONSTRAINT dependente_parentesco_1 CHECK ( parentesco IN ( 'Filho', 'Filha', 'Esposo', 'Esposa' ) );

ALTER TABLE dependente ADD CONSTRAINT dependente_pk PRIMARY KEY ( cpf_funcionario,
                                                                  nome_dependente );

CREATE TABLE funcionario (
    primeiro_nome       VARCHAR2(20) NOT NULL,
    nome_meio           VARCHAR2(30) NOT NULL,
    ultimo_nome         VARCHAR2(30) NOT NULL,
    cpf                 NUMBER(11) NOT NULL,
    data_nascimento     DATE NOT NULL,
    endereco            VARCHAR2(50) NOT NULL,
    sexo                VARCHAR2(1) NOT NULL,
    salario             NUMBER(6) NOT NULL,
    cpf_supervisor      NUMBER(11),
    numero_departamento NUMBER(1) NOT NULL
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_salario_1 CHECK ( salario >= 1000 );

ALTER TABLE funcionario ADD CONSTRAINT funcionario_salario_2 CHECK ( salario <= 100000 );

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_sexo_3 CHECK ( sexo IN ( 'F', 'M' ) );

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cpf );

CREATE TABLE localizacoes_departamento (
    numero_departamento NUMBER(1) NOT NULL,
    local               VARCHAR2(50) DEFAULT '�Belo Horizonte�' NOT NULL
);

ALTER TABLE localizacoes_departamento ADD CONSTRAINT localizacoes_departamento_pk PRIMARY KEY ( numero_departamento,
                                                                                                local );

CREATE TABLE projeto (
    nome_projeto        VARCHAR2(50) NOT NULL,
    numero_projeto      NUMBER(3) NOT NULL,
    local_projeto       VARCHAR2(50) NOT NULL,
    numero_departamento NUMBER(1) NOT NULL
);

ALTER TABLE projeto ADD CONSTRAINT projeto_pk PRIMARY KEY ( numero_projeto );

CREATE TABLE trabalha_em (
    cpf_funcionario NUMBER(11) NOT NULL,
    numero_projeto  NUMBER(3) NOT NULL,
    horas           NUMBER(3, 1)
);

ALTER TABLE trabalha_em ADD CONSTRAINT trabalha_em_pk PRIMARY KEY ( numero_projeto,
                                                                    cpf_funcionario );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_funcionario_fk FOREIGN KEY ( cpf_gerente )
        REFERENCES funcionario ( cpf );

ALTER TABLE dependente
    ADD CONSTRAINT dependente_funcionario_fk FOREIGN KEY ( cpf_funcionario )
        REFERENCES funcionario ( cpf )
            ON DELETE CASCADE;

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_departamento_fk FOREIGN KEY ( numero_departamento )
        REFERENCES departamento ( numero_departamento );

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_funcionario_fk FOREIGN KEY ( cpf_supervisor )
        REFERENCES funcionario ( cpf );

ALTER TABLE localizacoes_departamento
    ADD CONSTRAINT localiza_dep_dep_fk FOREIGN KEY ( numero_departamento )
        REFERENCES departamento ( numero_departamento )
            ON DELETE CASCADE;

ALTER TABLE projeto
    ADD CONSTRAINT projeto_departamento_fk FOREIGN KEY ( numero_departamento )
        REFERENCES departamento ( numero_departamento );

ALTER TABLE trabalha_em
    ADD CONSTRAINT trabalha_em_funcionario_fk FOREIGN KEY ( cpf_funcionario )
        REFERENCES funcionario ( cpf );

ALTER TABLE trabalha_em
    ADD CONSTRAINT trabalha_em_projeto_fk FOREIGN KEY ( numero_projeto )
        REFERENCES projeto ( numero_projeto );



-- Relat�rio do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
