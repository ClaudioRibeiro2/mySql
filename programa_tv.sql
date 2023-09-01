CREATE DATABASE IF NOT EXISTS atividade;
use atividade;

create table if not exists tipo (
	id_tipo int not null auto_increment,
    nome varchar(60),
    primary key (id_tipo)
);
create table if not exists pais (
	id_pais int not null auto_increment,
    nome varchar(60),
    primary key (id_pais)
);
create table if not exists programatv (
	id_programa int not null auto_increment,
    titulo varchar(60),
    ano year,
    fk_id_tipo int not null,
    primary key (id_programa),
    foreign key (fk_id_tipo) references tipo (id_tipo)
);
create table if not exists contatos (
	id_contato int not null auto_increment,
    nome varchar(60),
    email varchar(60),
    senha varchar(15),
    primary key (id_contato)
);
create table if not exists ator (
	id_ator int not null auto_increment,
    nome varchar(60),
    fk_id_pais int not null,
    primary key (id_ator),
    foreign key (fk_id_pais) references pais(id_pais)
);
create table if not exists genero (
	id_genero int not null auto_increment,
    nome varchar(60),
    primary key (id_genero)
);
create table if not exists plataforma (
	id_plataforma int not null auto_increment,
    nome varchar(60),
    primary key (id_plataforma)
);
create table if not exists prog_informacoes (
	id_prog_inf int not null auto_increment,
    titulo_original varchar(60),
    sinopse text,
    fk_id_pais int not null,
    fk_id_programa int not null,
    primary key (id_prog_inf),
    foreign key (fk_id_pais) references pais(id_pais),
	foreign key (fk_id_programa) references programatv(id_programa)
);
-- RELACIONAMENTOS N:N:
	-- ProgramaTV e Contatos
create table if not exists avaliacao (
	nota decimal(15,2),
    fk_id_programa int not null,
    fk_id_contato int not null,
    foreign key (fk_id_programa) references programatv(id_programa),
    foreign key (fk_id_contato) references contatos(id_contato)
);
	-- ProgramaTV e Ator
create table if not exists pro_elenco (
    chk_ator boolean,
    chk_diretor boolean,
	fk_id_programa int not null,
    fk_id_ator int not null,
    foreign key (fk_id_programa) references programatv(id_programa),
    foreign key (fk_id_ator) references ator(id_ator)
);
	-- ProgramaTV e Genero
create table if not exists prog_genero (
	fk_id_programa int not null,
    fk_id_genero int not null,
    foreign key (fk_id_programa) references programatv(id_programa),
    foreign key (fk_id_genero) references genero(id_genero)
);
	-- ProgramaTV e Plataforma
create table if not exists disponibilidade (
	fk_id_programa int not null,
    fk_id_plataforma int not null,
    foreign key (fk_id_programa) references programatv(id_programa),
    foreign key (fk_id_plataforma) references plataforma(id_plataforma)
);