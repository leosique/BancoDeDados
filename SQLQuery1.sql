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


create table VENDEDOR(
Cod_Vendedor integer primary key not null,
Nome_Vendedor varchar(50),
Sal_Fixo numeric(10,2),
Faixa_Comissao char(1)
);


insert into VENDEDOR(Cod_Vendedor,Nome_Vendedor,Sal_Fixo,Faixa_Comissao)
values
(209,'José',1800.00,'C'),
(111,'Carlos',2490.00,'A'),
(11,'João',2780.00,'C'),
(240,'Antônio',9500.00,'C'),
(720,'Felipe',4600.00,'A'),
(213,'Jonas',2300.00,'A'),
(101,'João',2650.00,'C'),
(310,'Josias',870.00,'B'),
(250,'Mauricio',2930.00,'B');

select * from CLIENTE;

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
(138,	77,	35),
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
(121,20,410,209),
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

select * from CLIENTE;

insert into CLIENTE(Cod_Cliente,Nome_Cliente,Endereco,Cidade,CEP,UF,CNPJ,IE)
values
(720,'Ana','Rua 17 n. 19','Niterói',24358310,'RJ',12113231000134,2134),
(870,'Flávio','Av. Pres. Vargas 10','São Paulo',22763931,'SP',2253412693879,4631),
(110,'Jorge','Rua Caiapo 13','Curitiba',30078500,'PR',1451276498349,NULL),
(222,'Lúcia','Rua Itabira 123 Loja 9','Belo Horizonte',22124391,'MG',2831521393488,2985),
(830,'Mauricio','Av. Paulista 1236 s1/2345','São Paulo',3012683,'SP',3281698574656,9343),
(130,'Edmar','Rua da Praia sn/','Salvador',30079300,'BA',234632842349,7121),
(410,	'Rodolfo',	'Largo da Lapa 27 sobrado',	'Rio de Janeiro',	30078900,	'RJ',	1283512823469,	7431),
(20,	'Beth',	'Av. Climério n. 45',	'São Paulo',	25679300,	'SP',	3248512673268,	9280),
(157,	'Paulo',	'Tv. Moraes c/3',	'Londrina',NULL,		'PR',	328482233242,	1923),
(180,	'Lívia',	'Av. Beira Mar n.1256',	'Florianópolis',	30077500,	'SC',	1273657123474,NULL),	
(260,	'Susana',	'Rua Lopes Mendes 12',	'Niterói',	30046500,	'RJ',	217635712329,	2530),
(290,	'Renato',	'Rua Meireles n. 123 b1.2 s1.345',	'São Paulo',	30225900,	'SP',	1327657112314,	1820),
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

/*5-nome vendendor, salario fixo * 2*/
select Nome_Vendedor,Sal_Fixo*2 as "Salario fixo * 2"  from VENDEDOR

/*6-Listar o numero do pedido, cod produto, quant items do pedidio = 35 tabela item do pedido*/
select Num_Pedido,Cod_Produto,Quantidade from ITEM_DO_PEDIDO where Quantidade = 35 

/*7-Listar os nomes e a cidade dos clientes que moram em Niterói*/
select Nome_Cliente,Cidade from CLIENTE where Cidade = 'Niteroi'

/*8-Listar os produtos que tenham unidade igual a 'M' e valor unitário igual a R$ 1,05 da tabela produto*/
select Desc_produto from PRODUTO where Uni_produto = 'M' and Valor_Unit = 1.05

/*9-Listar os clientes e seus respectivos endereços, que moram em 'SAO PAULO' ou estejam na faixa de CEP entre '30077000' e '30079000'*/
 select Nome_Cliente,Endereco from CLIENTE where Cidade = 'São Paulo' or CEP BETWEEN 30077000 and 30079000

 /*10-Mostrar todos os pedidos que não tenham prazo de entrega igual a 15 dias*/
 select Num_Pedido from PEDIDO  where Prazo_Entrega != 15

 /*11-Listar o código e a descrição dos produtos que tenham  valor unitário na faixa de R$ 0,32 até R$ 2,00*/
 select Cod_Produto,Desc_produto from PRODUTO where Valor_Unit BETWEEN 0.32 and 2.00

 /*12-Listar todos os produtos que tenham o seu nome começando  por Q*/
 select Desc_produto from PRODUTO where Desc_produto like 'Q%'

 /*13-Listar os vendedores que não começam por 'jo'*/
 select Cod_Vendedor,Nome_Vendedor from VENDEDOR where Nome_Vendedor not like 'jo%'

 /*14-Listar os vendedores em ordem alfabética e que são da faixa de comissão A e B*/
 select Nome_Vendedor from VENDEDOR where Faixa_Comissao = 'A' or Faixa_Comissao = 'B' order by Nome_Vendedor

 /*15-Mostrar os clientes que não tenham inscrição estadual*/
 select * from CLIENTE where IE is NULL

 /*16-Mostrar em ordem alfabética a lista de vendedores e seus respectivos salários fixos*/
 select Nome_Vendedor,Sal_Fixo from VENDEDOR order by Nome_Vendedor

 /*17-Listar os nomes, cidades e estados de todos os clientes, ordenados por estado e cidade de forma descendente*/
 select Nome_Cliente,Cidade,UF from CLIENTE order by UF desc,Cidade desc

 /*18-Mostrar a descrição e o valor unitário de todos os produtos que tenham a unidade 'M', em ordem de valor unitário ascendente*/
 select Desc_produto,Valor_Unit from PRODUTO where Uni_produto = 'M' order by Valor_Unit asc

 /*19-Mostrar o novo salário fixo dos vendedores, de faixa de comissão 'C, calculado com base no reajuste de 75% acrescido de R$ 120.00 de bonificação. Ordenar pelo nome do vendedor*/
 select Nome_Vendedor,(Sal_Fixo * 1.75)+120.00 as 'Novo_Salario' from VENDEDOR where Faixa_Comissao = 'C' order by Nome_Vendedor

 /*20-Mostrar o menor e o maior salários da tabela vendedor*/
 select MIN(Sal_Fixo) as 'MIN(salariofixo)',MAX(Sal_Fixo) as 'MAX(salariofixo)' from VENDEDOR

 /*21-Mostrar a quantidade total pedida para o produto 'VINHO' de código 78' na tabela item_de_pedido.*/
 select SUM(Quantidade) from ITEM_DO_PEDIDO where Cod_Produto = 78

 /*22-Qual a média dos salários fixos dos vendedores*/
 select AVG(Sal_Fixo) as 'AVG(salariofixo)' from VENDEDOR

 /*23-Quantos vendedores ganham acima de R$ 2.500,00 de salário fixo?*/
 select COUNT(*) as 'MAIORSALARIO' from VENDEDOR where Sal_Fixo > 2500.00

 /*24-Quais as unidades de produtos, diferentes, na tabela produto?*/
 select distinct Uni_produto from PRODUTO 

 /*25-Listar o número de produtos que cada pedido contém.*/
 select Num_Pedido,COUNT(Num_Pedido) from ITEM_DO_PEDIDO group by Num_Pedido
 
 /*26-Listar os pedidos que têm mais do que três produtos.*/
 select Num_Pedido,COUNT(Quantidade)as'Quantidade' from ITEM_DO_PEDIDO group by Num_Pedido having COUNT(Num_Pedido) > 3

 /*27- Ver os pedidos de cada cliente*/
 select C.Nome_Cliente as 'Nome_Cliente', C.Cod_Cliente as 'Cod_Cliente', P.Num_Pedido as 'Num_Pedido' from PEDIDO as P inner join CLIENTE as C on C.Cod_Cliente = P.Cod_Cliente order by C.Nome_Cliente
 
 /*28- Juntar Clientes com Pedidos*/
 select C.Nome_Cliente as 'Nome_Cliente', C.Cod_Cliente as 'Cod_Cliente', P.Num_Pedido as 'Num_Pedido' from PEDIDO as P inner join CLIENTE as C on P.Cod_Cliente = P.Cod_Cliente order by P.Num_Pedido
 
 /*29- Quais são os clientes que têm pedido e os que não têm pedido.*/
 select C.Nome_Cliente as 'Nome_Cliente', P.Cod_Cliente as 'Cod_Cliente', P.Num_Pedido as 'Num_Pedido' from CLIENTE as C full outer join PEDIDO as P on C.Cod_Cliente = P.Cod_Cliente
 
 /*30- Quais clientes têm prazo de entrega superior a 15 dias e pertencem aos estados de São Paulo ('SP') ou Rio de Janeiro ('RJ')?*/
 select distinct C.Nome_Cliente,C.UF,P.Prazo_Entrega from PEDIDO as P inner join CLIENTE as C on P.Cod_Cliente = C.Cod_Cliente where P.Prazo_Entrega > 15 and (C.UF = 'SP' or C.UF = 'RJ')

 /*31- Mostrar os clientes e seus respectivos prazos de entrega, ordenados do maior para o menor*/
 select distinct C.Nome_Cliente,P.Prazo_Entrega from PEDIDO as P inner join CLIENTE as C on P.Cod_Cliente = C.Cod_Cliente order by P.Prazo_Entrega desc

 /*32- Apresentar os vendedores (ordenados) que emitiram pedidos com prazos de entrega superiores a 15 dias e tenham salários fixos iguais ou superiores a R$ 1.000,00.*/
 select distinct V.Nome_Vendedor, P.Prazo_Entrega from PEDIDO as P inner join VENDEDOR as V on P.Cod_Vendedor = V.Cod_Vendedor where P.Prazo_Entrega > 15 and V.Sal_Fixo > 999.99

 /*33- Mostre os clientes (ordenados) que têm prazo de entrega maior que 15 dias para o produto 'QUEIJO' e sejam do Rio de Janeiro.*/
 select C.Nome_Cliente from ITEM_DO_PEDIDO as I inner join PEDIDO as P on I.Num_Pedido = P.Num_Pedido inner join PRODUTO as PRO on I.Cod_Produto = PRO.Cod_Produto inner join CLIENTE as C on P.Cod_Cliente = C.Cod_Cliente where P.Prazo_Entrega > 15 and PRO.Desc_produto = 'Queijo' and C.UF = 'RJ' order by C.Nome_Cliente
 
 /*34- Mostre todos os vendedores que venderam chocolate em quantidade superior a 10 Kg*/
 select V.Nome_Vendedor from ITEM_DO_PEDIDO as I inner join PRODUTO as PRO on I.Cod_Produto = PRO.Cod_Produto inner join PEDIDO as P on I.Num_Pedido = P.Num_Pedido inner join VENDEDOR as V on P.Cod_Vendedor = V.Cod_Vendedor where I.Quantidade > 10 and PRO.Desc_produto = 'Chocolate'

 /*35- Quantos clientes fizeram pedido com o vendedor João?*/
 select Count(C.Nome_Cliente) as 'Clientes' from PEDIDO as P inner join CLIENTE as C on P.Cod_Cliente = C.Cod_Cliente inner join VENDEDOR as V on P.Cod_Vendedor = V.Cod_Vendedor where V.Nome_Vendedor = 'João'

 /*36- Quantos clientes da cidade do Rio de Janeiro e de Niterói tiveram seus pedidos tirados com o vendedor João? (Exiba o nome das Cidades e a quantidade.)*/
 select COUNT(distinct C.Nome_Cliente) as "Qtd. clientes", C.Cidade as "Cidade" from CLIENTE as C inner join PEDIDO as P on C.Cod_Cliente = P.Cod_Cliente inner join VENDEDOR as V on P.Cod_Vendedor = V.Cod_Vendedor where C.Cidade = 'Rio de Janeiro' or C.Cidade = 'Niteroi' and V.Nome_Vendedor = 'João' group by C.Cidade

 /*37- Listar todo o conteúdo de vendedor*/
 select * from VENDEDOR

 /*38- Que produtos participam de qualquer pedido cuja quantidade seja 10? (Exibe os nomes – Uso consulta encadeada, utilize IN)*/
 select Desc_produto from PRODUTO where Cod_Produto in (select Cod_Produto from ITEM_DO_PEDIDO where Quantidade = 10)

 /*39- Quais vendedores ganham um salário fixo abaixo da média? (Exibe os nomes, utilize AVG)*/
 select Nome_Vendedor from VENDEDOR where Sal_Fixo < (select AVG(Sal_Fixo) from VENDEDOR)

 /*40- Quais os produtos que não estão presentes em nenhum pedido? (Uso consulta encadeada, utilize NOT IN )*/
 select Desc_produto from PRODUTO where Cod_Produto not in (select Cod_Produto from ITEM_DO_PEDIDO)

 /*41- Quais vendedores que só venderam produtos por grama(G)? (Exibir o Cod do Vendedor e o nome)*/
 select V.Nome_Vendedor, V.Cod_Vendedor from ITEM_DO_PEDIDO as IP inner join PEDIDO as P on IP.Num_Pedido = P.Num_Pedido inner join VENDEDOR as V on P.Cod_Vendedor = V.Cod_Vendedor inner join PRODUTO as PRO on IP.Cod_Produto = PRO.Cod_Produto where PRO.Uni_produto = 'G'

 /*42- Quais Clientes estão presentes em mais de TRÊS pedidos? (Exibir os nomes)*/
 select C.Nome_Cliente from CLIENTE as C where exists (select count(*) from PEDIDO where Cod_Cliente = C.Cod_Cliente having COUNT(*)>3)

 /*43- Adicione o produto “PARAFUSO -> Kg , valor R$1,25. Cod 108” a tabela PRODUTO*/
 insert into PRODUTO(Cod_Produto, Uni_produto, Desc_produto, Valor_Unit) values (108,'Kg','Parafuso',1.25);
 select * from PRODUTO

 /*44- Alterar o valor unitário do parafuso de R$1,25 para R$1,62*/
 update PRODUTO set Valor_Unit = 1.62 where Desc_produto = 'Parafuso'
 /*45- Exibir o nome e Salário fixo de todos os vendedores.*/
 select Nome_Vendedor,Sal_Fixo from VENDEDOR
 /*46- Atualizar o salário fixo de todos os vendedores em 27% mais uma bonificação de R$100,00.*/
 update VENDEDOR set Sal_Fixo = (Sal_Fixo * 1.27)+100.00
 
 /*47- Acrescentar 2,5% ao preço unitário dos produtos que estejam abaixo da média dos preços para aqueles comprados a QUILO.*/
 update PRODUTO set Valor_Unit = (Valor_Unit*1.025) where Uni_produto = 'Kg' and Valor_Unit < (select AVG(Valor_Unit) from PRODUTO where Uni_produto = 'Kg')
 select * from PRODUTO