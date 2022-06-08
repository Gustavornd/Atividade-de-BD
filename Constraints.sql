
ALTER TABLE Pessoa ADD CONSTRAINT PK_Pessoa PRIMARY KEY(cpf);

ALTER TABLE telefonepessoa ADD CONSTRAINT PK_TelefonePessoa PRIMARY KEY(cpfpessoa,telefone); 
ALTER TABLE telefonepessoa ADD CONSTRAINT FK_TelefonePessoa FOREIGN KEY(cpfpessoa) REFERENCES Pessoa(cpf) ON DELETE SET NULL;

ALTER TABLE integrante ADD CONSTRAINT PK_Integrante PRIMARY KEY(cpfpessoa);
ALTER TABLE integrante ADD CONSTRAINT FK_Integrante FOREIGN KEY(cpfpessoa) REFERENCES Pessoa(cpf) ON DELETE SET NULL;

ALTER TABLE espectador ADD CONSTRAINT PK_Espectador PRIMARY KEY(cpfpessoa);
ALTER TABLE espectador ADD CONSTRAINT FK_Espectador FOREIGN KEY(cpfpessoa) REFERENCES Pessoa(cpf) ON DELETE SET NULL;

ALTER TABLE funcionario ADD CONSTRAINT PK_Funcionario PRIMARY KEY(cpfpessoa);
ALTER TABLE funcionario ADD CONSTRAINT FK_Funcionario FOREIGN KEY(cpfpessoa) REFERENCES Pessoa(cpf) ON DELETE SET NULL;

ALTER TABLE turnofuncionario ADD CONSTRAINT PK_TurnoFunc PRIMARY KEY(cpffuncionario, horainicio, data);
ALTER TABLE turnofuncionario ADD CONSTRAINT FK_TurnoFunc FOREIGN KEY(cpffuncionario) REFERENCES funcionario(cpfpessoa) ON DELETE SET NULL;

ALTER TABLE webmaster ADD CONSTRAINT PK_WebMaster PRIMARY KEY(cpffuncionario);
ALTER TABLE webmaster ADD CONSTRAINT FK_WebMaster FOREIGN KEY(cpffuncionario) REFERENCES funcionario(cpfpessoa) ON DELETE SET NULL;

ALTER TABLE servico ADD CONSTRAINT PK_Servico PRIMARY KEY(cnpj);

ALTER TABLE ambulatorio ADD CONSTRAINT PK_Ambulatorio PRIMARY KEY(cnpjservico);
ALTER TABLE ambulatorio ADD CONSTRAINT FK_Ambulatorio FOREIGN KEY(cnpjservico) REFERENCES servico(cnpj) ON DELETE SET NULL;

ALTER TABLE medico ADD CONSTRAINT PK_Medico PRIMARY KEY(cpffuncionario);
ALTER TABLE medico ADD CONSTRAINT FK_Medico FOREIGN KEY(cpffuncionario) REFERENCES funcionario(cpfpessoa) ON DELETE SET NULL;
ALTER TABLE medico ADD CONSTRAINT FK_Medico2 FOREIGN KEY(cnpjambulatorio) REFERENCES ambulatorio(cnpjservico) ON DELETE SET NULL;

ALTER TABLE seguranca ADD CONSTRAINT PK_Seguranca PRIMARY KEY(cnpjservico);
ALTER TABLE seguranca ADD CONSTRAINT FK_Seguranca FOREIGN KEY(cnpjservico) REFERENCES servico(cnpj) ON DELETE SET NULL;

ALTER TABLE profissionalseg ADD CONSTRAINT PK_ProfiSeg PRIMARY KEY(cpffuncionario);
ALTER TABLE profissionalseg ADD CONSTRAINT FK_ProfiSeg FOREIGN KEY(cpffuncionario) REFERENCES funcionario(cpfpessoa) ON DELETE SET NULL;
ALTER TABLE profissionalseg ADD CONSTRAINT FK_ProfiSeg2 FOREIGN KEY(cnpjseguranca) REFERENCES Seguranca(cnpjservico) ON DELETE SET NULL;

ALTER TABLE Telefoneservico ADD CONSTRAINT PK_TelefoneServ PRIMARY KEY(cnpjservico, telefone);
ALTER TABLE Telefoneservico ADD CONSTRAINT FK_TelefoneServ FOREIGN KEY(cnpjservico) REFERENCES servico(cnpj) ON DELETE SET NULL;

ALTER TABLE ocorrencia ADD CONSTRAINT PK_Ocorrencia PRIMARY KEY(numero);
ALTER TABLE ocorrencia ADD CONSTRAINT FK_Ocorrencia FOREIGN KEY(cpfprofissionalseg) REFERENCES profissionalseg(cpffuncionario) ON DELETE SET NULL;

ALTER TABLE ocorrenciapessoa ADD CONSTRAINT PK_OcorrenciaP PRIMARY KEY(cpfpessoa, numeroocorrencia);
ALTER TABLE ocorrenciapessoa ADD CONSTRAINT FK_OcorrenciaP FOREIGN KEY(cpfpessoa) REFERENCES Pessoa(cpf) ON DELETE SET NULL;

ALTER TABLE lineup ADD CONSTRAINT PK_LineUp PRIMARY KEY(data);

ALTER TABLE blog ADD CONSTRAINT PK_Blog PRIMARY KEY(url);
ALTER TABLE blog ADD CONSTRAINT FK_Blog FOREIGN KEY(datalineup) REFERENCES lineup(data) ON DELETE SET NULL;

ALTER TABLE post ADD CONSTRAINT PK_Post PRIMARY KEY(id);
ALTER TABLE post ADD CONSTRAINT FK_Post FOREIGN KEY(urlblog) REFERENCES blog(url) ON DELETE SET NULL;
ALTER TABLE post ADD CONSTRAINT FK_Post2 FOREIGN KEY(cpfwebmaster) REFERENCES webmaster(cpffuncionario) ON DELETE SET NULL;

ALTER TABLE comentario ADD CONSTRAINT PK_Comentario PRIMARY KEY(id);
ALTER TABLE comentario ADD CONSTRAINT FK_Comentario FOREIGN KEY(idpost) REFERENCES post(id) ON DELETE SET NULL;
ALTER TABLE comentario ADD CONSTRAINT FK_Comentario2 FOREIGN KEY(idresposta) REFERENCES comentario(id) ON DELETE SET NULL;

ALTER TABLE local ADD CONSTRAINT PK_Local PRIMARY KEY(nome);

ALTER TABLE show ADD CONSTRAINT PK_Show PRIMARY KEY(nomelocal,datalineup,horainicio);
ALTER TABLE show ADD CONSTRAINT FK_Show FOREIGN KEY(nomelocal) REFERENCES local(nome) ON DELETE SET NULL;
ALTER TABLE show ADD CONSTRAINT FK_Show1 FOREIGN KEY(datalineup) REFERENCES lineup(data) ON DELETE SET NULL;

ALTER TABLE banda ADD CONSTRAINT PK_Banda PRIMARY KEY(nome);
ALTER TABLE banda ADD CONSTRAINT FK_Banda FOREIGN KEY(nomelocalshow,datalineupshow,horainicioshow) REFERENCES show(nomelocal,datalineup,horainicio) ON DELETE SET NULL;

ALTER TABLE integrantebanda ADD CONSTRAINT PK_IntegranteB PRIMARY KEY(nomebanda,cpfintegrante);
ALTER TABLE integrantebanda ADD CONSTRAINT FK_IntegranteB FOREIGN KEY(nomebanda) REFERENCES banda(nome) ON DELETE SET NULL;
ALTER TABLE integrantebanda ADD CONSTRAINT FK_IntegranteB1 FOREIGN KEY(cpfintegrante) REFERENCES integrante(cpfpessoa) ON DELETE SET NULL;

ALTER TABLE ingresso ADD CONSTRAINT PK_Ingresso PRIMARY KEY(numero);
ALTER TABLE ingresso ADD CONSTRAINT FK_Ingresso FOREIGN KEY(datalineupentrada) REFERENCES lineup(data) ON DELETE SET NULL;
ALTER TABLE ingresso ADD CONSTRAINT FK_Ingresso2 FOREIGN KEY(pertencedatalineup) REFERENCES lineup(data) ON DELETE SET NULL;
ALTER TABLE ingresso ADD CONSTRAINT FK_Ingresso1 FOREIGN KEY(cpfespectador) REFERENCES espectador(cpfpessoa) ON DELETE SET NULL;

ALTER TABLE restaurante ADD CONSTRAINT PK_Restaurante PRIMARY KEY(cnpj);

ALTER TABLE horariofunrest ADD CONSTRAINT PK_HorarioFunRest PRIMARY KEY(cnpjrestaurante,diasemana);
ALTER TABLE horariofunrest ADD CONSTRAINT FK_HorarioFunRest FOREIGN KEY(cnpjrestaurante) REFERENCES restaurante(cnpj) ON DELETE SET NULL;

ALTER TABLE atendimento ADD CONSTRAINT PK_Atendimento PRIMARY KEY(cpfpessoa,cpfmedico);
ALTER TABLE atendimento ADD CONSTRAINT FK_Atendimento FOREIGN KEY(cpfpessoa) REFERENCES Pessoa(cpf) ON DELETE SET NULL;
ALTER TABLE atendimento ADD CONSTRAINT FK_Atendimento1 FOREIGN KEY(cpfmedico) REFERENCES Medico(cpffuncionario) ON DELETE SET NULL;

ALTER TABLE hospedagem ADD CONSTRAINT PK_Hospedagem PRIMARY KEY(cnpj);


