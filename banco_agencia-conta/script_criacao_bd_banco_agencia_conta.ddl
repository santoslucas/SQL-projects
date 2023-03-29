-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-03-10 16:12:35 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE agencia (
    cod_agencia NUMBER(5) NOT NULL,
    gerente     VARCHAR2(50) NOT NULL,
    cod_banco   NUMBER(5) NOT NULL
);

ALTER TABLE agencia ADD CONSTRAINT agencia_pk PRIMARY KEY ( cod_agencia );

ALTER TABLE agencia ADD CONSTRAINT agencia_gerente_un UNIQUE ( gerente );

CREATE TABLE banco (
    cod_banco NUMBER(5) NOT NULL,
    nome      VARCHAR2(30) NOT NULL
);

ALTER TABLE banco ADD CONSTRAINT banco_pk PRIMARY KEY ( cod_banco );

CREATE TABLE conta (
    cod_agencia NUMBER(5) NOT NULL,
    num_conta   NUMBER(5) NOT NULL,
    cpf         VARCHAR2(11) NOT NULL,
    saldo       NUMBER(7, 2) NOT NULL
);

ALTER TABLE conta ADD CONSTRAINT conta_ck_saldo_nao_negativo CHECK ( saldo >= 0 );

ALTER TABLE conta ADD CONSTRAINT conta_pk PRIMARY KEY ( num_conta,
                                                        cod_agencia );

ALTER TABLE conta ADD CONSTRAINT conta_cpf_un UNIQUE ( cpf );

ALTER TABLE agencia
    ADD CONSTRAINT agencia_banco_fk FOREIGN KEY ( cod_banco )
        REFERENCES banco ( cod_banco );

ALTER TABLE conta
    ADD CONSTRAINT conta_agencia_fk FOREIGN KEY ( cod_agencia )
        REFERENCES agencia ( cod_agencia )
            ON DELETE CASCADE;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              8
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
