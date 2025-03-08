CREATE TABLE Autor (
Id_Autor INTEGER auto_increment,
Nome VARCHAR(255) not null,
Data_Nascimento DATE not null,
CPF char(11) not null,
PRIMARY KEY (Id_Autor)
);

CREATE TABLE Categoria (
Id_Categoria INTEGER auto_increment,
Descricao VARCHAR(100) not null,
PRIMARY KEY(Id_Categoria)
);

CREATE TABLE Livro (
Id_Livro INTEGER auto_increment,
Id_Categoria INTEGER not null,
Titulo VARCHAR(255) not null,
Editora VARCHAR(150) not null,
Ano Year not null,
Isbn VARCHAR(100) not null,
PRIMARY KEY( Id_Livro),
FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria)
);

CREATE TABLE Aluno (
Id_Aluno INTEGER auto_increment ,
Nome VARCHAR(150),
RA INTEGER,
Curso VARCHAR(150),
PRIMARY KEY(Id_Aluno)
);

CREATE TABLE Usuario (
Id_Usuario INTEGER,
Nome VARCHAR(150),
Email VARCHAR(150),
Senha VARCHAR(100),
PRIMARY KEY(Id_Usuario)
);

CREATE TABLE Livro_Autor_Assoc (
Id_Livro INTEGER not null,
Id_Autor INTEGER not null,
FOREIGN KEY(Id_Livro) REFERENCES Livro (Id_Livro),
FOREIGN KEY(Id_Autor) REFERENCES Autor (Id_Autor),
PRIMARY KEY(Id_Livro, Id_Autor)
);

CREATE TABLE Emprestimo (
Id_Emprestimo INTEGER auto_increment,
Data_Emprestimo DATE not null,
Data_Devolucao DATE not null,
Id_Usuario INTEGER not null,
Id_Livro INTEGER not null,
Id_Aluno INTEGER not null,
PRIMARY KEY(Id_Emprestimo),
FOREIGN KEY(Id_Usuario) REFERENCES Usuario (Id_Usuario),
FOREIGN KEY(Id_Livro) REFERENCES Livro (Id_Livro),
FOREIGN KEY(Id_Aluno) REFERENCES Aluno (Id_Aluno)
);

ALTER TABLE Emprestimo ADD FOREIGN KEY(Id_Livro) REFERENCES Livro (Id_Livro);
ALTER TABLE Emprestimo ADD FOREIGN KEY(Id_Aluno) REFERENCES Aluno (Id_Aluno);
ALTER TABLE Livro ADD FOREIGN KEY(Id_Categoria) REFERENCES Categoria (Id_Categoria);