--SQL de criação das tabelas
create table Funcionario(
	codigofuncionario serial not null primary key,
	nomefuncionario varchar(40) not null,
	cpffuncionario char(11) not null unique 
);

create table cidades(
	codigocidade serial primary key,
	nomecidade varchar(50) not null
);

create table UnidadeFederativa(
	codigouf char(2) not null primary key,
	nomeuf varchar(30) unique
);

create table Cliente(
	codigocliente serial not null primary key,
	nomecliente varchar(40) not null,
	emailcliente varchar(50) not null unique,
	nomedeusuariocliente varchar(20) not null unique,
	cpfcliente char(11) not null unique,
	datadenascimentocliente date not null,
	rua varchar(50) not null,
	numero int4 not null,
	bairro varchar(30) not null,
	cep char(8) not null,
	complementoendereco varchar(100),
	telefone varchar(11) unique not null,
	codigocidade int4 not null references cidades(codigocidade) ,
	codigouf varchar(2) not null references unidadefederativa (codigouf)
); 


create table Categoria(
	codigocategoria serial not null primary key,
	nomecategoria varchar(20) not null unique,
	descricaocategoria text
);

create table Produto(
	codigoproduto serial primary key,
	nomeproduto varchar(30) unique not null,
	descricaoproduto text,
	quantidadeemestoque int4 not null,
	datadefabricacao date not null default now(),
	valorunitario real not null,
	CodigoCategoria int4 not null References categoria (codigocategoria),
	CodigoFuncionario int4 not null references funcionario (codigofuncionario)
);

create table Pedido(
	codigopedido serial primary key,
	datadopedido date not null default now(),
	codigocliente int4 not null references cliente (codigocliente)
);

create table Pedido_Rel_Produto(
	codigoPedidoRelProduto serial primary key,
	quantidadepedidadoproduto int4 not null,
	codigopedido int4 not null references pedido (codigopedido),
	codigoproduto int4 not null references produto (codigoproduto)
);


