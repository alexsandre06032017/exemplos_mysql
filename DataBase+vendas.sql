#ddl
create database Vendas;
use Vendas;
create table cliente(
idCliente integer primary key auto_increment,
nome varchar(20) not null,
rua varchar(20) not null,
numero integer not null,
fone varchar(20) not null,
bairro varchar(20) not null,
cidade varchar(20) not null,
estado char(2) not null
);
create table fornecedor(
idFornecedor integer primary key auto_increment,
razaoSocial varchar(20) not null,
nomeFantasia varchar(20)not null,
telefone varchar(20) not null
);
create table produto(
idProduto integer primary key auto_increment,
nome varchar(20) not null,
precoUnitario numeric(12,2) not null,
idFornecedor integer not null references fornecedor(idFornecedor) 
);
create table notaFiscal(
numeroNota integer primary key auto_increment,
valorNota numeric(12,2) not null,
dataEmissao Date not null,
idCliente integer not null references cliente(idCliente)
);
create table itemNota(
numeroNota integer not null references notaFiscal(numeroNota),
idProduto integer not null references produto(idProduto),
primary key(numeroNota,idProduto),
qtdeItem integer not null,
valorItem numeric(12,2) not null
);

#dml
insert into cliente(nome,rua,numero,fone,bairro,cidade,estado) values ("Pessoa a","rua a",32,"00000001","bairro a","cidade a","aa"),
("Pessoa b","rua a",33,"00000010","bairro b","cidade b","ab"),
("Pessoa c","rua a",34,"00000100","bairro c","cidade c","ac"),
("Pessoa d","rua a",35,"00001000","bairro d","cidade d","ad"),
("Pessoa e","rua a",36,"00010000","bairro e","cidade e","ae"),
("Pessoa f","rua a",37,"00100000","bairro f","cidade f","af"),
("Pessoa g","rua a",38,"01000000","bairro g","cidade g","ag"),
("Pessoa h","rua a",39,"10000000","bairro h","cidade h","ah"),
("Pessoa i","rua a",40,"00000002","bairro i","cidade i","ai"),
("Pessoa j","rua j",41,"00000020","bairro j","cidade j","aj");
select * from cliente;

insert into fornecedor(razaoSocial,nomeFantasia,telefone) values("razao a", "nome fantasia a", "00000200"),
("razao b", "nome fantasia b", "00002000"),
("razao c", "nome fantasia c", "00020000"),
("razao d", "nome fantasia d", "00200000"),
("razao e", "nome fantasia e", "02000000"),
("razao f", "nome fantasia f", "20000000"),
("razao g", "nome fantasia g", "00000003"),
("razao h", "nome fantasia h", "00000030"),
("razao i", "nome fantasia i", "00000300"),
("razao j", "nome fantasia j", "00003000");
select * from fornecedor;

insert into produto(nome,precoUnitario,idFornecedor) values("produto a",1.00,1),
("produto b",2.00,2),
("produto c",3.00,3),
("produto d",5.00,4),
("produto e",8.00,5),
("produto f",13.00,6),
("produto g",21.00,7),
("produto h",34.00,8),
("produto i",55.00,9),
("produto j",89.00,10);
select * from produto;

insert into notaFiscal(valorNota,dataEmissao,idCliente) values(1.00,'2019-08-16',1),
(2.00,'2019-08-16',2),
(3.00,'2019-08-16',3),
(5.00,'2019-08-16',4),
(8.00,'2019-08-16',5),
(13.00,'2019-08-16',6),
(21.00,'2019-08-16',7),
(34.00,'2019-08-16',8),
(55.00,'2019-08-16',9),
(89.00,'2019-08-16',10);
select * from notaFiscal;

insert into itemNota(numeroNota,idProduto,qtdeItem,valorItem) values(1,1,1,1.0),
(2,2,2,2.0),
(3,3,3,3.0),
(4,4,4,5.0),
(5,5,5,8.0),
(6,6,6,13.0),
(7,7,7,21.0),
(8,8,8,34.0),
(9,9,9,55.0),
(10,10,10,89.0);
select * from itemNota;


/**insert into fornecedor(razaoSocial,nomeFantasia,telefone) values("razao x", "nome fantasia x", "00000500");
select * from fornecedor;

update fornecedor set nomeFantasia = "CasadeCarnesGatoMia" where idFornecedor = 11;

delete from fornecedor where idFornecedor = 5;

update produto set precoUnitario = precoUnitario * 1.05 where nome like "%h%";

update cliente set rua = "rua flores" where rua = "rua das flores";
select * from cliente;

delete from produto where nome like "%e%";
select * from produto
*/

#a)
select nome from cliente where estado = "ba";

#b)
select numeroNota from notafiscal where valorNota > 500.0 and valorNota < 2000.0;

#c)
select numeroNota from notafiscal where dataEmissao > '2015-01-01' and dataEmissao < '2015-05-30';

#d)
select numeroNota from notafiscal where dataEmissao = '2015-05-30';

#e)
select nome from produto where precoUnitario < 10.0;

#f)
select cliente.nome from cliente where cliente.cidade = "Porto Seguro" or cliente.cidade = "Eunapolis";

#g)
select fornecedor.idFornecedor,fornecedor.telefone,fornecedor.nomeFantasia from fornecedor;

#h)
select itemnota.idProduto from itemnota where itemnota.qtdeItem > 10 and itemnota.numeroNota = 1001;

#i)
select produto.nome from produto where produto.precoUnitario < 10.0 or produto.precoUnitario > 40.0;

#j)
select notafiscal.numeroNota,notafiscal.dataEmissao from notafiscal where notafiscal.valorNota > 1000.0 and notafiscal.valorNota < 2000.0;