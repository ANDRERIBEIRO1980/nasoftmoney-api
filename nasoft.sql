/*
   
install:install-file -Dfile=C:\AmbienteJava\ojdbc6.jar -DgroupId=oracle -DartifactId=ojdbc6 -Dversion=11.2.0.3 -Dpackaging=jar

create user nasoft
      identified by nasoft
     default tablespace system
     temporary tablespace TEMP;
grant create session, connect, resource to nasoft;
GRANT create session,create table,create view TO nasoft;
GRANT create session,create table,create view TO nasoft;

CREATE TABLE categoria ( 
   codigo number(20) PRIMARY KEY, 
   nome VARCHAR(50) NOT NULL 
 );
 
create sequence CATEGORIA_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocache
cycle;
  
INSERT INTO categoria (codigo,nome) values (CATEGORIA_SEQ.NEXTVAL,'Lazer'); 
INSERT INTO categoria (codigo,nome) values (CATEGORIA_SEQ.NEXTVAL,'Alimentacao'); 
INSERT INTO categoria (codigo,nome) values (CATEGORIA_SEQ.NEXTVAL,'Supermercado'); 
INSERT INTO categoria (codigo,nome) values (CATEGORIA_SEQ.NEXTVAL,'Farmacia'); 
INSERT INTO categoria (codigo,nome) values (CATEGORIA_SEQ.NEXTVAL,'Outros'); 
 
CREATE TABLE pessoa (
  codigo NUMBER(20),
  nome VARCHAR(50) NOT NULL,
  logradouro VARCHAR(30),
  numero VARCHAR(30),
  complemento VARCHAR(30),
  bairro VARCHAR(30),
  cep VARCHAR(30),
  cidade VARCHAR(30),
  estado VARCHAR(30),
  ativo CHAR(1))
  
  ALTER TABLE pessoa ADD CONSTRAINT PESSOA_PK PRIMARY KEY (CODIGO)

create sequence PESSOA_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocache
cycle;  

INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'João Silva', 'Rua do Abacaxi', '10', null, 'Brasil', '38.400-12', 'Uberlândia', 'MG', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Maria Rita', 'Rua do Sabiá', '110', 'Apto 101', 'Colina', '11.400-12', 'Ribeirão Preto', 'SP', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Pedro Santos', 'Rua da Bateria', '23', null, 'Morumbi', '54.212-12', 'Goiânia', 'GO', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Ricardo Pereira', 'Rua do Motorista', '123', 'Apto 302', 'Aparecida', '38.400-12', 'Salvador', 'BA', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Josué Mariano', 'Av Rio Branco', '321', null, 'Jardins', '56.400-12', 'Natal', 'RN', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Pedro Barbosa', 'Av Brasil', '100', null, 'Tubalina', '77.400-12', 'Porto Alegre', 'RS', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Henrique Medeiros', 'Rua do Sapo', '1120', 'Apto 201', 'Centro', '12.400-12', 'Rio de Janeiro', 'RJ', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Carlos Santana', 'Rua da Manga', '433', null, 'Centro', '31.400-12', 'Belo Horizonte', 'MG', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Leonardo Oliveira', 'Rua do Músico', '566', null, 'Segismundo Pereira', '38.400-00', 'Uberlândia', 'MG', 'A');
INSERT INTO pessoa (CODIGO,nome, logradouro, numero, complemento, bairro, cep, cidade, estado, ativo) values (PESSOA_SEQ.NEXTVAL,'Isabela Martins', 'Rua da Terra', '1233', 'Apto 10', 'Vigilato', '99.400-12', 'Manaus', 'AM', 'A');



CREATE TABLE lancamento (
	codigo NUMBER(20),
	descricao VARCHAR(50) NOT NULL,
	data_vencimento DATE NOT NULL,
	data_pagamento DATE,
	valor NUMBER(10,2) NOT NULL,
	observacao VARCHAR(100),
	tipo VARCHAR(20) NOT NULL,
	codigo_categoria NUMBER NOT NULL,
	codigo_pessoa NUMBER NOT NULL,
	FOREIGN KEY (codigo_categoria) REFERENCES categoria(codigo),
	FOREIGN KEY (codigo_pessoa) REFERENCES pessoa(codigo)
) 
create sequence LANCAMENTO_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocache
cycle;  

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL, 'Salário mensal', to_date('2017-06-10','RRRR-MM-DD'), null, 6500.00, 'Distribuição de lucros', 'RECEITA', 1, 1);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Bahamas', to_date('2017-02-10','RRRR-MM-DD'), to_date('2017-02-10','RRRR-MM-DD'), 100.32, null, 'DESPESA', 2, 2);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Top Club', to_date('2017-06-10','RRRR-MM-DD'), null, 120, null, 'RECEITA', 3, 3);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'CEMIG', to_date('2017-02-10','RRRR-MM-DD'), to_date('2017-02-10','RRRR-MM-DD'), 110.44, 'Geração', 'RECEITA', 3, 4);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'DMAE', to_date('2017-06-10','RRRR-MM-DD'), null, 200.30, null, 'DESPESA', 3, 5);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Extra', to_date('2017-03-10','RRRR-MM-DD'), to_date('2017-03-10','RRRR-MM-DD'), 1010.32, null, 'RECEITA', 4, 6);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Bahamas', to_date('2017-06-10','RRRR-MM-DD'), null, 500, null, 'RECEITA', 1, 7);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Top Club', to_date('2017-03-10','RRRR-MM-DD'), to_date('2017-03-10','RRRR-MM-DD'), 400.32, null, 'DESPESA', 4, 8);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Despachante', to_date('2017-06-10','RRRR-MM-DD'), null, 123.64, 'Multas', 'DESPESA', 3, 9);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Pneus', to_date('2017-04-10','RRRR-MM-DD'), to_date('2017-04-10','RRRR-MM-DD'), 665.33, null, 'RECEITA', 5, 10);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Café', to_date('2017-06-10','RRRR-MM-DD'), null, 8.32, null, 'DESPESA', 1, 5);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Eletrônicos', to_date('2017-04-10','RRRR-MM-DD'), to_date('2017-04-10','RRRR-MM-DD'), 2100.32, null, 'DESPESA', 5, 4);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Instrumentos', to_date('2017-06-10','RRRR-MM-DD'), null, 1040.32, null, 'DESPESA', 4, 3);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Café', to_date('2017-04-10','RRRR-MM-DD'), to_date('2017-04-10','RRRR-MM-DD'), 4.32, null, 'DESPESA', 4, 2);
INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa) values (LANCAMENTO_SEQ.NEXTVAL,'Lanche', to_date('2017-06-10','RRRR-MM-DD'), null, 10.20, null, 'DESPESA', 4, 1);

CREATE TABLE usuario (
	codigo NUMBER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(150) NOT NULL
) ;

INSERT INTO usuario (codigo, nome, email, senha) values (1, 'Administrador', 'admin@algamoney.com', '$2a$10$X607ZPhQ4EgGNaYKt3n4SONjIv9zc.VMWdEuhCuba7oLAL5IvcL5.');
INSERT INTO usuario (codigo, nome, email, senha) values (2, 'Maria Silva', 'maria@algamoney.com', '$2a$10$Zc3w6HyuPOPXamaMhh.PQOXvDnEsadztbfi6/RyZWJDzimE8WQjaq');


CREATE TABLE permissao (
	codigo NUMBER PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

INSERT INTO permissao (codigo, descricao) values (1, 'ROLE_CADASTRAR_CATEGORIA');
INSERT INTO permissao (codigo, descricao) values (2, 'ROLE_PESQUISAR_CATEGORIA');

INSERT INTO permissao (codigo, descricao) values (3, 'ROLE_CADASTRAR_PESSOA');
INSERT INTO permissao (codigo, descricao) values (4, 'ROLE_REMOVER_PESSOA');
INSERT INTO permissao (codigo, descricao) values (5, 'ROLE_PESQUISAR_PESSOA');

INSERT INTO permissao (codigo, descricao) values (6, 'ROLE_CADASTRAR_LANCAMENTO');
INSERT INTO permissao (codigo, descricao) values (7, 'ROLE_REMOVER_LANCAMENTO');
INSERT INTO permissao (codigo, descricao) values (8, 'ROLE_PESQUISAR_LANCAMENTO');

CREATE TABLE usuario_permissao (
	codigo_usuario NUMBER NOT NULL,
	codigo_permissao NUMBER NOT NULL,
	PRIMARY KEY (codigo_usuario, codigo_permissao),
	FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo),
	FOREIGN KEY (codigo_permissao) REFERENCES permissao(codigo)
) ;

-- admin
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 1);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 2);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 3);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 4);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 5);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 6);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 7);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 8);

-- maria
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 2);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 5);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 8);



SELECT 'SELECT * FROM ' || OBJECT_NAME || ';'
  FROM ALL_OBJECTS
 WHERE OWNER = 'NASOFT'
   AND OBJECT_TYPE = 'TABLE'

*/
SELECT * FROM LANCAMENTO for update;
SELECT * FROM CATEGORIA;
SELECT * FROM PESSOA for update;
SELECT * FROM USUARIO;
SELECT * FROM USUARIO_PERMISSAO;
SELECT * FROM PERMISSAO;

