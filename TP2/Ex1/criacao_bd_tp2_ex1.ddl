-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-03-24 23:36:34 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE departamento (
    numero_departamento NUMBER(2) NOT NULL,
    nome_departamento   VARCHAR2(50) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( numero_departamento );

CREATE TABLE funcionario (
    cpf                  NUMBER(11) NOT NULL,
    pnome                VARCHAR2(50) NOT NULL,
    nomem                VARCHAR2(50) NOT NULL,
    unome                VARCHAR2(50) NOT NULL,
    sexo                 VARCHAR2(1) NOT NULL,
    endereco_funcionario VARCHAR2(50) NOT NULL,
    data_nascimento      DATE NOT NULL,
    numero_departamento  NUMBER(2) NOT NULL
);

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_sexo_ck CHECK ( sexo IN ( 'M', 'F' ) );

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cpf );

CREATE TABLE localizacao_departamento (
    local               VARCHAR2(50) NOT NULL,
    numero_departamento NUMBER(2) NOT NULL
);

ALTER TABLE localizacao_departamento ADD CONSTRAINT localizacao_departamento_pk PRIMARY KEY ( local,
                                                                                              numero_departamento );

ALTER TABLE funcionario
    ADD CONSTRAINT func_dep_fk FOREIGN KEY ( numero_departamento )
        REFERENCES departamento ( numero_departamento )
            ON DELETE CASCADE;

ALTER TABLE localizacao_departamento
    ADD CONSTRAINT local_dep_dep_fk FOREIGN KEY ( numero_departamento )
        REFERENCES departamento ( numero_departamento )
            ON DELETE CASCADE;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              6
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
