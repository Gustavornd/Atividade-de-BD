CREATE TABLE Pessoa(
cpf VARCHAR(11),
tipopessoa VARCHAR(20),
datanascimento DATE,
nome VARCHAR(50),
cep VARCHAR(8),
bairro VARCHAR(30),
numero INT,
rua VARCHAR(25)
);


CREATE TABLE telefonepessoa(
cpfpessoa VARCHAR(11),
telefone VARCHAR(11)
);


CREATE TABLE integrante(
cpfpessoa VARCHAR(11)
);


CREATE TABLE espectador(
cpfpessoa VARCHAR(11),
codigo INT NOT NULL UNIQUE
);


CREATE TABLE funcionario(
cpfpessoa VARCHAR(11),
numeroregistro INT NOT NULL UNIQUE,
tipofuncionario VARCHAR(3),
cargo VARCHAR(10)
);


CREATE TABLE turnofuncionario(
cpffuncionario VARCHAR(11),
horainicio VARCHAR(10),
data DATE,
horafim VARCHAR(10) NOT NULL
);


CREATE TABLE webmaster(
cpffuncionario VARCHAR(11) NOT NULL,
email VARCHAR(50) NOT NULL
);


CREATE TABLE profissionalseg(
cpffuncionario VARCHAR(11) NOT NULL,
nrocredencial INT NOT NULL UNIQUE,
localizacao VARCHAR(50),
cnpjseguranca VARCHAR(14)
);


CREATE TABLE medico(
cpffuncionario VARCHAR(11) NOT NULL,
crm INT UNIQUE,
cnpjambulatorio VARCHAR(14)
);


CREATE TABLE ambulatorio(
cnpjservico VARCHAR(14),
capacidade INT,
nome VARCHAR(50)
);


CREATE TABLE seguranca(
cnpjservico VARCHAR(14),
nome VARCHAR(50)
);


CREATE TABLE Telefoneservico(
cnpjservico VARCHAR(14),
telefone VARCHAR(11)
);


CREATE TABLE servico(
cnpj VARCHAR(14),
tiposervico VARCHAR(11)
);


CREATE TABLE ocorrencia(
numero INT,
data DATE NOT NULL,
descricao VARCHAR(50),
cpfprofissionalseg VARCHAR(14),
longitude INT,
latitude INT
);


CREATE TABLE ocorrenciapessoa(
cpfpessoa VARCHAR(11),
numeroocorrencia INT
);


CREATE TABLE post(
id INT,
texto VARCHAR(250),
datacriacao DATE,
urlblog VARCHAR(100),
cpfwebmaster VARCHAR(11)
); 


CREATE TABLE comentario(
id INT,
autor VARCHAR(50),
email VARCHAR(250),
datacomentario DATE,
texto VARCHAR(250),
idpost INT,
idresposta INT
);


CREATE TABLE blog(
url VARCHAR(50),
datacriacao DATE,
nome VARCHAR(20),
datalineup DATE NOT NULL
);


CREATE TABLE lineup(
data DATE,
capacidade INT
);



CREATE TABLE show(
nomelocal VARCHAR(50),
datalineup DATE,
horainicio VARCHAR(10)
);


CREATE TABLE local(
nome VARCHAR(50)
);


CREATE TABLE banda(
nome VARCHAR(50),
historia VARCHAR(250),
site VARCHAR(100),
ordemapresentacao INT,
nomelocalshow VARCHAR(50),
datalineupshow DATE,
horainicioshow VARCHAR(10)
);


CREATE TABLE integrantebanda(
nomebanda VARCHAR(50),
cpfintegrante VARCHAR(11),
historia VARCHAR(200),
datainicio DATE,
funcao VARCHAR(50)
);


CREATE TABLE ingresso(
numero INT,
valor INT,
datalineupentrada DATE,
horaentrada VARCHAR(10),
cpfespectador VARCHAR(11) NOT NULL,
pertencedatalineup DATE
);


CREATE TABLE restaurante(
cnpj VARCHAR(14),
nome VARCHAR(50),
especialidade VARCHAR(10),
cep VARCHAR(8),
bairro VARCHAR(50),
numero INT,
rua VARCHAR(20),
latitude INT, 
longitude INT 
);



CREATE TABLE horariofunrest(
cnpjrestaurante VARCHAR(14),
horainicio VARCHAR(10),
horafim VARCHAR(10),
diasemana VARCHAR(15)
);


CREATE TABLE atendimento(
cpfpessoa VARCHAR(11),
cpfmedico VARCHAR(11),
datatendimento DATE,
descricao VARCHAR(250))
;


CREATE TABLE hospedagem(
cnpj VARCHAR(14),
nome VARCHAR(50),
capacidade INT, 
tipohospedagem VARCHAR(20),
latitude INT,
longitude INT,
rua VARCHAR(20),
numero INT,
bairro VARCHAR(20),
cep VARCHAR(8)
);

