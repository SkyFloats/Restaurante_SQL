describe tb_cliente;
insert into tb_cliente (cpf_cliente, nome_cliente) values ("201.354.547-77", "Robertinho Bananinha");
insert into tb_cliente (cpf_cliente, nome_cliente) values ("110.354.547-77", "Joaozinho Bananinha"),("110.354.842-77", "Kwen Bananinha");
insert into tb_cliente (cpf_cliente, nome_cliente) values ("110.354.547-77", "Joaozinho Bananinha"),("110.354.842-77", "Kwen Bananinha"),("110.354.842-77", "Kwen Bananinha"),("110.354.842-77", "Kwen Bananinha"),("110.354.842-77", "Kwen Bananinha"),("110.354.842-77", "Kwen Bananinha"),("110.354.842-77", "Kwen Bananinha"),("110.354.842-77", "Kwen Bananinha");
delete from tb_cliente where nome_cliente = "Kwen Bananinha";
set sql_safe_updates = 0;

select * from tb_cliente;
select * from tb_pedido limit 10;

describe tb_pedido;

select tb_pedido.*,tb_situacao_pedido.nome_situacao_pedido as situacao
from tb_pedido
left join tb_situacao_pedido
on tb_pedido.codigo_situacao_pedido = tb_situacao_pedido.codigo_situacao_pedido limit 10;

select p.*,pt.nome_prato as prato,sp.nome_situacao_pedido as situacao
from tb_pedido p
left join tb_situacao_pedido sp
on p.codigo_situacao_pedido = sp.codigo_situacao_pedido limit 10;
select tb_cliente.nome_cliente as Cliente
from tb_cliente c
left join tb_cliente
on c.id_cliente = c.id_cliente limit 10;
