/*
create table CLIENTE(
Cod_Cliente integer primary key not null,
Nome_Cliente varchar(50),
Endereco varchar(50),
Cidade varchar(50),
CEP char(8),
UF char(2),
CNPJ numeric(20),
IE numeric(20)
);
*/
/*
create table VENDEDOR(
Cod_Vendedor integer primary key not null,
Nome_Vendedor varchar(50),
Sal_Fixo numeric(10,2),
Faixa_Comissao char(1)
);
*/

insert into VENDEDOR(Cod_Vendedor,Nome_Vendedor,Sal_Fixo,Faixa_Comissao)
values
(209,'Jóse',1800.00,'C'),
(111,'Carlos',2490.00,'A'),
(11,'João',2780.00,'C'),
(240,'Antônio',9500.00,'C'),
(720,'Felipe',4600.00,'A'),
(213,'Jonas',2300.00,'A'),
(101,'João',2650.00,'C'),
(310,'Josias',870.00,'i'),
(250,'Mauricio',2930.00,'t');

select * from VENDEDOR;

create table PEDIDO(
Num_Pedido integer primary key not null,
Prazo_Entrega integer,
Cod_Cliente integer,
Cod_Vendedor integer
FOREIGN KEY (Cod_Cliente) REFERENCES CLIENTE,
FOREIGN KEY (Cod_Vendedor) REFERENCES VENDEDOR,
);

create table ITEM_DO_PEDIDO(
Num_Pedido integer,
Cod_Produto integer,
Quantidade integer
FOREIGN KEY (Num_Pedido) REFERENCES PEDIDO,
FOREIGN KEY (Cod_Produto) REFERENCES PRODUTO,
);

insert into ITEM_DO_PEDIDO(Num_Pedido,Cod_Produto,Quantidade)
values
(121,	25,	10),
(121,	31,	35),
(97,	77,	20),
(101,	31,	9),
(101,	78,	18),
(101,	13,NULL	),
(98,	77,NULL	),
(148,	45,	8),
(148,	31,	7),
(148,	77,	3),
(148,	25,	10),
(148,	78,	30),
(104,	53,	32),
(203,	31,	6),
(189,	78,	45),
(143,	31,	20),
(143,	78,	10),
(105,	78,	10),
(111,	25,	10),
(111,	78,	70),
(103,	53,	37),
(91,	77,	40),
(138,	22,	10),
(138,	77,	NULL),
(138,	53,	18),
(108,	13,	NULL),
(119,	77,	40),
(119,	13,	6),
(119,	22,	10),
(119,	53,	43),
(137,	13,	8
);

select * from ITEM_DO_PEDIDO;

create table PRODUTO(
Cod_Produto integer primary key not null,
Uni_produto char(3),
Desc_produto varchar(50),
Valor_Unit numeric(10,2)
);

insert into PRODUTO(Cod_Produto,Uni_produto,Desc_produto,Valor_Unit)
values
(25,'Kg','Queijo',0.97),
(31,'BAR','Chocolate',0.87),
(78,'L','Vinho',2.00),
(22,'M','Linho',0.11),
(30,'SAC','Açúcar',0.30),
(53,'M','Linha',1.80),
(13,'G','Ouro',6.18),
(45,'M','Madeira',0.25),
(87,'M','Cano',1.97),
(77,'M','Papel',1.05);

insert into PEDIDO(Num_Pedido,Prazo_Entrega,Cod_Cliente,Cod_Vendedor)
values
(97,20,720,101),
(101,	15,	720,	101),
(137,	20,	720,	720),
(148,	20,	720,	101),
(189,	15,	870,	213),
(104,	30,	110,	101),
(203,	30,	830,	250),
(98,	20,	410,	209),
(143,	30,	20,	111),
(105,	15,	180,	240),
(111,	20,	260,	240),
(103,	20,	260,	11),
(91,	20,	260,	11),
(138,	20,	260,	11),
(108,	15,	290,	310),
(119,	30, 390,	250),
(127,	10,	410,	11);

select * from PEDIDO;

insert into CLIENTE(Cod_Cliente,Nome_Cliente,Endereco,Cidade,CEP,UF,CNPJ,IE)
values
(110,'Jorge','Rua Caiapo 13','Curitiba',30078500,'PR',1451276498349,NULL),
(222,'Lúcia','Rua Itabira 123 Loja 9','Belo Horizonte',22124391,'MG',2831521393488,2985),
(830,'Mauricio','Av. Paulista 1236 s1/2345','São Paulo',3012683,'SI',3281698574656,9343),
(130,'Edmar','Rua da Praia sn/','Salvador',30079300,'BA',234632842349,7121),
(410,	'Rodolfo',	'Largo da Lapa 27 sobrado',	'Rio de Janeiro',	30078900,	'RJ',	1283512823469,	7431),
(20,	'Beth',	'Av. Climério n. 45',	'São Paulo',	25679300,	'SI',	3248512673268,	9280),
(157,	'Paulo',	'Tv. Moraes c/3',	'Londrina',NULL,		'PR',	328482233242,	1923),
(180,	'Lívia',	'Av. Beira Mar n.1256',	'Florianópolis',	30077500,	'SC',	1273657123474,NULL),	
(260,	'Susana',	'Rua Lopes Mendes 12',	'Niterói',	30046500,	'RJ',	217635712329,	2530),
(290,	'Renato',	'Rua Meireles n. 123 b1.2 s1.345',	'São Paulo',	30225900,	'SI',	1327657112314,	1820),
(390,	'Sebastião',	'Rua da Igreja n. 10',	'Uberaba',	304387,	'MG',	321765472133,	9071),
(234,	'José',	'Quadra 3 bl. 3 sl.1003',	'Brasília',	22841650,	'DF',	2176357612323,	2931);



/*1-Listar todos os produtos com as respectivas descrições, Unidades e valores unitários.
select Uni_produto,Desc_produto,Valor_Unit from PRODUTO;
*/

/*2-Listar na tabela cliente o cnpj, nome, endereco*/
select CNPJ ,Nome_Cliente,Endereco from CLIENTE

/*3-Listar todo o conteudo do vendedor*/
select * from VENDEDOR

/*4-Listar na tabela Vendedor trazer numero,Nome,rendimentos,comissao*/
select Cod_Vendedor as Numero, Nome_Vendedor as Nome, Sal_Fixo as Rendimentos, Faixa_Comissao as Comissao from VENDEDOR

/*5-