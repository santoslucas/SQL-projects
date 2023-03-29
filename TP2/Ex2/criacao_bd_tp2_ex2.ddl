-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-03-27 21:58:38 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE casamento (
    id_conjuge1    NUMBER(2) NOT NULL,
    id_conjuge2    NUMBER(2) NOT NULL,
    data_casamento DATE NOT NULL
);

ALTER TABLE casamento ADD CONSTRAINT casamento_id_difs CHECK ( id_conjuge1 != id_conjuge2 );

ALTER TABLE casamento ADD CONSTRAINT casamento_pk PRIMARY KEY ( id_conjuge1,
                                                                id_conjuge2 );

CREATE TABLE pessoa (
    id_pessoa       NUMBER(2) NOT NULL,
    nome_pessoa     VARCHAR2(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_pai          NUMBER(2),
    id_mae          NUMBER(2)
);

ALTER TABLE pessoa ADD CONSTRAINT pessoa_pais_diff CHECK ( id_pai != id_mae );

ALTER TABLE pessoa ADD CONSTRAINT pessoa_pk PRIMARY KEY ( id_pessoa );

ALTER TABLE casamento
    ADD CONSTRAINT casamento_pessoa_c1_fk FOREIGN KEY ( id_conjuge1 )
        REFERENCES pessoa ( id_pessoa )
            ON DELETE CASCADE;

ALTER TABLE casamento
    ADD CONSTRAINT casamento_pessoa_c2_fk FOREIGN KEY ( id_conjuge2 )
        REFERENCES pessoa ( id_pessoa )
            ON DELETE CASCADE;

ALTER TABLE pessoa
    ADD CONSTRAINT pessoa_mae_fk FOREIGN KEY ( id_mae )
        REFERENCES pessoa ( id_pessoa );

ALTER TABLE pessoa
    ADD CONSTRAINT pessoa_pai_fk FOREIGN KEY ( id_pai )
        REFERENCES pessoa ( id_pessoa );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             2
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
