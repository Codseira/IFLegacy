create table Usuario(
    ID_Usuario INT PRIMARY KEY auto_increment,
    Nome VARCHAR(128) NOT NULL,
    Email VARCHAR(120) NOT NULL UNIQUE,
    DataNascimento DATE NOT NULL,
    Senha VARCHAR(30) NOT NULL,
    Biografia  VARCHAR(128),
    CPF INT(11) NOT NULL UNIQUE,
    TELEFONE INT(11) NOT NULL UNIQUE,
    PRONOME VARCHAR(30),
    ATIVIDADESTATUS VARCHAR(20) NOT NULL
);

create table Administrador(
    ID_Administrador INT PRIMARY KEY auto_increment,
    Nome VARCHAR(128) NOT NULL,
    Email VARCHAR(120) NOT NULL UNIQUE,
    DataNascimento DATE NOT NULL,
    Senha VARCHAR(30) NOT NULL,
    Biografia  VARCHAR(128),
    CPF INT(11) NOT NULL UNIQUE,
    TELEFONE INT(11) NOT NULL UNIQUE,
    PRONOME VARCHAR(30),
    ATIVIDADESTATUS VARCHAR(20) NOT NULL,
    SALARIO FLOAT(30) NOT NULL
);

create table Publicacao(
    ID_Publicacao INT PRIMARY KEY auto_increment,
    Descricao VARCHAR(512) NOT NULL,
    DataPostagem DATE NOT NULL,
    Tema VARCHAR(100) NOT NULL,
    ID_Usuario INT NOT NULL,
    constraint fk_Publicacao_Usuario FOREIGN KEY (ID_Usuario) REFERENCES (ID_Publicacao),
    Localizacao VARCHAR(128) NOT NULL,
    PublicacaoStatus VARCHAR(16) NOT NULL,
    Observacao varchar(128),
    ID_Midia int not null,
    constraint fk_Publicacao_Midia foreign key (ID_Midia) references (ID_Publicacao)
);


create table Midia(
     ID_Midia int primary key auto_increment,
     nome varchar(50),
     arquivo file not null,
     tipoArquivo varchar(5)
);

create table Comentario(
     ID_Comentario int primary key auto_increment,
     DataComentario date not null,
     constraint fk_Comentario_Usuario foreign key(ID_Usuario) references(ID_Comentario),
     constraint fk_Comentario_Publicacao foreign key(ID_Publicacao) references(ID_Comentario)
);

create table Gerenciar(
    ID_Usuario int primary key,
    ID_Administrador int primary key,
    AtividadePeriodo varchar(30) not null,
    GerenciarHistorico varchar(128) not null,
    Observacao varchar(128)
);